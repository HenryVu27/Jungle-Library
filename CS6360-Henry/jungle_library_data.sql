-- Jungle Library Sample Data
-- Phase III - PostgreSQL
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

INSERT INTO PERSON (PersonID, FName, MName, LName, Address, Gender, DateOfBirth) VALUES
('P001', 'John', 'Michael', 'Smith', '123 Oak Street, Dallas, TX', 'Male', '1985-03-15'),
('P002', 'Sarah', 'Anne', 'Johnson', '456 Elm Avenue, Plano, TX', 'Female', '1990-07-22'),
('P003', 'Robert', NULL, 'Williams', '789 Pine Road, Frisco, TX', 'Male', '1988-11-08'),
('P004', 'Emily', 'Rose', 'Brown', '321 Maple Lane, Richardson, TX', 'Female', '1992-05-30'),
('P005', 'Michael', 'James', 'Davis', '654 Cedar Blvd, Garland, TX', 'Male', '1987-09-12'),
('P006', 'Jennifer', NULL, 'Miller', '987 Birch Street, Irving, TX', 'Female', '1995-02-18'),
('P007', 'David', 'Lee', 'Wilson', '147 Spruce Ave, Arlington, TX', 'Male', '1983-06-25'),
('P008', 'Amanda', 'Kay', 'Moore', '258 Willow Drive, Mesquite, TX', 'Female', '1991-12-03'),
('P009', 'Christopher', NULL, 'Taylor', '369 Ash Court, Carrollton, TX', 'Male', '1989-04-17'),
('P010', 'Jessica', 'Lynn', 'Anderson', '471 Hickory Way, Lewisville, TX', 'Female', '1994-08-29'),
('P011', 'William', 'Thomas', 'Jackson', '582 Oakwood Dr, Dallas, TX', 'Male', '1980-01-05'),
('P012', 'Ashley', NULL, 'White', '693 Pinecrest Ln, Plano, TX', 'Female', '1997-10-14'),
('P013', 'Daniel', 'Ray', 'Harris', '704 Elmwood Ave, Frisco, TX', 'Male', '1986-07-21'),
('P014', 'Stephanie', 'Marie', 'Martin', '815 Cedarhill Rd, Richardson, TX', 'Female', '1993-03-08'),
('P015', 'Matthew', NULL, 'Thompson', '926 Maplewood St, Garland, TX', 'Male', '1984-11-27'),
('P016', 'Nicole', 'Ann', 'Garcia', '037 Birchwood Blvd, Irving, TX', 'Female', '1996-06-16'),
('P017', 'Joshua', 'Allen', 'Martinez', '148 Sprucewood Ct, Arlington, TX', 'Male', '1982-09-03'),
('P018', 'Rachel', NULL, 'Robinson', '259 Willowbrook Dr, Mesquite, TX', 'Female', '1998-04-22'),
('P019', 'Andrew', 'Scott', 'Clark', '360 Ashwood Ln, Carrollton, TX', 'Male', '1981-12-11'),
('P020', 'Lauren', 'Elizabeth', 'Rodriguez', '471 Hickoryhill Ave, Lewisville, TX', 'Female', '1999-02-28'),
('P021', 'Kevin', 'Paul', 'Lewis', '582 Redwood Dr, Dallas, TX', 'Male', '1979-05-19'),
('P022', 'Megan', NULL, 'Lee', '693 Sequoia Ln, Plano, TX', 'Female', '2000-08-07'),
('P023', 'Brian', 'Edward', 'Walker', '704 Cypress Ave, Frisco, TX', 'Male', '1978-03-26'),
('P024', 'Samantha', 'Grace', 'Hall', '815 Magnolia Rd, Richardson, TX', 'Female', '1995-11-13'),
('P025', 'Jason', NULL, 'Allen', '926 Dogwood St, Garland, TX', 'Male', '1977-07-02'),
('P026', 'Heather', 'Dawn', 'Young', '037 Sycamore Blvd, Irving, TX', 'Female', '1994-01-21'),
('P027', 'Ryan', 'Joseph', 'King', '148 Poplar Ct, Arlington, TX', 'Male', '1976-10-09'),
('P028', 'Amber', NULL, 'Wright', '259 Chestnut Dr, Mesquite, TX', 'Female', '1993-06-28'),
('P029', 'Justin', 'Mark', 'Scott', '360 Walnut Ln, Carrollton, TX', 'Male', '1975-02-15'),
('P030', 'Brittany', 'Sue', 'Green', '471 Pecan Ave, Lewisville, TX', 'Female', '1992-09-04');

INSERT INTO PHONE (PersonID, PhoneNumber) VALUES
('P001', '214-555-0101'),
('P001', '469-555-0102'),
('P002', '972-555-0201'),
('P003', '214-555-0301'),
('P003', '469-555-0302'),
('P003', '972-555-0303'),
('P004', '214-555-0401'),
('P005', '972-555-0501'),
('P006', '214-555-0601'),
('P007', '469-555-0701'),
('P008', '972-555-0801'),
('P009', '214-555-0901'),
('P010', '469-555-1001'),
('P011', '972-555-1101'),
('P012', '214-555-1201'),
('P013', '469-555-1301'),
('P014', '972-555-1401'),
('P015', '214-555-1501'),
('P016', '469-555-1601'),
('P017', '972-555-1701'),
('P018', '214-555-1801'),
('P019', '469-555-1901'),
('P020', '972-555-2001');

INSERT INTO EMPLOYEE (EmployeeID, StartDate, EType, TrainedByID) VALUES
('P001', '2020-01-15', 'Manager', NULL),
('P002', '2020-03-20', 'Manager', NULL),
('P003', '2025-10-15', 'Supervisor', NULL),
('P004', '2025-11-01', 'Supervisor', NULL);

