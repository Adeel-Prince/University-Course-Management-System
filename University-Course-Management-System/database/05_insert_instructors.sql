--insert data into instructors table...
INSERT INTO instructors (
    first_name,
    last_name,
    email,
    phone,
    qualification,
    hire_date,
    salary,
    department_id,
    status
)
VALUES
('Muhammad', 'Usman', 'usman.instructor@example.com', '03001234567', 'PhD Computer Science', '2018-03-15', 180000.00, 1, 'Active'),
('Ayesha', 'Khan', 'ayesha.instructor@example.com', '03011234567', 'MS Software Engineering', '2020-08-10', 140000.00, 1, 'Active'),
('Ahmed', 'Raza', 'ahmed.instructor@example.com', '03021234567', 'PhD Computer Science', '2017-01-20', 200000.00, 2, 'Active'),
('Sana', 'Malik', 'sana.instructor@example.com', '03031234567', 'MS Computer Science', '2021-06-01', 125000.00, 2, 'Active'),
('Bilal', 'Hassan', 'bilal.instructor@example.com', '03041234567', 'PhD Electrical Engineering', '2016-09-12', 190000.00, 3, 'Active'),
('Hira', 'Javed', 'hira.instructor@example.com', '03051234567', 'MS Electrical Engineering', '2019-02-18', 150000.00, 3, 'Active'),
('Kamran', 'Ali', 'kamran.instructor@example.com', '03061234567', 'MBA Finance', '2018-11-05', 160000.00, 4, 'Active'),
('Zainab', 'Iqbal', 'zainab.instructor@example.com', '03071234567', 'MS Business Administration', '2022-01-10', 115000.00, 4, 'Active'),
('Farhan', 'Ahmed', 'farhan.instructor@example.com', '03081234567', 'PhD Mathematics', '2015-07-22', 185000.00, 5, 'Active'),
('Maryam', 'Noor', 'maryam.instructor@example.com', '03091234567', 'MS Applied Mathematics', '2020-04-13', 130000.00, 5, 'Inactive')
RETURNING *;
SELECT *
FROM instructors
ORDER BY instructor_id ASC;