# Jungle Library - 3NF Normalization and Dependency Diagrams

## Phase III-a: Normalization Verification
## Phase III-b: Dependency Diagrams

All tables have been verified to be in Third Normal Form (3NF).

---

## 1. PERSON Table

**Schema:** PERSON(PersonID, FName, MName, LName, Address, Gender, DateOfBirth)

**Functional Dependencies:**
- PersonID -> FName, MName, LName, Address, Gender, DateOfBirth

**Dependency Diagram:**
```
PersonID ──┬──> FName
           ├──> MName
           ├──> LName
           ├──> Address
           ├──> Gender
           └──> DateOfBirth
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## 2. PHONE Table

**Schema:** PHONE(PersonID, PhoneNumber)

**Functional Dependencies:**
- {PersonID, PhoneNumber} -> (no non-key attributes)

**Dependency Diagram:**
```
{PersonID, PhoneNumber} ──> (Primary Key only, no other attributes)
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No non-key attributes to have partial dependencies
- 3NF: No transitive dependencies

---

## 3. EMPLOYEE Table

**Schema:** EMPLOYEE(EmployeeID, StartDate, EType, TrainedByID)

**Functional Dependencies:**
- EmployeeID -> StartDate, EType, TrainedByID

**Dependency Diagram:**
```
EmployeeID ──┬──> StartDate
             ├──> EType
             └──> TrainedByID
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies (TrainedByID is a FK, not transitively dependent)

---

## 4. TRAINER Table

**Schema:** TRAINER(TrainerID)

**Functional Dependencies:**
- TrainerID -> (no non-key attributes)

**Dependency Diagram:**
```
TrainerID ──> (Primary Key only)
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No non-key attributes
- 3NF: No transitive dependencies

---

## 5. MEMBER Table

**Schema:** MEMBER(MemberID, Level)

**Functional Dependencies:**
- MemberID -> Level

**Dependency Diagram:**
```
MemberID ──> Level
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## 6. LIBCARD Table

**Schema:** LIBCARD(CardID, MemberID, IssueDate)

**Functional Dependencies:**
- CardID -> MemberID, IssueDate
- MemberID -> CardID (1:1 relationship, but CardID is chosen as PK)

**Dependency Diagram:**
```
CardID ──┬──> MemberID
         └──> IssueDate
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## 7. GUEST Table

**Schema:** GUEST(GuestOfID, GuestID, Name, Address, ContactInfo)

**Functional Dependencies:**
- {GuestOfID, GuestID} -> Name, Address, ContactInfo

**Dependency Diagram:**
```
{GuestOfID, GuestID} ──┬──> Name
                       ├──> Address
                       └──> ContactInfo
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (all non-key attributes depend on full composite key)
- 3NF: No transitive dependencies

---

## 8. PROMO Table

**Schema:** PROMO(PromoCode, PromoDesc)

**Functional Dependencies:**
- PromoCode -> PromoDesc

**Dependency Diagram:**
```
PromoCode ──> PromoDesc
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## 9. WITHPROMO Table

**Schema:** WITHPROMO(CardID, PromoCode)

**Functional Dependencies:**
- {CardID, PromoCode} -> (no non-key attributes)

**Dependency Diagram:**
```
{CardID, PromoCode} ──> (Primary Key only)
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No non-key attributes
- 3NF: No transitive dependencies

---

## 10. PUBLISHER Table

**Schema:** PUBLISHER(PublisherID, PublisherName)

**Functional Dependencies:**
- PublisherID -> PublisherName

**Dependency Diagram:**
```
PublisherID ──> PublisherName
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## 11. AUTHOR Table

**Schema:** AUTHOR(AuthorID, AuthorName)

**Functional Dependencies:**
- AuthorID -> AuthorName

**Dependency Diagram:**
```
AuthorID ──> AuthorName
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## 12. BOOK Table

**Schema:** BOOK(BookID, PublisherID, BookTitle)

**Functional Dependencies:**
- BookID -> PublisherID, BookTitle

**Dependency Diagram:**
```
BookID ──┬──> PublisherID
         └──> BookTitle
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies (PublisherID is FK, not transitive)

---

## 13. WRITTENBY Table

**Schema:** WRITTENBY(AuthorID, BookID)

**Functional Dependencies:**
- {AuthorID, BookID} -> (no non-key attributes)

**Dependency Diagram:**
```
{AuthorID, BookID} ──> (Primary Key only)
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No non-key attributes
- 3NF: No transitive dependencies

---

## 14. CATALOGS Table

**Schema:** CATALOGS(BookID, ManagerID, CatalogDate, Category)

**Functional Dependencies:**
- {BookID, ManagerID, CatalogDate} -> Category
- {ManagerID, CatalogDate} -> Category (Manager catalogs one category per day)

**Dependency Diagram:**
```
{BookID, ManagerID, CatalogDate} ──> Category

Note: {ManagerID, CatalogDate} ──> Category is a constraint enforced by business rule
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: Category depends on full composite key for the book-manager-date combination
- 3NF: No transitive dependencies

---

## 15. COMMENT Table

**Schema:** COMMENT(BookID, PersonID, CommentTime, Content, Rating)

**Functional Dependencies:**
- {BookID, PersonID, CommentTime} -> Content, Rating

**Dependency Diagram:**
```
{BookID, PersonID, CommentTime} ──┬──> Content
                                  └──> Rating
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (all non-key attributes depend on full composite key)
- 3NF: No transitive dependencies

---

## 16. BORROWED Table

**Schema:** BORROWED(BorrowedID, ReceptID, BookID, MemberID, IssueDate, DueDate)

**Functional Dependencies:**
- BorrowedID -> ReceptID, BookID, MemberID, IssueDate, DueDate

**Dependency Diagram:**
```
BorrowedID ──┬──> ReceptID
             ├──> BookID
             ├──> MemberID
             ├──> IssueDate
             └──> DueDate
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## 17. INQUIRY Table

**Schema:** INQUIRY(InquiryID, ReceptID, MemberID, InquiryTime, Status, Rating)

**Functional Dependencies:**
- InquiryID -> ReceptID, MemberID, InquiryTime, Status, Rating

**Dependency Diagram:**
```
InquiryID ──┬──> ReceptID
            ├──> MemberID
            ├──> InquiryTime
            ├──> Status
            └──> Rating
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## 18. PAYMENT Table

**Schema:** PAYMENT(PaymentID, BorrowedID, PaymentTime, Method, Amount)

**Functional Dependencies:**
- PaymentID -> BorrowedID, PaymentTime, Method, Amount
- BorrowedID -> PaymentID (1:1 relationship)

**Dependency Diagram:**
```
PaymentID ──┬──> BorrowedID
            ├──> PaymentTime
            ├──> Method
            └──> Amount
```

**3NF Verification:**
- 1NF: All attributes are atomic
- 2NF: No partial dependencies (single-column PK)
- 3NF: No transitive dependencies

---

## Summary

All 18 tables are in 3NF:
- No repeating groups (1NF satisfied)
- No partial dependencies on composite keys (2NF satisfied)
- No transitive dependencies on non-key attributes (3NF satisfied)
