-- =========================================
-- 1. STUDENT ENROLLMENT REPORT
-- =========================================
SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    d.department_name,
    COUNT(e.enrollment_id) AS total_enrollments,
    COUNT(*) FILTER (WHERE e.status = 'Enrolled') AS active_enrollments,
    COUNT(*) FILTER (WHERE e.status = 'Completed') AS completed_enrollments,
    COUNT(*) FILTER (WHERE e.status = 'Dropped') AS dropped_enrollments
FROM students s
INNER JOIN departments d
    ON s.department_id = d.department_id
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY
    s.student_id,
    s.first_name,
    s.last_name,
    d.department_name
ORDER BY total_enrollments DESC;

-- =========================================
-- 2. INSTRUCTOR WORKLOAD REPORT
-- =========================================
SELECT
    i.instructor_id,
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name,
    d.department_name,
    COUNT(c.course_id) AS total_courses,
    COALESCE(SUM(c.credit_hours), 0) AS total_credit_hours
FROM instructors i
INNER JOIN departments d
    ON i.department_id = d.department_id
LEFT JOIN courses c
    ON i.instructor_id = c.instructor_id
GROUP BY
    i.instructor_id,
    i.first_name,
    i.last_name,
    d.department_name
ORDER BY total_courses DESC;

-- =========================================
-- 3. COURSE PERFORMANCE REPORT
-- =========================================
SELECT
    c.course_code,
    c.course_name,
    COUNT(g.grade_id) AS total_students,
    ROUND(AVG(g.marks_obtained), 2) AS average_marks,
    MAX(g.marks_obtained) AS highest_marks,
    MIN(g.marks_obtained) AS lowest_marks,
    COUNT(*) FILTER (WHERE g.letter_grade = 'A+') AS a_plus_students,
    COUNT(*) FILTER (WHERE g.letter_grade = 'F') AS failed_students
FROM courses c
LEFT JOIN enrollments e
    ON c.course_id = e.course_id
LEFT JOIN grades g
    ON e.enrollment_id = g.enrollment_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY average_marks DESC NULLS LAST;

-- ====================================================================
-- 4. DEPARTMENT FINANCIAL REPORT -- POTENTIAL FEE AMOUNT OF COURSE FEES
-- =====================================================================
SELECT
    d.department_name,
    d.budget,
    COUNT(DISTINCT c.course_id) AS total_courses,
    COALESCE(SUM(c.fee), 0) AS combined_course_fees,
    ROUND(AVG(c.fee), 2) AS average_course_fee
FROM departments d
LEFT JOIN courses c
    ON d.department_id = c.department_id
GROUP BY d.department_id, d.department_name, d.budget
ORDER BY d.budget DESC;

-- =========================================
-- 5. TOP 5 STUDENTS REPORT
-- =========================================
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    d.department_name,
    ROUND(AVG(g.marks_obtained), 2) AS average_marks,
    COUNT(g.grade_id) AS total_results
FROM students s
INNER JOIN departments d
    ON s.department_id = d.department_id
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
GROUP BY
    s.student_id,
    s.first_name,
    s.last_name,
    d.department_name
ORDER BY average_marks DESC
LIMIT 5;