-- CREATE TABLEs, being sure to perform these in an order that allows all
-- foreign key declarations to reference tables that have already been
-- created.

-- 1. PUBLISHER
CREATE TABLE PUBLISHER (
    PublisherID   INT          PRIMARY KEY,
    PublisherName VARCHAR(200) NOT NULL
);

-- 2. AUTHOR
CREATE TABLE AUTHOR (
    AuthorID   INT          PRIMARY KEY,
    AuthorName VARCHAR(200) NOT NULL
);

-- 3. PERSON
CREATE TABLE PERSON (
    PersonID    INT          PRIMARY KEY,
    FName       VARCHAR(100) NOT NULL,
    MName       VARCHAR(100),
    LName       VARCHAR(100) NOT NULL,
    Address     VARCHAR(300),
    Gender      VARCHAR(20),
    DateOfBirth DATE
);

-- 4. MEMBER
-- MemberID is both PK and FK to PERSON(PersonID)
CREATE TABLE MEMBER (
    MemberID INT          PRIMARY KEY,
    Level    VARCHAR(20)  NOT NULL,
    CONSTRAINT fk_member_person
        FOREIGN KEY (MemberID) REFERENCES PERSON(PersonID)
);

-- 5. EMPLOYEE
-- TrainedByID is a recursive FK to EMPLOYEE(EmployeeID)
CREATE TABLE EMPLOYEE (
    EmployeeID   INT          PRIMARY KEY,
    StartDate    DATE         NOT NULL,
    EType        VARCHAR(50)  NOT NULL,
    TrainedByID  INT,
    CONSTRAINT fk_employee_trainer
        FOREIGN KEY (TrainedByID) REFERENCES EMPLOYEE(EmployeeID)
);

-- 6. BOOK
CREATE TABLE BOOK (
    BookID      INT          PRIMARY KEY,
    PublisherID INT          NOT NULL,
    BookTitle   VARCHAR(300) NOT NULL,
    CONSTRAINT fk_book_publisher
        FOREIGN KEY (PublisherID) REFERENCES PUBLISHER(PublisherID)
);

-- 7. PROMO
CREATE TABLE PROMO (
    PromoCode VARCHAR(50)  PRIMARY KEY,
    PromoDesc VARCHAR(300)
);

-- 8. LIBCARD
CREATE TABLE LIBCARD (
    CardID    INT         PRIMARY KEY,
    MemberID  INT         NOT NULL,
    IssueDate DATE        NOT NULL,
    CONSTRAINT fk_libcard_member
        FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID)
);

-- 9. PHONE
-- Composite PK: (PersonID, PhoneNumber)
CREATE TABLE PHONE (
    PersonID    INT          NOT NULL,
    PhoneNumber VARCHAR(50)  NOT NULL,
    PRIMARY KEY (PersonID, PhoneNumber),
    CONSTRAINT fk_phone_person
        FOREIGN KEY (PersonID) REFERENCES PERSON(PersonID)
);

-- 10. WRITTENBY
-- Composite PK: (AuthorID, BookID)
CREATE TABLE WRITTENBY (
    AuthorID INT NOT NULL,
    BookID   INT NOT NULL,
    PRIMARY KEY (AuthorID, BookID),
    CONSTRAINT fk_writtenby_author
        FOREIGN KEY (AuthorID) REFERENCES AUTHOR(AuthorID),
    CONSTRAINT fk_writtenby_book
        FOREIGN KEY (BookID)   REFERENCES BOOK(BookID)
);

-- 11. CATALOGS
-- Composite PK: (BookID, ManagerID)
CREATE TABLE CATALOGS (
    BookID    INT          NOT NULL,
    ManagerID INT          NOT NULL,
    Category  VARCHAR(100) NOT NULL,
    CatalogDate DATE       NOT NULL,
    PRIMARY KEY (BookID, ManagerID),
    CONSTRAINT fk_catalogs_book
        FOREIGN KEY (BookID)    REFERENCES BOOK(BookID),
    CONSTRAINT fk_catalogs_employee
        FOREIGN KEY (ManagerID) REFERENCES EMPLOYEE(EmployeeID)
);

-- 12. REVIEW
-- Composite PK: (BookID, PersonID)
CREATE TABLE REVIEW (
    BookID   INT          NOT NULL,
    PersonID INT          NOT NULL,
    CommentTime DATE      NOT NULL,
    Content  VARCHAR(2000),
    Rating   INT,
    PRIMARY KEY (BookID, PersonID),
    CONSTRAINT fk_review_book
        FOREIGN KEY (BookID)   REFERENCES BOOK(BookID),
    CONSTRAINT fk_review_person
        FOREIGN KEY (PersonID) REFERENCES PERSON(PersonID)
);

-- 13. INQUIRY
CREATE TABLE INQUIRY (
    InquiryID   INT          PRIMARY KEY,
    ReceptID    INT          NOT NULL,
    MemberID    INT          NOT NULL,
    InquiryTime DATE         NOT NULL,
    Status      VARCHAR(50),
    Rating      INT,
    CONSTRAINT fk_inquiry_recept
        FOREIGN KEY (ReceptID) REFERENCES EMPLOYEE(EmployeeID),
    CONSTRAINT fk_inquiry_member
        FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID)
);

-- 14. BORROWED
CREATE TABLE BORROWED (
    BorrowedID INT          PRIMARY KEY,
    ReceptID   INT          NOT NULL,
    BookID     INT          NOT NULL,
    MemberID   INT          NOT NULL,
    IssueDate  DATE         NOT NULL,
    DueDate    DATE         NOT NULL,
    CONSTRAINT fk_borrowed_recept
        FOREIGN KEY (ReceptID) REFERENCES EMPLOYEE(EmployeeID),
    CONSTRAINT fk_borrowed_book
        FOREIGN KEY (BookID)   REFERENCES BOOK(BookID),
    CONSTRAINT fk_borrowed_member
        FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID)
);

-- 15. PAYMENT
CREATE TABLE PAYMENT (
    PaymentID   INT           PRIMARY KEY,
    BorrowedID  INT           NOT NULL,
    PaymentTime DATE          NOT NULL,
    Method      VARCHAR(50)   NOT NULL,
    Amount      DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_payment_borrowed
        FOREIGN KEY (BorrowedID) REFERENCES BORROWED(BorrowedID)
);

-- 16. GUEST
-- Composite PK: (GuestofID, GuestID)
CREATE TABLE GUEST (
    GuestofID    INT          NOT NULL,
    GuestID      INT          NOT NULL,
    Name         VARCHAR(200) NOT NULL,
    Address      VARCHAR(300),
    ContactInfo  VARCHAR(200),
    PRIMARY KEY (GuestofID, GuestID),
    CONSTRAINT fk_guest_member
        FOREIGN KEY (GuestofID) REFERENCES MEMBER(MemberID)
);

-- 17. WITHPROMO
-- Composite PK: (CardID, PromoCode)
CREATE TABLE WITHPROMO (
    CardID    INT          NOT NULL,
    PromoCode VARCHAR(50)  NOT NULL,
    PRIMARY KEY (CardID, PromoCode),
    CONSTRAINT fk_withpromo_libcard
        FOREIGN KEY (CardID)    REFERENCES LIBCARD(CardID),
    CONSTRAINT fk_withpromo_promo
        FOREIGN KEY (PromoCode) REFERENCES PROMO(PromoCode)
);
