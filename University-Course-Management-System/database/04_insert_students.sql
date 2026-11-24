-- insert data into students table...
INSERT INTO students (
    first_name,
    last_name,
    email,
    phone,
    gender,
    date_of_birth,
    admission_date,
    department_id,
    status
)
VALUES
('Adeel', 'Ahmad', 'adeel.ahmad@example.com', '03001234567', 'Male', '2002-05-14', '2024-09-01', 1, 'Active'),
('Ali', 'Hassan', 'ali.hassan@example.com', '03011234567', 'Male', '2001-08-21', '2023-09-01', 2, 'Active'),
('Fatima', 'Noor', 'fatima.noor@example.com', '03021234567', 'Female', '2003-02-10', '2024-09-01', 1, 'Active'),
('Usman', 'Khalid', 'usman.khalid@example.com', '03031234567', 'Male', '2002-11-18', '2023-09-01', 3, 'Active'),
('Hira', 'Malik', 'hira.malik@example.com', '03041234567', 'Female', '2001-04-25', '2022-09-01', 4, 'Graduated'),
('Ahmed', 'Raza', 'ahmed.raza@example.com', '03051234567', 'Male', '2003-07-12', '2024-09-01', 2, 'Active'),
('Ayesha', 'Siddiqui', 'ayesha.siddiqui@example.com', '03061234567', 'Female', '2002-01-30', '2023-09-01', 5, 'Active'),
('Bilal', 'Ahmed', 'bilal.ahmed@example.com', '03071234567', 'Male', '2001-12-05', '2022-09-01', 3, 'Inactive'),
('Zainab', 'Khan', 'zainab.khan@example.com', '03081234567', 'Female', '2003-09-16', '2024-09-01', 4, 'Active'),
('Hamza', 'Iqbal', 'hamza.iqbal@example.com', '03091234567', 'Male', '2002-03-22', '2023-09-01', 1, 'Active'),
('Maryam', 'Aslam', 'maryam.aslam@example.com', '03101234567', 'Female', '2001-06-11', '2022-09-01', 2, 'Graduated'),
('Hassan', 'Ali', 'hassan.ali@example.com', '03111234567', 'Male', '2003-10-08', '2024-09-01', 5, 'Active'),
('Sana', 'Javed', 'sana.javed@example.com', '03121234567', 'Female', '2002-12-19', '2023-09-01', 3, 'Active'),
('Daniyal', 'Shah', 'daniyal.shah@example.com', '03131234567', 'Male', '2001-07-27', '2022-09-01', 4, 'Inactive'),
('Iqra', 'Nadeem', 'iqra.nadeem@example.com', '03141234567', 'Female', '2003-04-03', '2024-09-01', 1, 'Active')
RETURNING *;

SELECT *
FROM students
ORDER BY student_id ASC;