INSERT INTO TRAINER (TrainerID) VALUES
('P001'),
('P002'),
('P003'),
('P004');

INSERT INTO EMPLOYEE (EmployeeID, StartDate, EType, TrainedByID) VALUES
('P005', '2022-02-14', 'Receptionist', 'P001'),
('P006', '2022-06-01', 'Receptionist', 'P001'),
('P007', '2023-01-10', 'Receptionist', 'P002'),
('P008', '2023-04-15', 'Receptionist', 'P003'),
('P009', '2024-09-20', 'Receptionist', 'P003'),
('P010', '2024-10-15', 'Receptionist', 'P004');

INSERT INTO MEMBER (MemberID, Level) VALUES
('P001', 'Gold'),
('P002', 'Gold'),
('P005', 'Gold'),
('P008', 'Silver'),
('P011', 'Gold'),
('P013', 'Gold'),
('P015', 'Gold'),
('P017', 'Gold'),
('P019', 'Gold'),
('P021', 'Gold'),
('P012', 'Silver'),
('P014', 'Silver'),
('P016', 'Silver'),
('P018', 'Silver'),
('P020', 'Silver'),
('P022', 'Silver'),
('P023', 'Silver'),
('P024', 'Silver'),
('P025', 'Silver'),
('P026', 'Silver'),
('P027', 'Silver'),
('P028', 'Silver'),
('P029', 'Silver'),
('P030', 'Silver');

INSERT INTO LIBCARD (CardID, MemberID, IssueDate) VALUES
('LC001', 'P001', '2020-01-20'),
('LC002', 'P002', '2020-03-25'),
('LC003', 'P005', '2022-02-20'),
('LC004', 'P008', '2023-04-20'),
('LC005', 'P011', '2021-06-15'),
('LC006', 'P012', '2022-01-10'),
('LC007', 'P013', '2021-08-22'),
('LC008', 'P014', '2022-04-05'),
('LC009', 'P015', '2021-11-30'),
('LC010', 'P016', '2022-07-18'),
('LC011', 'P017', '2021-03-12'),
('LC012', 'P018', '2022-09-28'),
('LC013', 'P019', '2021-01-05'),
('LC014', 'P020', '2023-02-14'),
('LC015', 'P021', '2020-12-01'),
('LC016', 'P022', '2023-05-20'),
('LC017', 'P023', '2020-08-15'),
('LC018', 'P024', '2022-11-08'),
('LC019', 'P025', '2020-06-25'),
('LC020', 'P026', '2023-01-30'),
('LC021', 'P027', '2020-04-10'),
('LC022', 'P028', '2023-03-22'),
('LC023', 'P029', '2020-02-28'),
('LC024', 'P030', '2023-07-15');

INSERT INTO GUEST (GuestOfID, GuestID, Name, Address, ContactInfo) VALUES
('P001', 'G001', 'Alice Cooper', '100 Guest Lane, Dallas, TX', 'alice@email.com'),
('P001', 'G002', 'Bob Dylan', '101 Guest Lane, Dallas, TX', 'bob@email.com'),
('P001', 'G003', 'Carol King', '102 Guest Lane, Dallas, TX', 'carol@email.com'),
('P002', 'G001', 'Diana Ross', '200 Visitor Ave, Plano, TX', 'diana@email.com'),
('P002', 'G002', 'Elvis Presley', '201 Visitor Ave, Plano, TX', 'elvis@email.com'),
('P005', 'G001', 'Frank Sinatra', '300 Tourist Blvd, Garland, TX', 'frank@email.com'),
('P011', 'G001', 'Grace Kelly', '400 Traveler Rd, Dallas, TX', 'grace@email.com'),
('P011', 'G002', 'Henry Ford', '401 Traveler Rd, Dallas, TX', 'henry@email.com'),
('P011', 'G003', 'Irene Dunne', '402 Traveler Rd, Dallas, TX', 'irene@email.com'),
('P011', 'G004', 'Jack Nicholson', '403 Traveler Rd, Dallas, TX', 'jack@email.com'),
('P013', 'G001', 'Kate Winslet', '500 Explorer St, Frisco, TX', 'kate@email.com'),
('P015', 'G001', 'Leonardo DiCaprio', '600 Wanderer Ln, Garland, TX', 'leo@email.com'),
('P015', 'G002', 'Meryl Streep', '601 Wanderer Ln, Garland, TX', 'meryl@email.com'),
('P017', 'G001', 'Nicolas Cage', '700 Nomad Ave, Arlington, TX', 'nic@email.com'),
('P019', 'G001', 'Olivia Newton', '800 Roamer Blvd, Carrollton, TX', 'olivia@email.com'),
('P019', 'G002', 'Patrick Stewart', '801 Roamer Blvd, Carrollton, TX', 'patrick@email.com'),
('P021', 'G001', 'Quentin Tarantino', '900 Drifter Ct, Dallas, TX', 'quentin@email.com');

INSERT INTO PROMO (PromoCode, PromoDesc) VALUES
('SUMMER2024', 'Summer reading program - 20% off late fees'),
('NEWYEAR25', 'New Year special - Free first month for new members'),
('BOOKWORM', 'Bookworm discount - 10% off all purchases'),
('STUDENT', 'Student discount - 15% off with valid ID'),
('SENIOR', 'Senior citizen discount - 25% off');

