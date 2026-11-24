-- insert data into grades table...
INSERT INTO grades (
    enrollment_id,
    marks_obtained,
    total_marks,
    letter_grade,
    remarks,
    result_date
)
VALUES
(1, 88, 100, 'A', 'Excellent performance', '2026-11-15'),
(2, 92, 100, 'A+', 'Outstanding performance', '2026-11-15'),
(3, 76, 100, 'B', 'Good performance', '2026-11-15'),
(4, 85, 100, 'A', 'Very good performance', '2026-11-15'),
(5, 95, 100, 'A+', 'Outstanding performance', '2026-11-15'),
(6, 82, 100, 'A', 'Very good performance', '2026-11-15'),
(7, 68, 100, 'C', 'Satisfactory performance', '2026-11-15'),
(8, 79, 100, 'B', 'Good performance', '2026-11-15'),
(9, 91, 100, 'A+', 'Outstanding performance', '2026-11-15'),
(10, 87, 100, 'A', 'Excellent performance', '2026-11-15'),
(11, 73, 100, 'B', 'Good performance', '2026-11-15'),
(12, 89, 100, 'A', 'Excellent performance', '2026-11-15'),
(13, 65, 100, 'C', 'Satisfactory performance', '2026-11-15'),
(14, 94, 100, 'A+', 'Outstanding performance', '2026-11-15'),
(15, 58, 100, 'D', 'Needs improvement', '2026-11-15'),
(16, 81, 100, 'A', 'Very good performance', '2026-11-15'),
(17, 77, 100, 'B', 'Good performance', '2026-11-15'),
(18, 90, 100, 'A+', 'Outstanding performance', '2026-11-15'),
(19, 84, 100, 'A', 'Very good performance', '2026-11-15'),
(20, 72, 100, 'B', 'Good performance', '2026-11-15'),
(21, 96, 100, 'A+', 'Outstanding performance', '2026-11-15'),
(22, 88, 100, 'A', 'Excellent performance', '2026-11-15'),
(23, 69, 100, 'C', 'Satisfactory performance', '2026-11-15'),
(24, 75, 100, 'B', 'Good performance', '2026-11-15'),
(25, 86, 100, 'A', 'Very good performance', '2026-11-15'),
(26, 93, 100, 'A+', 'Outstanding performance', '2026-11-15'),
(27, 55, 100, 'D', 'Needs improvement', '2026-11-15'),
(28, 80, 100, 'A', 'Very good performance', '2026-11-15'),
(29, 67, 100, 'C', 'Satisfactory performance', '2026-11-15'),
(30, 91, 100, 'A+', 'Outstanding performance', '2026-11-15')
RETURNING *;
SELECT COUNT(*) AS total_grade_records
FROM grades;