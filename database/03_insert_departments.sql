-- insert data into department table...
INSERT INTO departments (department_name, building, budget)
VALUES
    ('Software Engineering', 'Computing Block', 2500000.00),
    ('Computer Science', 'Computing Block', 2200000.00),
    ('Electrical Engineering', 'Engineering Block', 3000000.00),
    ('Business Administration', 'Business Block', 1800000.00),
    ('Mathematics', 'Science Block', 1500000.00)
RETURNING *;

SELECT *
FROM departments
ORDER BY department_id ASC;