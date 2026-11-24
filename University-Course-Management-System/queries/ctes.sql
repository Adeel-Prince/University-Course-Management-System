-- Single and multiple CTEs -- Common Table Expressions (CTEs)

-- Single CTEs --
-- Department-wise student statistics 
WITH department_stats AS (
    SELECT
        d.department_id,
        d.department_name,
        COUNT(s.student_id) AS total_students
    FROM departments d
    LEFT JOIN students s
        ON d.department_id = s.department_id
    GROUP BY d.department_id, d.department_name
)
SELECT *
FROM department_stats
ORDER BY total_students DESC;

-- Students with above-average marks
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

-- Course performance report using CTE 
WITH course_performance AS (
    SELECT
        c.course_id,
        c.course_code,
        c.course_name,
        COUNT(g.grade_id) AS total_students,
        ROUND(AVG(g.marks_obtained), 2) AS average_marks,
        MAX(g.marks_obtained) AS highest_marks,
        MIN(g.marks_obtained) AS lowest_marks
    FROM courses c
    INNER JOIN enrollments e
        ON c.course_id = e.course_id
    INNER JOIN grades g
        ON e.enrollment_id = g.enrollment_id
    GROUP BY c.course_id, c.course_code, c.course_name
)
SELECT *
FROM course_performance
ORDER BY average_marks DESC;

-- Multiple CTEs in one query also Using COALESCE()
WITH student_counts AS (
    SELECT
        department_id,
        COUNT(*) AS total_students
    FROM students
    GROUP BY department_id
),
instructor_counts AS (
    SELECT
        department_id,
        COUNT(*) AS total_instructors
    FROM instructors
    GROUP BY department_id
)
SELECT
    d.department_name,
    COALESCE(sc.total_students, 0) AS total_students,
    COALESCE(ic.total_instructors, 0) AS total_instructors
FROM departments d
LEFT JOIN student_counts sc
    ON d.department_id = sc.department_id
LEFT JOIN instructor_counts ic
    ON d.department_id = ic.department_id
ORDER BY d.department_id;