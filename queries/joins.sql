-- INNER, LEFT and multi-table JOINs --

--INNER JOIN --
-- checks courses with department and instructors...
SELECT
    c.course_id,
    c.course_code,
    c.course_name,
    d.department_name,
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name,
    c.credit_hours,
    c.fee
FROM courses c
INNER JOIN departments d
    ON c.department_id = d.department_id
INNER JOIN instructors i
    ON c.instructor_id = i.instructor_id
ORDER BY c.course_id;

-- checks for students and courses combined information retrieve...
SELECT
    e.enrollment_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_code,
    c.course_name,
    e.semester,
    e.academic_year,
    e.status
FROM enrollments e
INNER JOIN students s
    ON e.student_id = s.student_id
INNER JOIN courses c
    ON e.course_id = c.course_id
ORDER BY e.enrollment_id;

-- checks for Generate a student result report using JOIN...
SELECT
    g.grade_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_code,
    c.course_name,
    g.marks_obtained,
    g.total_marks,
    g.letter_grade,
    g.remarks
FROM grades g
INNER JOIN enrollments e
    ON g.enrollment_id = e.enrollment_id
INNER JOIN students s
    ON e.student_id = s.student_id
INNER JOIN courses c
    ON e.course_id = c.course_id
ORDER BY g.grade_id;

-- Calculated grades using CASE...
SELECT
    g.grade_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained,

    CASE
        WHEN g.marks_obtained >= 90 THEN 'A+'
        WHEN g.marks_obtained >= 80 THEN 'A'
        WHEN g.marks_obtained >= 70 THEN 'B'
        WHEN g.marks_obtained >= 60 THEN 'C'
        WHEN g.marks_obtained >= 50 THEN 'D'
        ELSE 'F'
    END AS calculated_grade,

    g.letter_grade AS stored_grade

FROM grades g
INNER JOIN enrollments e
    ON g.enrollment_id = e.enrollment_id
INNER JOIN students s
    ON e.student_id = s.student_id
ORDER BY g.grade_id;

-- LEFT and multi-table JOINs --
-- Aggregate functions -- Department-wise student count...
SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_name
ORDER BY total_students DESC;

-- Department performance view ---
CREATE VIEW department_performance_view AS
SELECT
    d.department_name,
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(DISTINCT i.instructor_id) AS total_instructors,
    COUNT(DISTINCT c.course_id) AS total_courses,
    ROUND(AVG(g.marks_obtained), 2) AS average_marks
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
LEFT JOIN instructors i
    ON d.department_id = i.department_id
LEFT JOIN courses c
    ON d.department_id = c.department_id
LEFT JOIN enrollments e
    ON c.course_id = e.course_id
LEFT JOIN grades g
    ON e.enrollment_id = g.enrollment_id
GROUP BY d.department_id, d.department_name;

-- CROSS JOIN --
-- Students with above-average marks...
WITH average_marks AS (
    SELECT AVG(marks_obtained) AS avg_marks
    FROM grades
)
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained,
    ROUND(a.avg_marks, 2) AS university_average
FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
CROSS JOIN average_marks a
WHERE g.marks_obtained > a.avg_marks
ORDER BY g.marks_obtained DESC;