INSERT INTO WITHPROMO (CardID, PromoCode) VALUES
('LC001', 'SUMMER2024'),
('LC001', 'BOOKWORM'),
('LC002', 'SUMMER2024'),
('LC005', 'NEWYEAR25'),
('LC006', 'STUDENT'),
('LC007', 'BOOKWORM'),
('LC010', 'STUDENT'),
('LC015', 'SENIOR'),
('LC017', 'SENIOR'),
('LC019', 'SENIOR'),
('LC021', 'SENIOR');

INSERT INTO PUBLISHER (PublisherID, PublisherName) VALUES
('PUB001', 'Penguin Random House'),
('PUB002', 'HarperCollins'),
('PUB003', 'Simon & Schuster'),
('PUB004', 'Macmillan Publishers'),
('PUB005', 'Hachette Book Group');

INSERT INTO AUTHOR (AuthorID, AuthorName) VALUES
('AUT001', 'Stephen King'),
('AUT002', 'J.K. Rowling'),
('AUT003', 'James Patterson'),
('AUT004', 'Michelle Obama'),
('AUT005', 'Dan Brown'),
('AUT006', 'John Grisham'),
('AUT007', 'Agatha Christie'),
('AUT008', 'Dr. Seuss'),
('AUT009', 'Mark Twain'),
('AUT010', 'Jane Austen');

INSERT INTO BOOK (BookID, PublisherID, BookTitle) VALUES
('BK001', 'PUB001', 'The Shining'),
('BK002', 'PUB001', 'It'),
('BK003', 'PUB002', 'Harry Potter and the Sorcerers Stone'),
('BK004', 'PUB002', 'Harry Potter and the Chamber of Secrets'),
('BK005', 'PUB003', 'Along Came a Spider'),
('BK006', 'PUB003', 'Kiss the Girls'),
('BK007', 'PUB004', 'Becoming'),
('BK008', 'PUB005', 'The Da Vinci Code'),
('BK009', 'PUB005', 'Angels and Demons'),
('BK010', 'PUB001', 'The Firm'),
('BK011', 'PUB002', 'Murder on the Orient Express'),
('BK012', 'PUB003', 'The Cat in the Hat'),
('BK013', 'PUB004', 'Green Eggs and Ham'),
('BK014', 'PUB005', 'The Adventures of Tom Sawyer'),
('BK015', 'PUB001', 'Pride and Prejudice'),
('BK016', 'PUB002', 'Sense and Sensibility'),
('BK017', 'PUB003', 'Doctor Sleep'),
('BK018', 'PUB004', 'Harry Potter and the Prisoner of Azkaban'),
('BK019', 'PUB005', 'A Time to Kill'),
('BK020', 'PUB001', 'Inferno');

INSERT INTO WRITTENBY (AuthorID, BookID) VALUES
('AUT001', 'BK001'),
('AUT001', 'BK002'),
('AUT001', 'BK017'),
('AUT002', 'BK003'),
('AUT002', 'BK004'),
('AUT002', 'BK018'),
('AUT003', 'BK005'),
('AUT003', 'BK006'),
('AUT004', 'BK007'),
('AUT005', 'BK008'),
('AUT005', 'BK009'),
('AUT005', 'BK020'),
('AUT006', 'BK010'),
('AUT006', 'BK019'),
('AUT007', 'BK011'),
('AUT008', 'BK012'),
('AUT008', 'BK013'),
('AUT009', 'BK014'),
('AUT010', 'BK015'),
('AUT010', 'BK016');

INSERT INTO CATALOGS (BookID, ManagerID, Category, CatalogDate) VALUES
('BK001', 'P001', 'Cate. 1', '2024-10-01'),
('BK002', 'P001', 'Cate. 1', '2024-10-02'),
('BK003', 'P001', 'Cate. 2', '2024-10-03'),
('BK004', 'P001', 'Cate. 1', '2025-11-10'),
('BK005', 'P001', 'Cate. 2', '2025-11-11'),
('BK006', 'P001', 'Cate. 3', '2025-11-12'),
('BK007', 'P001', 'Cate. 1', '2025-11-17'),
('BK008', 'P001', 'Cate. 2', '2025-11-18'),
('BK009', 'P001', 'Cate. 3', '2025-11-19'),
('BK010', 'P001', 'Cate. 1', '2025-11-24'),
('BK011', 'P001', 'Cate. 2', '2025-11-25'),
('BK012', 'P001', 'Cate. 3', '2025-11-26'),
('BK013', 'P001', 'Cate. 1', '2025-12-01'),
('BK014', 'P001', 'Cate. 2', '2025-12-02'),
('BK015', 'P001', 'Cate. 3', '2025-12-03'),
('BK016', 'P002', 'Cate. 2', '2025-11-15'),
('BK017', 'P002', 'Cate. 3', '2025-11-16'),
('BK018', 'P002', 'Cate. 1', '2025-11-20'),
('BK019', 'P002', 'Cate. 2', '2025-11-25'),
('BK020', 'P002', 'Cate. 3', '2025-12-01');

