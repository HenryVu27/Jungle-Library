-- Jungle Library Database Schema
-- Phase III Implementation - PostgreSQL
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

-- Drop tables if they exist (in reverse dependency order)
DROP TABLE IF EXISTS PAYMENT CASCADE;
DROP TABLE IF EXISTS INQUIRY CASCADE;
DROP TABLE IF EXISTS BORROWED CASCADE;
DROP TABLE IF EXISTS REVIEW CASCADE;
DROP TABLE IF EXISTS CATALOGS CASCADE;
DROP TABLE IF EXISTS WRITTENBY CASCADE;
DROP TABLE IF EXISTS BOOK CASCADE;
DROP TABLE IF EXISTS AUTHOR CASCADE;
DROP TABLE IF EXISTS PUBLISHER CASCADE;
DROP TABLE IF EXISTS WITHPROMO CASCADE;
DROP TABLE IF EXISTS PROMO CASCADE;
DROP TABLE IF EXISTS GUEST CASCADE;
DROP TABLE IF EXISTS LIBCARD CASCADE;
DROP TABLE IF EXISTS MEMBER CASCADE;
DROP TABLE IF EXISTS TRAINER CASCADE;
DROP TABLE IF EXISTS EMPLOYEE CASCADE;
DROP TABLE IF EXISTS PHONE CASCADE;
DROP TABLE IF EXISTS PERSON CASCADE;

-- 1. PERSON Table (Superclass for Employee and Member)
CREATE TABLE PERSON (
    PersonID        VARCHAR(4) PRIMARY KEY,
    FName           VARCHAR(50) NOT NULL,
    MName           VARCHAR(50),
    LName           VARCHAR(50) NOT NULL,
    Address         VARCHAR(200),
    Gender          VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    DateOfBirth     DATE NOT NULL,

    -- PersonID must follow format 'PXXX' where X is a digit
    CONSTRAINT chk_person_id_format CHECK (PersonID ~ '^P[0-9]{3}$')
);

