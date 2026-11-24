-- 	All 3 created views 

-- Create Views
-- Student details view
CREATE VIEW student_details_view AS
SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email,
    s.status,
    d.department_name
FROM students s
INNER JOIN departments d
    ON s.department_id = d.department_id;

-- View access
SELECT *
FROM student_details_view;

-- Student result view
CREATE VIEW student_results_view AS
SELECT
    e.enrollment_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_code,
    c.course_name,
    g.marks_obtained,
    g.total_marks,
    g.letter_grade,
    e.semester,
    e.academic_year
FROM enrollments e
INNER JOIN students s
    ON e.student_id = s.student_id
INNER JOIN courses c
    ON e.course_id = c.course_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id;

-- View access
SELECT *
FROM student_results_view
ORDER BY marks_obtained DESC;

-- Department performance view
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

-- View access
SELECT *
FROM department_performance_view
ORDER BY department_name;

-- Verify all views
SELECT
    table_name
FROM information_schema.views
WHERE table_schema = 'public'
ORDER BY table_name;