INSERT INTO REVIEW (BookID, PersonID, CommentTime, Content, Rating) VALUES
('BK001', 'P011', '2024-06-15 10:30:00', 'Absolutely terrifying! A masterpiece.', 5),
('BK001', 'P012', '2024-07-20 14:45:00', 'Could not put it down.', 4),
('BK002', 'P013', '2024-08-10 09:15:00', 'Stephen King at his best!', 5),
('BK002', 'P014', '2024-08-25 16:30:00', 'Creepy and engaging.', 4),
('BK010', 'P015', '2024-09-05 11:00:00', 'Great legal thriller.', 5),
('BK015', 'P016', '2024-09-18 13:20:00', 'Classic romance, beautifully written.', 5),
('BK020', 'P017', '2024-10-01 15:45:00', 'Another Dan Brown page-turner.', 4),
('BK003', 'P018', '2024-06-20 10:00:00', 'Magical and enchanting!', 5),
('BK003', 'P019', '2024-07-05 12:30:00', 'Perfect for all ages.', 5),
('BK004', 'P020', '2024-07-25 14:00:00', 'Even better than the first!', 5),
('BK005', 'P021', '2024-08-15 09:30:00', 'Thrilling detective story.', 4),
('BK006', 'P022', '2024-08-30 11:45:00', 'Patterson never disappoints.', 4),
('BK007', 'P023', '2024-09-10 16:00:00', 'Inspirational read.', 5),
('BK008', 'P024', '2024-09-25 10:15:00', 'Mind-bending puzzles!', 4),
('BK009', 'P025', '2024-10-05 13:30:00', 'Great prequel to Da Vinci Code.', 4),
('BK011', 'P026', '2024-10-15 15:00:00', 'Classic Agatha Christie mystery.', 5),
('BK012', 'P027', '2024-10-20 09:45:00', 'Kids love it!', 5),
('BK013', 'P028', '2024-10-28 11:30:00', 'Fun rhymes for children.', 5),
('BK014', 'P029', '2024-11-01 14:15:00', 'American classic.', 4),
('BK016', 'P030', '2024-11-10 16:45:00', 'Jane Austen is timeless.', 5),
('BK017', 'P011', '2024-11-15 10:00:00', 'Great sequel to The Shining.', 4),
('BK018', 'P012', '2024-11-18 12:30:00', 'Best Harry Potter book!', 5),
('BK019', 'P013', '2024-11-20 14:00:00', 'Gripping courtroom drama.', 4),
('BK004', 'P014', '2024-11-22 09:30:00', 'Good but not as good as first.', 3),
('BK009', 'P015', '2024-11-23 11:00:00', 'A bit slow in places.', 3);

INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR001', 'P005', 'BK001', 'P011', '2024-01-15', '2024-02-15'),
('BR002', 'P005', 'BK002', 'P012', '2024-02-10', '2024-03-10'),
('BR003', 'P006', 'BK003', 'P013', '2024-03-05', '2024-04-05'),
('BR004', 'P006', 'BK004', 'P014', '2024-03-20', '2024-04-20'),
('BR005', 'P007', 'BK005', 'P012', '2024-01-10', '2024-02-10'),
('BR006', 'P007', 'BK006', 'P012', '2024-02-15', '2024-03-15'),
('BR007', 'P008', 'BK007', 'P012', '2024-03-12', '2024-04-12'),
('BR008', 'P008', 'BK008', 'P012', '2024-04-18', '2024-05-18'),
('BR009', 'P009', 'BK009', 'P012', '2024-05-22', '2024-06-22'),
('BR010', 'P009', 'BK010', 'P012', '2024-06-14', '2024-07-14'),
('BR011', 'P005', 'BK011', 'P012', '2024-07-08', '2024-08-08'),
('BR012', 'P005', 'BK012', 'P012', '2024-08-25', '2024-09-25'),
('BR013', 'P006', 'BK013', 'P012', '2024-09-16', '2024-10-16'),
('BR014', 'P006', 'BK014', 'P012', '2024-10-05', '2024-11-05'),
('BR015', 'P007', 'BK015', 'P012', '2024-11-01', '2024-12-01'),
('BR016', 'P007', 'BK001', 'P001', '2024-11-01', '2024-12-01'),
('BR017', 'P008', 'BK002', 'P001', '2024-11-03', '2024-12-03'),
('BR018', 'P008', 'BK003', 'P001', '2024-11-05', '2024-12-05'),
('BR019', 'P009', 'BK004', 'P001', '2024-11-07', '2024-12-07'),
('BR020', 'P009', 'BK005', 'P001', '2024-11-10', '2024-12-10'),
('BR021', 'P010', 'BK006', 'P001', '2024-11-12', '2024-12-12'),
('BR022', 'P010', 'BK007', 'P001', '2024-11-15', '2024-12-15'),
('BR023', 'P005', 'BK008', 'P011', '2024-11-02', '2024-12-02'),
('BR024', 'P005', 'BK009', 'P013', '2024-11-04', '2024-12-04'),
('BR025', 'P006', 'BK010', 'P015', '2024-11-06', '2024-12-06'),
('BR026', 'P006', 'BK011', 'P017', '2024-11-08', '2024-12-08'),
('BR027', 'P007', 'BK012', 'P019', '2024-11-11', '2024-12-11'),
('BR028', 'P007', 'BK013', 'P021', '2024-11-13', '2024-12-13'),
('BR029', 'P008', 'BK014', 'P002', '2024-11-16', '2024-12-16'),
('BR030', 'P008', 'BK015', 'P005', '2024-11-18', '2024-12-18'),
('BR031', 'P009', 'BK003', 'P011', '2024-11-19', '2024-12-19'),
('BR032', 'P009', 'BK003', 'P015', '2024-11-20', '2024-12-20'),
('BR033', 'P010', 'BK003', 'P017', '2024-11-21', '2024-12-21'),
('BR034', 'P010', 'BK003', 'P019', '2024-11-22', '2024-12-22'),
('BR035', 'P005', 'BK003', 'P021', '2024-11-23', '2024-12-23'),
('BR036', 'P006', 'BK016', 'P002', '2025-11-15', '2025-12-15'),
('BR037', 'P007', 'BK017', 'P005', '2025-11-20', '2025-12-20'),
('BR038', 'P008', 'BK018', 'P008', '2025-11-25', '2025-12-25'),
('BR039', 'P009', 'BK019', 'P011', '2024-11-12', '2024-12-12'),
('BR040', 'P010', 'BK020', 'P011', '2024-11-14', '2024-12-14'),
('BR041', 'P005', 'BK001', 'P011', '2024-11-16', '2024-12-16'),
('BR042', 'P006', 'BK002', 'P011', '2024-11-18', '2024-12-18'),
('BR043', 'P007', 'BK004', 'P013', '2024-10-15', '2024-11-15'),
('BR044', 'P008', 'BK018', 'P013', '2024-10-20', '2024-11-20'),
('BR045', 'P009', 'BK001', 'P001', '2025-11-10', '2025-12-10'),
('BR046', 'P010', 'BK002', 'P001', '2025-11-18', '2025-12-18'),
('BR047', 'P005', 'BK003', 'P001', '2025-12-01', '2026-01-01'),
('BR048', 'P006', 'BK004', 'P001', '2025-12-03', '2026-01-03'),
('BR049', 'P007', 'BK005', 'P001', '2025-12-05', '2026-01-05'),
('BR050', 'P008', 'BK006', 'P001', '2025-12-07', '2026-01-07'),
('BR051', 'P009', 'BK007', 'P001', '2025-12-10', '2026-01-10'),
('BR052', 'P010', 'BK008', 'P001', '2025-12-12', '2026-01-12'),
('BR053', 'P005', 'BK009', 'P001', '2025-12-15', '2026-01-15'),
('BR054', 'P006', 'BK010', 'P011', '2025-12-02', '2026-01-02'),
('BR055', 'P007', 'BK011', 'P011', '2025-12-04', '2026-01-04'),
('BR056', 'P008', 'BK012', 'P011', '2025-12-06', '2026-01-06'),
('BR057', 'P009', 'BK013', 'P011', '2025-12-08', '2026-01-08'),
('BR058', 'P010', 'BK014', 'P011', '2025-12-11', '2026-01-11'),
('BR059', 'P005', 'BK015', 'P011', '2025-12-13', '2026-01-13'),
('BR060', 'P006', 'BK016', 'P011', '2025-12-16', '2026-01-16'),
('BR061', 'P005', 'BK017', 'P012', '2024-12-05', '2025-01-05'),
('BR062', 'P006', 'BK018', 'P012', '2025-01-10', '2025-02-10'),
('BR063', 'P007', 'BK019', 'P012', '2025-02-15', '2025-03-15'),
('BR064', 'P008', 'BK020', 'P012', '2025-03-20', '2025-04-20'),
('BR065', 'P009', 'BK001', 'P012', '2025-04-12', '2025-05-12'),
('BR066', 'P010', 'BK002', 'P012', '2025-05-18', '2025-06-18'),
('BR067', 'P005', 'BK003', 'P012', '2025-06-22', '2025-07-22'),
('BR068', 'P006', 'BK004', 'P012', '2025-07-14', '2025-08-14'),
('BR069', 'P007', 'BK005', 'P012', '2025-08-08', '2025-09-08'),
('BR070', 'P008', 'BK006', 'P012', '2025-09-25', '2025-10-25'),
('BR071', 'P009', 'BK007', 'P012', '2025-10-16', '2025-11-16'),
('BR072', 'P010', 'BK008', 'P012', '2025-11-05', '2025-12-05');

