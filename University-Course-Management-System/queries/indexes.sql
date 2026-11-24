-- 	All 9 indexes and EXPLAIN ANALYZE

-- Create indexes for our UCMS
-- Students table indexes
CREATE INDEX idx_students_department
ON students(department_id);

CREATE INDEX idx_students_status
ON students(status);

-- Instructors table index
CREATE INDEX idx_instructors_department
ON instructors(department_id);

-- Courses table indexes
CREATE INDEX idx_courses_department
ON courses(department_id);

CREATE INDEX idx_courses_instructor
ON courses(instructor_id);

-- Enrollments table indexes
CREATE INDEX idx_enrollments_student
ON enrollments(student_id);

CREATE INDEX idx_enrollments_course
ON enrollments(course_id);

CREATE INDEX idx_enrollments_semester
ON enrollments(semester);

-- Grades table index
CREATE INDEX idx_grades_marks
ON grades(marks_obtained);

-- Verify created indexes
SELECT
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, indexname;

-- Test index usage
EXPLAIN ANALYZE
SELECT *
FROM students
WHERE department_id = 1;
