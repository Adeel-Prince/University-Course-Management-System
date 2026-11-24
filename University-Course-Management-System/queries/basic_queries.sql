-- SELECT, WHERE, ORDER BY, LIMIT, CRUD --
SELECT * FROM departments;
SELECT *
FROM departments
ORDER BY department_id ASC;
SELECT *
FROM students;
SELECT *
FROM students
ORDER BY student_id ASC;
SELECT *
FROM instructors;
SELECT *
FROM instructors
ORDER BY instructor_id ASC;
SELECT *
FROM courses;
SELECT COUNT(*) AS total_courses
FROM courses;
Select * from courses;
SELECT *
FROM enrollments;
SELECT COUNT(*) AS total_enrollments
FROM enrollments;
SELECT *
FROM grades;

-- WHERE --
SELECT
    student_id,
    first_name,
    last_name,
    email
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM enrollments
)
ORDER BY student_id;
-- Find courses with no enrollments...
SELECT
    course_id,
    course_code,
    course_name
FROM courses
WHERE course_id NOT IN (
    SELECT course_id
    FROM enrollments
);

-- ORDER BY --
-- checks Department-wise instructor count...
SELECT
    department_id,
    COUNT(*) AS total_instructors
FROM instructors
GROUP BY department_id
ORDER BY department_id;

-- CRUD Operations -- CREATE (INSERT)
INSERT INTO students (
    first_name,
    last_name,
    email,
    phone,
    gender,
    date_of_birth,
    admission_date,
    department_id,
    status
)
VALUES (
    'Usama',
    'Rashid',
    'usama.rashid@example.com',
    '03005556677',
    'Male',
    '2002-08-15',
    '2026-09-01',
    1,
    'Active'
)
RETURNING *;

-- READ (SELECT)
SELECT *
FROM students
WHERE email = 'usama.rashid@example.com';

-- Department-wise students retrieve...
SELECT
    student_id,
    first_name,
    last_name,
    email
FROM students
WHERE department_id = 1
ORDER BY first_name;

-- UPDATE
UPDATE students
SET phone = '03001112233'
WHERE email = 'usama.rashid@example.com'
RETURNING *;

-- DELETE...
DELETE FROM students
WHERE email = 'usama.rashid@example.com'
RETURNING *;

-- verfity deleted record...
SELECT *
FROM students
WHERE email = 'usama.rashid@example.com';