INSERT INTO INQUIRY (InquiryID, ReceptID, MemberID, InquiryTime, Status, Rating) VALUES
('INQ001', 'P005', 'P011', '2025-10-05 09:00:00', 'Resolved', 5),
('INQ002', 'P005', 'P012', '2025-10-15 10:30:00', 'Resolved', 4),
('INQ003', 'P005', 'P013', '2025-11-05 11:45:00', 'Resolved', 5),
('INQ004', 'P005', 'P014', '2025-11-18 14:00:00', 'Resolved', 4),
('INQ005', 'P005', 'P015', '2025-12-01 09:30:00', 'Resolved', 5),
('INQ006', 'P005', 'P016', '2025-12-03 11:00:00', 'Resolved', 4),
('INQ007', 'P007', 'P021', '2025-10-08 09:45:00', 'Resolved', 5),
('INQ008', 'P007', 'P022', '2025-10-22 11:30:00', 'Resolved', 4),
('INQ009', 'P007', 'P023', '2025-11-10 14:15:00', 'Resolved', 4),
('INQ010', 'P007', 'P024', '2025-11-25 10:00:00', 'Resolved', 5),
('INQ011', 'P007', 'P025', '2025-12-02 09:00:00', 'Resolved', 4),
('INQ012', 'P007', 'P026', '2025-12-04 11:30:00', 'Resolved', 5),
('INQ013', 'P006', 'P018', '2025-11-03 10:00:00', 'Resolved', 4),
('INQ014', 'P006', 'P019', '2025-11-07 12:30:00', 'Resolved', 3),
('INQ015', 'P006', 'P020', '2025-11-10 15:00:00', 'Closed', 4),
('INQ016', 'P008', 'P027', '2025-11-06 10:15:00', 'Resolved', 4),
('INQ017', 'P008', 'P028', '2025-11-11 13:00:00', 'In Progress', NULL),
('INQ018', 'P009', 'P029', '2025-11-13 09:30:00', 'Resolved', 3),
('INQ019', 'P009', 'P030', '2025-11-17 11:45:00', 'Open', NULL),
('INQ020', 'P010', 'P011', '2025-11-16 14:30:00', 'Resolved', 5),
('INQ021', 'P010', 'P012', '2025-11-19 10:00:00', 'Resolved', 4),
('INQ022', 'P010', 'P013', '2025-11-20 12:15:00', 'Closed', 4),
('INQ023', 'P005', 'P014', '2025-12-05 09:00:00', 'Resolved', 5),
('INQ024', 'P005', 'P015', '2025-12-07 10:30:00', 'Resolved', 4),
('INQ025', 'P005', 'P016', '2025-12-09 11:45:00', 'Resolved', 5),
('INQ026', 'P005', 'P017', '2025-12-11 14:00:00', 'Resolved', 4),
('INQ027', 'P005', 'P018', '2025-12-13 09:30:00', 'Resolved', 5),
('INQ028', 'P005', 'P019', '2025-12-15 11:00:00', 'Closed', 4),
('INQ029', 'P005', 'P020', '2025-12-17 10:15:00', 'Resolved', 4);

