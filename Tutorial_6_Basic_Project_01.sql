SELECT * FROM employee;
# Create employee table
CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

# Create branch table and set mgr_id as foreign key referenced to employee table
CREATE TABLE branch (
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

# Add branch_id and super_id foreign keys to employee table

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

# Create client table
CREATE TABLE client(
	client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

# Create works_with table
CREATE TABLE works_with(
	emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

# Create branch_supplier table
CREATE TABLE branch_supplier(
	branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

# Start Inserting into employee table
# Note that we are leaving super_id and branch_id as null since those values are not created yet

INSERT INTO employee VALUES(100, 'David', 'Wallace', '1961-11-17', 'M', 250000, NULL, NULL);

# Start Inserting into branch table

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

# Now we have emp_id and branch_id we can complete null values for first insert

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

INSERT INTO employee VALUES(102, 'Micheal', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

# Insert into branch_supplier table
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

# Insert into client table
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

# Insert into works_with table
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

# QUERIES

#Task 1 Find all employees

SELECT * FROM employee;

#Task 2 Find all clients

SELECT * FROM client;

#Task 3 Find all employees order by salaries

SELECT * FROM employee
ORDER BY salary DESC;

#Task 4 Find all employees order by sex than name

SELECT * FROM employee
ORDER BY sex, first_name, last_name;

#Task 5 Find first 5 employees in the table

SELECT * FROM employee
LIMIT 5;

#Task 6 Find the first and last names of all employees

SELECT first_name, last_name FROM employee;

#Task 7 Find forename and surnames of all employees

SELECT first_name AS forename, last_name AS surname FROM employee;

#Task 8 Find out all the different genders

SELECT DISTINCT sex FROM employee;

#Task 8 Find out all the different branches

SELECT DISTINCT branch_id FROM employee;

# FUNCTIONS

#Task 1 Find the number of employees

SELECT COUNT(emp_id) FROM employee;

#Task 2 Find how many employees have supervisor

SELECT COUNT(super_id) FROM employee;

#Task 3 Find the number of female employees born after 1970

SELECT COUNT(emp_id) FROM employee
WHERE sex = 'F' AND birth_day > '1970-01-01';

#Task 4 Find the average of all employee's salaries

SELECT AVG(salary) FROM employee;

#Task 5 Find the average of male employee's salaries

SELECT AVG(salary) FROM employee
WHERE sex = 'M';

#Task 6 Find sum of all employee's salaries

SELECT SUM(salary) FROM employee;

#Task 7 Find out  how many males and females there are (AGGREGATION)

SELECT COUNT(sex), sex FROM employee
GROUP BY sex;

#Task 8 Find the total sales of each salesman

SELECT SUM(total_sales), emp_id FROM works_with
GROUP BY emp_id;

#Task 9 Find how much money each client spend

SELECT SUM(total_sales), client_id FROM works_with
GROUP BY client_id;

