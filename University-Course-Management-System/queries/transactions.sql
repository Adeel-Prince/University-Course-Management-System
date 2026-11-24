-- BEGIN, COMMIT, ROLLBACK, SAVEPOINT, ROLLBACK TO

-- BEGIN and ROLLBACK
BEGIN;

UPDATE students
SET status = 'Inactive'
WHERE student_id = 1;

SELECT student_id, first_name, status
FROM students
WHERE student_id = 1;

ROLLBACK;

-- Check it now
SELECT student_id, first_name, status
FROM students
WHERE student_id = 1;

-- BEGIN and COMMIT 
BEGIN;

UPDATE students
SET phone = '03009998877'
WHERE student_id = 1;

COMMIT;
-- Check & Verify 
SELECT student_id, first_name, phone
FROM students
WHERE student_id = 1;

-- SAVEPOINT and ROLLBACK TO
BEGIN;

UPDATE students
SET status = 'Inactive'
WHERE student_id = 2;

SAVEPOINT student_update;

UPDATE students
SET status = 'Graduated'
WHERE student_id = 3;

ROLLBACK TO student_update;

COMMIT;
-- Check & Verify 
SELECT student_id, first_name, status
FROM students
WHERE student_id IN (2, 3)
ORDER BY student_id;