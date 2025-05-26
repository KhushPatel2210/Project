INSERT INTO company (name, address, contact) VALUES
('NovaTech Solutions', 'Mumbai, India', 'info@novatech.com'),
('EcoServe Pvt Ltd', 'Hyderabad, India', 'contact@ecoserve.com');

INSERT INTO employee (company_id, first_name, last_name, email) VALUES
(1, 'Aryan', 'Desai', 'aryan.desai@novatech.com'),
(1, 'Sneha', 'Verma', 'sneha.verma@novatech.com'),
(2, 'Rohan', 'Kapoor', 'rohan.kapoor@ecoserve.com'),
(2, 'Meera', 'Shah', 'meera.shah@ecoserve.com');

INSERT INTO projects (company_id, project_name, description, start_date, end_date) VALUES
(1, 'School Kit Donation Drive', 'Distribute school kits to underprivileged children.', '2024-07-05', '2024-07-20'),
(2, 'Water Conservation Workshop', 'Host workshops on water-saving techniques.', '2024-08-01', '2024-08-10');

INSERT INTO assignments (project_id, employee_id, role, hours_committed) VALUES
(1, 1, 'Coordinator', 18),
(1, 2, 'Volunteer', 10),
(2, 3, 'Team Lead', 22),
(2, 4, 'Volunteer', 12);

INSERT INTO feedback (assignment_id, comments, rating) VALUES
(1, 'Handled the event coordination really well.', 5),
(2, 'Active and helpful.', 4),
(3, 'Provided valuable leadership.', 5),
(4, 'Great energy and commitment.', 4);
