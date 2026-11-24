-- Scalar, IN, NOT IN, correlated --

-- Scalar & IN --
-- Find students enrolled in courses
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

-- Find students scoring above average
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained
FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
WHERE g.marks_obtained > (
    SELECT AVG(marks_obtained)
    FROM grades
)
ORDER BY g.marks_obtained DESC;

-- NOT IN 
-- Find courses with no enrollments
SELECT
    course_id,
    course_code,
    course_name
FROM courses
WHERE course_id NOT IN (
    SELECT course_id
    FROM enrollments
);

-- Correlated subquery --
-- Find the highest-scoring student in each course
SELECT
    c.course_name,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained
FROM grades g
INNER JOIN enrollments e
    ON g.enrollment_id = e.enrollment_id
INNER JOIN students s
    ON e.student_id = s.student_id
INNER JOIN courses c
    ON e.course_id = c.course_id
WHERE g.marks_obtained = (
    SELECT MAX(g2.marks_obtained)
    FROM grades g2
    INNER JOIN enrollments e2
        ON g2.enrollment_id = e2.enrollment_id
    WHERE e2.course_id = e.course_id
)
ORDER BY c.course_name;