INSERT INTO PAYMENT (PaymentID, BorrowedID, PaymentTime, Method, Amount) VALUES
('PAY001', 'BR001', '2024-02-20 10:00:00', 'Cash', 5.00),
('PAY002', 'BR002', '2024-03-15 11:30:00', 'Credit Card', 3.50),
('PAY003', 'BR003', '2024-04-10 14:00:00', 'Debit Card', 2.00),
('PAY004', 'BR004', '2024-04-25 09:45:00', 'Cash', 4.50),
('PAY005', 'BR005', '2024-02-15 13:15:00', 'Credit Card', 1.50),
('PAY006', 'BR010', '2024-07-20 15:30:00', 'Debit Card', 6.00),
('PAY007', 'BR015', '2024-12-05 10:00:00', 'Cash', 3.00),
('PAY008', 'BR020', '2024-12-15 11:45:00', 'Credit Card', 2.50),
('PAY009', 'BR025', '2024-12-10 14:30:00', 'Debit Card', 4.00),
('PAY010', 'BR030', '2024-12-20 09:00:00', 'Cash', 5.50);

-- =====================================================
-- ADDITIONAL DATA TO POPULATE VIEWS WITH MORE RESULTS
-- =====================================================

-- View 1 (TopGoldMember): Add more borrows for Gold members in past month
-- Gold members: P001, P002, P005, P011, P013, P015, P017, P019, P021
-- Need >5 borrows in past month for each to qualify

-- Additional borrows for P002 (Gold) - recent month
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR073', 'P005', 'BK001', 'P002', '2025-11-20', '2025-12-20'),
('BR074', 'P006', 'BK002', 'P002', '2025-11-21', '2025-12-21'),
('BR075', 'P007', 'BK003', 'P002', '2025-11-22', '2025-12-22'),
('BR076', 'P008', 'BK004', 'P002', '2025-11-23', '2025-12-23'),
('BR077', 'P009', 'BK005', 'P002', '2025-11-24', '2025-12-24'),
('BR078', 'P010', 'BK006', 'P002', '2025-11-25', '2025-12-25');

-- Additional borrows for P005 (Gold) - recent month
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR079', 'P006', 'BK007', 'P005', '2025-11-18', '2025-12-18'),
('BR080', 'P007', 'BK008', 'P005', '2025-11-19', '2025-12-19'),
('BR081', 'P008', 'BK009', 'P005', '2025-11-20', '2025-12-20'),
('BR082', 'P009', 'BK010', 'P005', '2025-11-21', '2025-12-21'),
('BR083', 'P010', 'BK011', 'P005', '2025-11-22', '2025-12-22'),
('BR084', 'P005', 'BK012', 'P005', '2025-11-23', '2025-12-23');

-- Additional borrows for P013 (Gold) - recent month
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR085', 'P006', 'BK013', 'P013', '2025-11-19', '2025-12-19'),
('BR086', 'P007', 'BK014', 'P013', '2025-11-20', '2025-12-20'),
('BR087', 'P008', 'BK015', 'P013', '2025-11-21', '2025-12-21'),
('BR088', 'P009', 'BK016', 'P013', '2025-11-22', '2025-12-22'),
('BR089', 'P010', 'BK017', 'P013', '2025-11-23', '2025-12-23'),
('BR090', 'P005', 'BK018', 'P013', '2025-11-24', '2025-12-24');

-- Additional borrows for P015 (Gold) - recent month
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR091', 'P006', 'BK019', 'P015', '2025-11-17', '2025-12-17'),
('BR092', 'P007', 'BK020', 'P015', '2025-11-18', '2025-12-18'),
('BR093', 'P008', 'BK001', 'P015', '2025-11-19', '2025-12-19'),
('BR094', 'P009', 'BK002', 'P015', '2025-11-20', '2025-12-20'),
('BR095', 'P010', 'BK003', 'P015', '2025-11-21', '2025-12-21'),
('BR096', 'P005', 'BK004', 'P015', '2025-11-22', '2025-12-22');

-- Additional borrows for P017 (Gold) - recent month
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR097', 'P006', 'BK005', 'P017', '2025-11-16', '2025-12-16'),
('BR098', 'P007', 'BK006', 'P017', '2025-11-17', '2025-12-17'),
('BR099', 'P008', 'BK007', 'P017', '2025-11-18', '2025-12-18'),
('BR100', 'P009', 'BK008', 'P017', '2025-11-19', '2025-12-19'),
('BR101', 'P010', 'BK009', 'P017', '2025-11-20', '2025-12-20'),
('BR102', 'P005', 'BK010', 'P017', '2025-11-21', '2025-12-21');

