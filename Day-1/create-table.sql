-- Drop tables if they exist (to avoid errors if re-running)
DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS company;

-- Create company table
CREATE TABLE company (
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    contact VARCHAR(100)
);

-- Create employee table
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES company(company_id),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create projects table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES company(company_id),
    project_name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE
);

-- Create assignments table
CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL REFERENCES projects(project_id),
    employee_id INTEGER NOT NULL REFERENCES employee(employee_id),
    role VARCHAR(100),
    hours_committed DECIMAL(5,2) -- e.g., 12.5 hours
);

-- Create feedback table
CREATE TABLE feedback (
    feedback_id SERIAL PRIMARY KEY,
    assignment_id INTEGER NOT NULL REFERENCES assignments(assignment_id),
    comments TEXT,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    date_submitted TIMESTAMP WITH TIME ZONE DEFAULT now()
);
