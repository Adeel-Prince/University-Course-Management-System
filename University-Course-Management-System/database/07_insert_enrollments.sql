-- insert data into enrollments table...
INSERT INTO enrollments (
    student_id,
    course_id,
    enrollment_date,
    semester,
    academic_year,
    status
)
VALUES
(1, 1, '2026-09-01', 'Fall', '2026-2027', 'Enrolled'),
(1, 2, '2026-09-01', 'Fall', '2026-2027', 'Enrolled'),

(2, 5, '2026-09-02', 'Fall', '2026-2027', 'Enrolled'),
(2, 6, '2026-09-02', 'Fall', '2026-2027', 'Completed'),

(3, 1, '2026-09-03', 'Fall', '2026-2027', 'Enrolled'),
(3, 3, '2026-09-03', 'Fall', '2026-2027', 'Enrolled'),

(4, 9, '2026-09-04', 'Fall', '2026-2027', 'Enrolled'),
(4, 10, '2026-09-04', 'Fall', '2026-2027', 'Completed'),

(5, 13, '2026-09-05', 'Fall', '2026-2027', 'Completed'),
(5, 14, '2026-09-05', 'Fall', '2026-2027', 'Completed'),

(6, 5, '2026-09-06', 'Fall', '2026-2027', 'Enrolled'),
(6, 7, '2026-09-06', 'Fall', '2026-2027', 'Enrolled'),

(7, 17, '2026-09-07', 'Fall', '2026-2027', 'Enrolled'),
(7, 18, '2026-09-07', 'Fall', '2026-2027', 'Enrolled'),

(8, 9, '2026-09-08', 'Fall', '2026-2027', 'Dropped'),
(8, 11, '2026-09-08', 'Fall', '2026-2027', 'Enrolled'),

(9, 13, '2026-09-09', 'Fall', '2026-2027', 'Enrolled'),
(9, 15, '2026-09-09', 'Fall', '2026-2027', 'Enrolled'),

(10, 1, '2026-09-10', 'Fall', '2026-2027', 'Enrolled'),
(10, 4, '2026-09-10', 'Fall', '2026-2027', 'Enrolled'),

(11, 5, '2026-09-11', 'Fall', '2026-2027', 'Completed'),
(11, 8, '2026-09-11', 'Fall', '2026-2027', 'Completed'),

(12, 17, '2026-09-12', 'Fall', '2026-2027', 'Enrolled'),
(12, 20, '2026-09-12', 'Fall', '2026-2027', 'Enrolled'),

(13, 9, '2026-09-13', 'Fall', '2026-2027', 'Enrolled'),
(13, 12, '2026-09-13', 'Fall', '2026-2027', 'Enrolled'),

(14, 13, '2026-09-14', 'Fall', '2026-2027', 'Dropped'),
(14, 16, '2026-09-14', 'Fall', '2026-2027', 'Enrolled'),

(15, 1, '2026-09-15', 'Fall', '2026-2027', 'Enrolled'),
(15, 3, '2026-09-15', 'Fall', '2026-2027', 'Completed')
RETURNING *;
SELECT COUNT(*) AS total_enrollments
FROM enrollments;