-- View 2 (PopularBooks): Add more borrows to create multiple books with same max count
-- Make BK001, BK002, and BK003 all have similar high borrow counts in the past year
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR103', 'P006', 'BK001', 'P014', '2025-01-15', '2025-02-15'),
('BR104', 'P007', 'BK001', 'P016', '2025-02-20', '2025-03-20'),
('BR105', 'P008', 'BK001', 'P018', '2025-03-25', '2025-04-25'),
('BR106', 'P009', 'BK001', 'P020', '2025-04-10', '2025-05-10'),
('BR107', 'P010', 'BK001', 'P022', '2025-05-15', '2025-06-15'),
('BR108', 'P005', 'BK002', 'P014', '2025-01-18', '2025-02-18'),
('BR109', 'P006', 'BK002', 'P016', '2025-02-22', '2025-03-22'),
('BR110', 'P007', 'BK002', 'P018', '2025-03-28', '2025-04-28'),
('BR111', 'P008', 'BK002', 'P020', '2025-04-12', '2025-05-12'),
('BR112', 'P009', 'BK002', 'P022', '2025-05-18', '2025-06-18');

-- View 3 (BestRatingPublisher): Add more high-rating reviews to ensure more publishers qualify
-- Currently BK004 (PUB002) has rating 3, BK009 (PUB005) has rating 3
-- Add high ratings to balance them out

-- Additional high reviews for HarperCollins (PUB002) books
INSERT INTO REVIEW (BookID, PersonID, CommentTime, Content, Rating) VALUES
('BK004', 'P021', '2025-01-10 10:00:00', 'Wonderful continuation of the series!', 5),
('BK004', 'P022', '2025-01-15 11:30:00', 'Better than I expected!', 5),
('BK011', 'P013', '2025-01-20 14:00:00', 'Agatha Christie never disappoints!', 5),
('BK016', 'P015', '2025-01-25 09:30:00', 'A beautiful classic romance.', 5);

-- Additional high reviews for Hachette Book Group (PUB005) books
INSERT INTO REVIEW (BookID, PersonID, CommentTime, Content, Rating) VALUES
('BK009', 'P021', '2025-02-05 10:00:00', 'Gripping from start to finish!', 5),
('BK009', 'P022', '2025-02-10 11:30:00', 'Excellent prequel!', 5),
('BK008', 'P013', '2025-02-15 14:00:00', 'Dan Brown at his finest!', 5),
('BK014', 'P017', '2025-02-20 09:30:00', 'Timeless American literature.', 5);

-- Add reviews for Simon & Schuster (PUB003) to ensure they qualify
INSERT INTO REVIEW (BookID, PersonID, CommentTime, Content, Rating) VALUES
('BK005', 'P011', '2025-03-01 10:00:00', 'Amazing thriller!', 5),
('BK006', 'P013', '2025-03-05 11:30:00', 'Patterson is a master storyteller.', 4),
('BK012', 'P015', '2025-03-10 14:00:00', 'My kids absolutely love this book!', 5),
('BK017', 'P019', '2025-03-15 09:30:00', 'Great follow-up to The Shining.', 4);

-- Add reviews for Macmillan Publishers (PUB004)
INSERT INTO REVIEW (BookID, PersonID, CommentTime, Content, Rating) VALUES
('BK007', 'P011', '2025-04-01 10:00:00', 'Truly inspirational memoir.', 5),
('BK013', 'P013', '2025-04-05 11:30:00', 'Classic Dr. Seuss fun!', 5),
('BK018', 'P015', '2025-04-10 14:00:00', 'My favorite Harry Potter book!', 5);

-- View 4 (PotentialGoldMember): Add borrows across all 12 months for Silver members
-- Silver members: P008, P012, P014, P016, P018, P020, P022, P023, P024, P025, P026, P027, P028, P029, P030
-- P012 already has many borrows, let's add for others

-- P014 borrows across all 12 months (past year from today Dec 2025)
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR113', 'P005', 'BK001', 'P014', '2024-12-15', '2025-01-15'),
('BR114', 'P006', 'BK002', 'P014', '2025-02-10', '2025-03-10'),
('BR115', 'P007', 'BK003', 'P014', '2025-03-12', '2025-04-12'),
('BR116', 'P008', 'BK004', 'P014', '2025-04-14', '2025-05-14'),
('BR117', 'P009', 'BK005', 'P014', '2025-05-16', '2025-06-16'),
('BR118', 'P010', 'BK006', 'P014', '2025-06-18', '2025-07-18'),
('BR119', 'P005', 'BK007', 'P014', '2025-07-20', '2025-08-20'),
('BR120', 'P006', 'BK008', 'P014', '2025-08-22', '2025-09-22'),
('BR121', 'P007', 'BK009', 'P014', '2025-09-24', '2025-10-24'),
('BR122', 'P008', 'BK010', 'P014', '2025-10-26', '2025-11-26'),
('BR123', 'P009', 'BK011', 'P014', '2025-11-28', '2025-12-28');

-- P016 borrows across all 12 months
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR124', 'P005', 'BK012', 'P016', '2024-12-18', '2025-01-18'),
('BR125', 'P006', 'BK013', 'P016', '2025-02-12', '2025-03-12'),
('BR126', 'P007', 'BK014', 'P016', '2025-03-14', '2025-04-14'),
('BR127', 'P008', 'BK015', 'P016', '2025-04-16', '2025-05-16'),
('BR128', 'P009', 'BK016', 'P016', '2025-05-18', '2025-06-18'),
('BR129', 'P010', 'BK017', 'P016', '2025-06-20', '2025-07-20'),
('BR130', 'P005', 'BK018', 'P016', '2025-07-22', '2025-08-22'),
('BR131', 'P006', 'BK019', 'P016', '2025-08-24', '2025-09-24'),
('BR132', 'P007', 'BK020', 'P016', '2025-09-26', '2025-10-26'),
('BR133', 'P008', 'BK001', 'P016', '2025-10-28', '2025-11-28'),
('BR134', 'P009', 'BK002', 'P016', '2025-11-30', '2025-12-30');

