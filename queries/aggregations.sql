-- COUNT, SUM, AVG, GROUP BY, HAVING --
-- COUNT()
SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_name
ORDER BY total_students DESC;

-- AVG(), SUM(), MIN() & MAX()
SELECT
    COUNT(*) AS total_results,
    ROUND(AVG(marks_obtained), 2) AS average_marks,
    MAX(marks_obtained) AS highest_marks,
    MIN(marks_obtained) AS lowest_marks,
    SUM(marks_obtained) AS total_marks
FROM grades;

--

-- GROUP BY WITH HAVING()
SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments d
INNER JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING COUNT(s.student_id) > 2
ORDER BY total_students DESC;

-- Courses with average marks above 80 Using GROUP BY WITH HAVING()
SELECT
    c.course_name,
    COUNT(g.grade_id) AS total_results,
    ROUND(AVG(g.marks_obtained), 2) AS average_marks
FROM courses c
INNER JOIN enrollments e
    ON c.course_id = e.course_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
GROUP BY c.course_name
HAVING AVG(g.marks_obtained) > 80
ORDER BY average_marks DESC;