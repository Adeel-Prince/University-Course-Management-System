# University Course Management System (UCMS)

A relational database project developed using **PostgreSQL** to manage university academic operations, including students, departments, instructors, courses, enrollments, and grades.

## Project Overview

The University Course Management System (UCMS) is designed to organize and manage university-related academic data through a structured relational database. It demonstrates practical implementation of SQL concepts, database relationships, constraints, queries, and reporting.

## Technologies Used

- PostgreSQL
- pgAdmin 4
- SQL

## Database Structure

The database consists of six main tables:

1. **Departments** – Stores university department information.
2. **Students** – Maintains student records and department associations.
3. **Instructors** – Stores instructor information and department associations.
4. **Courses** – Manages course details, fees, credit hours, and assigned instructors.
5. **Enrollments** – Records student course registrations and academic semesters.
6. **Grades** – Stores student marks, letter grades, and results.

## Key Features

- Relational database design with primary and foreign keys.
- Data validation using NOT NULL, UNIQUE, and CHECK constraints.
- Student enrollment and course management.
- Instructor and department management.
- Student grading and academic result tracking.
- SQL JOINs, subqueries, and Common Table Expressions (CTEs).
- Aggregate functions and window functions.
- Views and database indexes.
- Transactions and CRUD operations.
- Academic and departmental reporting.

## SQL Concepts Practiced

- Basic SQL queries
- INNER JOIN and LEFT JOIN
- GROUP BY and HAVING
- Aggregate functions
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- Views
- Indexes and EXPLAIN ANALYZE
- Transactions (COMMIT, ROLLBACK, SAVEPOINT)
- CRUD operations
- Data integrity and validation

## Project Reports

The project includes five SQL-based reports:

1. Student Enrollment Report
2. Instructor Workload Report
3. Course Performance Report
4. Department Financial Overview
5. Top 5 Students by Average Marks

## Entity Relationship Diagram

The database ER diagram is available in the `diagrams/` directory.

## Project Structure

```text
University-Course-Management-System/
├── database/
├── queries/
├── reports/
├── diagrams/
├── screenshots/
└── README.md
```

## Database Information

- Database Name: `UniversityDB`
- Total Tables: 6
- Departments: 5
- Students: 15
- Instructors: 10
- Courses: 20
- Enrollments: 30
- Grades: 30

## Purpose

This project was developed to strengthen practical database management skills and demonstrate the use of PostgreSQL in designing, implementing, querying, and managing a relational database system.

---

**Project:** University Course Management System (UCMS)  
**Database:** PostgreSQL  
**Status:** Database Development Completed