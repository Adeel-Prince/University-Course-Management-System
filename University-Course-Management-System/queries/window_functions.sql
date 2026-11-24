-- ROW_NUMBER, RANK, DENSE_RANK, PARTITION BY, AVG() OVER() --

-- ROW_NUMBER()
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained,
    ROW_NUMBER() OVER (
        ORDER BY g.marks_obtained DESC
    ) AS row_number
FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
ORDER BY g.marks_obtained DESC;

-- RANK()
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained,
    RANK() OVER (
        ORDER BY g.marks_obtained DESC
    ) AS student_rank
FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
ORDER BY student_rank;

-- DENSE_RANK() — Ranking without gaps
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained,
    DENSE_RANK() OVER (
        ORDER BY g.marks_obtained DESC
    ) AS dense_rank
FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
ORDER BY dense_rank;

-- PARTITION BY — Department-wise ranking
SELECT
    d.department_name,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained,

    RANK() OVER (
        PARTITION BY d.department_id
        ORDER BY g.marks_obtained DESC
    ) AS department_rank

FROM students s
INNER JOIN departments d
    ON s.department_id = d.department_id
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
ORDER BY d.department_name, department_rank;

-- AVG() OVER() — Compare individual marks with average
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    g.marks_obtained,

    ROUND(
        AVG(g.marks_obtained) OVER (),
        2
    ) AS overall_average,

    ROUND(
        g.marks_obtained - AVG(g.marks_obtained) OVER (),
        2
    ) AS difference_from_average

FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN grades g
    ON e.enrollment_id = g.enrollment_id
ORDER BY g.marks_obtained DESC;