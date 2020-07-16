# 4)
select e.first_name from hr.departments d inner join hr.employees e on e.department_ID=d.department_id
where e.salary>(select avg(e.salary) from hr.employess e);

-- 1)
SELECT first_name, department_name
FROM hr.Employees E INNER JOIN hr.Departments D
ON E.Department_ID = D.Department_ID;

-- 2)
SELECT max_salary, Salary, Max_Salary - Salary AS "Salary Gap",
  First_name, J.Job_Title
FROM HR.Employees E
INNER JOIN hr.jobs J ON E.Job_ID = j.Job_ID;