-- 2. PHONE Table (Multivalued attribute of Person)
CREATE TABLE PHONE (
    PersonID        VARCHAR(4) NOT NULL,
    PhoneNumber     VARCHAR(20) NOT NULL,

    PRIMARY KEY (PersonID, PhoneNumber),
    FOREIGN KEY (PersonID) REFERENCES PERSON(PersonID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3. EMPLOYEE Table (Subclass of Person; EType indicates Manager, Supervisor, or Receptionist)
CREATE TABLE EMPLOYEE (
    EmployeeID      VARCHAR(4) PRIMARY KEY,
    StartDate       DATE NOT NULL,
    EType           VARCHAR(15) NOT NULL CHECK (EType IN ('Manager', 'Supervisor', 'Receptionist')),
    TrainedByID     VARCHAR(4),

    FOREIGN KEY (EmployeeID) REFERENCES PERSON(PersonID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 4. TRAINER Table (Category/union of Manager and Supervisor - only they can train)
CREATE TABLE TRAINER (
    TrainerID       VARCHAR(4) PRIMARY KEY,

    FOREIGN KEY (TrainerID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Add the foreign key constraint from EMPLOYEE.TrainedByID to TRAINER
ALTER TABLE EMPLOYEE
    ADD CONSTRAINT fk_employee_trainedby
    FOREIGN KEY (TrainedByID) REFERENCES TRAINER(TrainerID)
        ON DELETE SET NULL ON UPDATE CASCADE;

-- 5. MEMBER Table (Subclass of Person; Level indicates Silver or Gold)
CREATE TABLE MEMBER (
    MemberID        VARCHAR(4) PRIMARY KEY,
    Level           VARCHAR(10) NOT NULL CHECK (Level IN ('Silver', 'Gold')),

    FOREIGN KEY (MemberID) REFERENCES PERSON(PersonID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 6. LIBCARD Table (Library card issued to each member, 1:1 with Member)
CREATE TABLE LIBCARD (
    CardID          VARCHAR(10) PRIMARY KEY,
    MemberID        VARCHAR(4) NOT NULL UNIQUE,
    IssueDate       DATE NOT NULL,

    FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 7. GUEST Table (Weak entity - guests of Gold Members, GuestID unique per member)
CREATE TABLE GUEST (
    GuestOfID       VARCHAR(4) NOT NULL,  -- FK to Member (must be Gold)
    GuestID         VARCHAR(10) NOT NULL,
    Name            VARCHAR(100) NOT NULL,
    Address         VARCHAR(200),
    ContactInfo     VARCHAR(100),

    PRIMARY KEY (GuestOfID, GuestID),
    FOREIGN KEY (GuestOfID) REFERENCES MEMBER(MemberID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. PROMO Table (Promotions associated with library cards)
CREATE TABLE PROMO (
    PromoCode       VARCHAR(20) PRIMARY KEY,
    PromoDesc       VARCHAR(500)
);

-- 9. WITHPROMO Table (M:N relationship between LIBCARD and PROMO)
CREATE TABLE WITHPROMO (
    CardID          VARCHAR(10) NOT NULL,
    PromoCode       VARCHAR(20) NOT NULL,

    PRIMARY KEY (CardID, PromoCode),
    FOREIGN KEY (CardID) REFERENCES LIBCARD(CardID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PromoCode) REFERENCES PROMO(PromoCode)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 10. PUBLISHER Table
CREATE TABLE PUBLISHER (
    PublisherID     VARCHAR(10) PRIMARY KEY,
    PublisherName   VARCHAR(100) NOT NULL
);

-- 11. AUTHOR Table
CREATE TABLE AUTHOR (
    AuthorID        VARCHAR(10) PRIMARY KEY,
    AuthorName      VARCHAR(100) NOT NULL
);

-- 12. BOOK Table (Each book is published by exactly one publisher)
CREATE TABLE BOOK (
    BookID          VARCHAR(10) PRIMARY KEY,
    PublisherID     VARCHAR(10) NOT NULL,
    BookTitle       VARCHAR(200) NOT NULL,

    FOREIGN KEY (PublisherID) REFERENCES PUBLISHER(PublisherID)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 13. WRITTENBY Table (M:N relationship between Author and Book)
CREATE TABLE WRITTENBY (
    AuthorID        VARCHAR(10) NOT NULL,
    BookID          VARCHAR(10) NOT NULL,

    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES AUTHOR(AuthorID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 14. CATALOGS Table (M:N between Book and Manager, one category per day)
CREATE TABLE CATALOGS (
    BookID          VARCHAR(10) NOT NULL,
    ManagerID       VARCHAR(4) NOT NULL,
    Category        VARCHAR(10) NOT NULL CHECK (Category IN ('Cate. 1', 'Cate. 2', 'Cate. 3')),
    CatalogDate     DATE NOT NULL,

    PRIMARY KEY (BookID, ManagerID, CatalogDate),
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ManagerID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 15. REVIEW Table (M:N between Person and Book with time, content, rating)
CREATE TABLE REVIEW (
    BookID          VARCHAR(10) NOT NULL,
    PersonID        VARCHAR(4) NOT NULL,
    CommentTime     TIMESTAMP NOT NULL,
    Content         TEXT,
    Rating          INTEGER NOT NULL CHECK (Rating >= 1 AND Rating <= 5),

    PRIMARY KEY (BookID, PersonID, CommentTime),
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PersonID) REFERENCES PERSON(PersonID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 16. BORROWED Table (Books borrowed by members, tracked by receptionists)
CREATE TABLE BORROWED (
    BorrowedID      VARCHAR(10) PRIMARY KEY,
    ReceptID        VARCHAR(4) NOT NULL,
    BookID          VARCHAR(10) NOT NULL,
    MemberID        VARCHAR(4) NOT NULL,
    IssueDate       DATE NOT NULL,
    DueDate         DATE NOT NULL,

    FOREIGN KEY (ReceptID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    -- DueDate must be after IssueDate
    CONSTRAINT chk_due_after_issue CHECK (DueDate > IssueDate)
);

-- 17. INQUIRY Table (Member inquiries resolved by receptionists)
CREATE TABLE INQUIRY (
    InquiryID       VARCHAR(10) PRIMARY KEY,
    ReceptID        VARCHAR(4) NOT NULL,
    MemberID        VARCHAR(4) NOT NULL,
    InquiryTime     TIMESTAMP NOT NULL,
    Status          VARCHAR(20) NOT NULL CHECK (Status IN ('Open', 'In Progress', 'Resolved', 'Closed')),
    Rating          INTEGER CHECK (Rating >= 1 AND Rating <= 5),

    FOREIGN KEY (ReceptID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 18. PAYMENT Table (Payment details for borrowed books, 1:1 with BORROWED)
CREATE TABLE PAYMENT (
    PaymentID       VARCHAR(10) PRIMARY KEY,
    BorrowedID      VARCHAR(10) NOT NULL UNIQUE,
    PaymentTime     TIMESTAMP NOT NULL,
    Method          VARCHAR(20) NOT NULL CHECK (Method IN ('Cash', 'Debit Card', 'Credit Card')),
    Amount          DECIMAL(10, 2) NOT NULL CHECK (Amount >= 0),

    FOREIGN KEY (BorrowedID) REFERENCES BORROWED(BorrowedID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Additional Constraints via Triggers

-- Trigger: Ensure Employee is at least 18 years old at StartDate
CREATE OR REPLACE FUNCTION check_employee_age()
RETURNS TRIGGER AS $$
DECLARE
    dob DATE;
BEGIN
    SELECT DateOfBirth INTO dob FROM PERSON WHERE PersonID = NEW.EmployeeID;
    IF AGE(NEW.StartDate, dob) < INTERVAL '18 years' THEN
        RAISE EXCEPTION 'Employee must be at least 18 years old at start date';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_employee_age
BEFORE INSERT OR UPDATE ON EMPLOYEE
FOR EACH ROW EXECUTE FUNCTION check_employee_age();

-- Trigger: Ensure Trainer is a Manager or Supervisor
CREATE OR REPLACE FUNCTION check_trainer_type()
RETURNS TRIGGER AS $$
DECLARE
    emp_type VARCHAR(15);
BEGIN
    SELECT EType INTO emp_type FROM EMPLOYEE WHERE EmployeeID = NEW.TrainerID;
    IF emp_type NOT IN ('Manager', 'Supervisor') THEN
        RAISE EXCEPTION 'Trainer must be a Manager or Supervisor, not %', emp_type;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_trainer_type
BEFORE INSERT OR UPDATE ON TRAINER
FOR EACH ROW EXECUTE FUNCTION check_trainer_type();

-- Trigger: Ensure Guest is associated with a Gold Member
CREATE OR REPLACE FUNCTION check_guest_gold_member()
RETURNS TRIGGER AS $$
DECLARE
    member_level VARCHAR(10);
BEGIN
    SELECT Level INTO member_level FROM MEMBER WHERE MemberID = NEW.GuestOfID;
    IF member_level != 'Gold' THEN
        RAISE EXCEPTION 'Guests can only be associated with Gold Members';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_guest_gold_member
BEFORE INSERT OR UPDATE ON GUEST
FOR EACH ROW EXECUTE FUNCTION check_guest_gold_member();

-- Trigger: Ensure ManagerID in CATALOGS references a Manager
CREATE OR REPLACE FUNCTION check_catalogs_manager()
RETURNS TRIGGER AS $$
DECLARE
    emp_type VARCHAR(15);
BEGIN
    SELECT EType INTO emp_type FROM EMPLOYEE WHERE EmployeeID = NEW.ManagerID;
    IF emp_type != 'Manager' THEN
        RAISE EXCEPTION 'Only Managers can catalog books';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_catalogs_manager
BEFORE INSERT OR UPDATE ON CATALOGS
FOR EACH ROW EXECUTE FUNCTION check_catalogs_manager();

-- Trigger: Ensure ReceptID in BORROWED references a Receptionist
CREATE OR REPLACE FUNCTION check_borrowed_receptionist()
RETURNS TRIGGER AS $$
DECLARE
    emp_type VARCHAR(15);
BEGIN
    SELECT EType INTO emp_type FROM EMPLOYEE WHERE EmployeeID = NEW.ReceptID;
    IF emp_type != 'Receptionist' THEN
        RAISE EXCEPTION 'Only Receptionists can track borrowed books';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_borrowed_receptionist
BEFORE INSERT OR UPDATE ON BORROWED
FOR EACH ROW EXECUTE FUNCTION check_borrowed_receptionist();

-- Trigger: Ensure ReceptID in INQUIRY references a Receptionist
CREATE OR REPLACE FUNCTION check_inquiry_receptionist()
RETURNS TRIGGER AS $$
DECLARE
    emp_type VARCHAR(15);
BEGIN
    SELECT EType INTO emp_type FROM EMPLOYEE WHERE EmployeeID = NEW.ReceptID;
    IF emp_type != 'Receptionist' THEN
        RAISE EXCEPTION 'Only Receptionists can resolve inquiries';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_inquiry_receptionist
BEFORE INSERT OR UPDATE ON INQUIRY
FOR EACH ROW EXECUTE FUNCTION check_inquiry_receptionist();

-- Trigger: Ensure only Receptionists have TrainedByID
CREATE OR REPLACE FUNCTION check_trainedby_receptionist()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.TrainedByID IS NOT NULL AND NEW.EType != 'Receptionist' THEN
        RAISE EXCEPTION 'Only Receptionists can have a trainer';
    END IF;
    IF NEW.TrainedByID IS NULL AND NEW.EType = 'Receptionist' THEN
        RAISE EXCEPTION 'Receptionists must have a trainer';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_trainedby_receptionist
BEFORE INSERT OR UPDATE ON EMPLOYEE
FOR EACH ROW EXECUTE FUNCTION check_trainedby_receptionist();

-- End of Schema
