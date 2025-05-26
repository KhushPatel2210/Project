-- View all companies
SELECT * FROM company;

-- View all employees
SELECT * FROM employee;

-- View all projects
SELECT * FROM projects;

-- View all assignments
SELECT * FROM assignments;

-- View all feedback
SELECT * FROM feedback;

-- List of employees with their company names
SELECT 
    e.first_name, 
    e.last_name, 
    e.email, 
    c.name AS company_name
FROM employee e
INNER JOIN company c ON e.company_id = c.company_id;

-- List of projects with their assigned employees
SELECT 
    p.project_name, 
    e.first_name, 
    e.last_name, 
    a.role
FROM assignments a
INNER JOIN employee e ON a.employee_id = e.employee_id
INNER JOIN projects p ON a.project_id = p.project_id;

-- Total hours committed per employee
SELECT 
    e.first_name, 
    e.last_name, 
    SUM(a.hours_committed) AS total_hours
FROM employee e
INNER JOIN assignments a ON e.employee_id = a.employee_id
GROUP BY e.employee_id;

-- Feedback given for each assignment
SELECT 
    e.first_name, 
    e.last_name, 
    f.comments, 
    f.rating
FROM feedback f
INNER JOIN assignments a ON f.assignment_id = a.assignment_id
INNER JOIN employee e ON a.employee_id = e.employee_id;

-- Projects currently ongoing (based on today's date)
SELECT 
    project_name, 
    start_date, 
    end_date
FROM projects
WHERE start_date <= NOW() AND end_date >= NOW();
