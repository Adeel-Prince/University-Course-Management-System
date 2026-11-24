-- insert data into courses table...
INSERT INTO courses (
    course_code,
    course_name,
    description,
    credit_hours,
    fee,
    department_id,
    instructor_id
)
VALUES
-- Software Engineering (Department 1)
('SWE101', 'Programming Fundamentals', 'Introduction to programming concepts using C++.', 3, 12000.00, 1, 1),
('SWE201', 'Object Oriented Programming', 'Object-oriented programming concepts and principles.', 3, 15000.00, 1, 2),
('SWE301', 'Database Systems', 'Database design, SQL, normalization and transactions.', 3, 16000.00, 1, 1),
('SWE401', 'Software Architecture', 'Software architecture, design patterns and principles.', 3, 18000.00, 1, 2),

-- Computer Science (Department 2)
('CSC101', 'Introduction to Computer Science', 'Fundamental concepts of computer science.', 3, 12000.00, 2, 3),
('CSC201', 'Data Structures', 'Study of common data structures and their applications.', 3, 15000.00, 2, 4),
('CSC301', 'Design and Analysis of Algorithms', 'Algorithm design techniques and complexity analysis.', 3, 17000.00, 2, 3),
('CSC401', 'Artificial Intelligence', 'Introduction to AI concepts and intelligent systems.', 3, 20000.00, 2, 4),

-- Electrical Engineering (Department 3)
('EEE101', 'Circuit Analysis', 'Analysis of basic electrical circuits.', 3, 13000.00, 3, 5),
('EEE201', 'Digital Logic Design', 'Digital circuits, logic gates and Boolean algebra.', 3, 15000.00, 3, 6),
('EEE301', 'Signals and Systems', 'Analysis of continuous and discrete-time signals.', 3, 17000.00, 3, 5),
('EEE401', 'Microprocessors', 'Microprocessor architecture and interfacing.', 3, 19000.00, 3, 6),

-- Business Administration (Department 4)
('BUS101', 'Principles of Management', 'Introduction to management principles and practices.', 3, 12000.00, 4, 7),
('BUS201', 'Marketing Management', 'Marketing strategies, planning and consumer behavior.', 3, 14000.00, 4, 8),
('BUS301', 'Financial Accounting', 'Fundamentals of financial accounting and reporting.', 3, 16000.00, 4, 7),
('BUS401', 'Business Analytics', 'Data-driven decision-making for business.', 3, 18000.00, 4, 8),

-- Mathematics (Department 5)
('MAT101', 'Calculus I', 'Limits, derivatives and basic integration.', 3, 11000.00, 5, 9),
('MAT201', 'Linear Algebra', 'Matrices, vectors and systems of linear equations.', 3, 13000.00, 5, 10),
('MAT301', 'Probability and Statistics', 'Probability theory and statistical methods.', 3, 15000.00, 5, 9),
('MAT401', 'Discrete Mathematics', 'Logic, sets, relations, graphs and combinatorics.', 3, 16000.00, 5, 10)
RETURNING *;
SELECT COUNT(*) AS total_courses
FROM courses;
Select * from courses;