-- P018 borrows across all 12 months
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR135', 'P005', 'BK003', 'P018', '2024-12-20', '2025-01-20'),
('BR136', 'P006', 'BK004', 'P018', '2025-02-14', '2025-03-14'),
('BR137', 'P007', 'BK005', 'P018', '2025-03-16', '2025-04-16'),
('BR138', 'P008', 'BK006', 'P018', '2025-04-18', '2025-05-18'),
('BR139', 'P009', 'BK007', 'P018', '2025-05-20', '2025-06-20'),
('BR140', 'P010', 'BK008', 'P018', '2025-06-22', '2025-07-22'),
('BR141', 'P005', 'BK009', 'P018', '2025-07-24', '2025-08-24'),
('BR142', 'P006', 'BK010', 'P018', '2025-08-26', '2025-09-26'),
('BR143', 'P007', 'BK011', 'P018', '2025-09-28', '2025-10-28'),
('BR144', 'P008', 'BK012', 'P018', '2025-10-30', '2025-11-30'),
('BR145', 'P009', 'BK013', 'P018', '2025-12-02', '2026-01-02');

-- P020 borrows across all 12 months
INSERT INTO BORROWED (BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate) VALUES
('BR146', 'P005', 'BK014', 'P020', '2024-12-22', '2025-01-22'),
('BR147', 'P006', 'BK015', 'P020', '2025-02-16', '2025-03-16'),
('BR148', 'P007', 'BK016', 'P020', '2025-03-18', '2025-04-18'),
('BR149', 'P008', 'BK017', 'P020', '2025-04-20', '2025-05-20'),
('BR150', 'P009', 'BK018', 'P020', '2025-05-22', '2025-06-22'),
('BR151', 'P010', 'BK019', 'P020', '2025-06-24', '2025-07-24'),
('BR152', 'P005', 'BK020', 'P020', '2025-07-26', '2025-08-26'),
('BR153', 'P006', 'BK001', 'P020', '2025-08-28', '2025-09-28'),
('BR154', 'P007', 'BK002', 'P020', '2025-09-30', '2025-10-30'),
('BR155', 'P008', 'BK003', 'P020', '2025-11-01', '2025-12-01'),
('BR156', 'P009', 'BK004', 'P020', '2025-12-03', '2026-01-03');

-- View 5 (ActiveReceptionist): Add more resolved inquiries for receptionists in past month
-- Receptionists: P005, P006, P007, P008, P009, P010
-- P005 and P007 already have many, add for others

-- Additional inquiries for P006 in past month
INSERT INTO INQUIRY (InquiryID, ReceptID, MemberID, InquiryTime, Status, Rating) VALUES
('INQ030', 'P006', 'P021', '2025-11-15 09:00:00', 'Resolved', 5),
('INQ031', 'P006', 'P022', '2025-11-17 10:30:00', 'Resolved', 4),
('INQ032', 'P006', 'P023', '2025-11-19 11:45:00', 'Resolved', 5),
('INQ033', 'P006', 'P024', '2025-11-21 14:00:00', 'Resolved', 4),
('INQ034', 'P006', 'P025', '2025-11-23 09:30:00', 'Resolved', 5),
('INQ035', 'P006', 'P026', '2025-11-25 11:00:00', 'Resolved', 4);

-- Additional inquiries for P008 in past month
INSERT INTO INQUIRY (InquiryID, ReceptID, MemberID, InquiryTime, Status, Rating) VALUES
('INQ036', 'P008', 'P011', '2025-11-14 09:00:00', 'Resolved', 5),
('INQ037', 'P008', 'P012', '2025-11-16 10:30:00', 'Resolved', 4),
('INQ038', 'P008', 'P013', '2025-11-18 11:45:00', 'Resolved', 5),
('INQ039', 'P008', 'P014', '2025-11-20 14:00:00', 'Resolved', 4),
('INQ040', 'P008', 'P015', '2025-11-22 09:30:00', 'Closed', 5),
('INQ041', 'P008', 'P016', '2025-11-24 11:00:00', 'Resolved', 4);

-- Additional inquiries for P009 in past month
INSERT INTO INQUIRY (InquiryID, ReceptID, MemberID, InquiryTime, Status, Rating) VALUES
('INQ042', 'P009', 'P017', '2025-11-15 09:00:00', 'Resolved', 5),
('INQ043', 'P009', 'P018', '2025-11-17 10:30:00', 'Resolved', 4),
('INQ044', 'P009', 'P019', '2025-11-19 11:45:00', 'Resolved', 5),
('INQ045', 'P009', 'P020', '2025-11-21 14:00:00', 'Closed', 4),
('INQ046', 'P009', 'P021', '2025-11-23 09:30:00', 'Resolved', 5),
('INQ047', 'P009', 'P022', '2025-11-25 11:00:00', 'Resolved', 4);

-- Additional inquiries for P010 in past month
INSERT INTO INQUIRY (InquiryID, ReceptID, MemberID, InquiryTime, Status, Rating) VALUES
('INQ048', 'P010', 'P023', '2025-11-14 09:00:00', 'Resolved', 5),
('INQ049', 'P010', 'P024', '2025-11-16 10:30:00', 'Resolved', 4),
('INQ050', 'P010', 'P025', '2025-11-18 11:45:00', 'Resolved', 5),
('INQ051', 'P010', 'P026', '2025-11-20 14:00:00', 'Resolved', 4),
('INQ052', 'P010', 'P027', '2025-11-22 09:30:00', 'Closed', 5),
('INQ053', 'P010', 'P028', '2025-11-24 11:00:00', 'Resolved', 4);
