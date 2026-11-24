-- Create department Table...
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    building VARCHAR(100),
    budget NUMERIC(12,2)
);
select * from departments;

-- Create Students Table...
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    gender VARCHAR(10) CHECK (
        gender IN ('Male', 'Female', 'Other')
    ),
    date_of_birth DATE NOT NULL,
    admission_date DATE NOT NULL DEFAULT CURRENT_DATE,
    department_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Active'
        CHECK (status IN ('Active', 'Inactive', 'Graduated')),

    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
SELECT *
FROM students;

-- Create Instructors Table...
CREATE TABLE instructors (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    qualification VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE,
    salary NUMERIC(10,2) CHECK (salary > 0),
    department_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Active'
        CHECK (status IN ('Active', 'Inactive')),

    CONSTRAINT fk_instructor_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
SELECT *
FROM instructors;

-- Create Courses Table...
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    credit_hours INT NOT NULL
        CHECK (credit_hours BETWEEN 1 AND 6),
    fee NUMERIC(10,2) NOT NULL
        CHECK (fee >= 0),
    department_id INT NOT NULL,
    instructor_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_course_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    CONSTRAINT fk_course_instructor
        FOREIGN KEY (instructor_id)
        REFERENCES instructors(instructor_id)
);
SELECT *
FROM courses;

-- Create Enrollments Table...
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,

    student_id INT NOT NULL,
    course_id INT NOT NULL,

    enrollment_date DATE NOT NULL DEFAULT CURRENT_DATE,

    semester VARCHAR(20) NOT NULL
        CHECK (semester IN ('Spring', 'Summer', 'Fall')),

    academic_year VARCHAR(9) NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'Enrolled'
        CHECK (status IN ('Enrolled', 'Completed', 'Dropped')),

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),

    CONSTRAINT unique_student_course_semester
        UNIQUE (student_id, course_id, semester, academic_year)
);
SELECT *
FROM enrollments;

-- Create Grades Table...
CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,

    enrollment_id INT NOT NULL UNIQUE,

    marks_obtained NUMERIC(5,2) NOT NULL
        CHECK (marks_obtained BETWEEN 0 AND 100),

    total_marks NUMERIC(5,2) NOT NULL DEFAULT 100
        CHECK (total_marks > 0),

    letter_grade VARCHAR(2) NOT NULL
        CHECK (letter_grade IN ('A+', 'A', 'B', 'C', 'D', 'F')),

    remarks TEXT,

    result_date DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_grade_enrollment
        FOREIGN KEY (enrollment_id)
        REFERENCES enrollments(enrollment_id),

    CONSTRAINT check_marks_limit
        CHECK (marks_obtained <= total_marks)
);
SELECT *
FROM grades;