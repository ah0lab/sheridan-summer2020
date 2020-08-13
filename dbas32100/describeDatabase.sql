SELECT owner, TABLE_NAME
FROM all_tables 
WHERE owner IN ('SI', 'HR');

DESCRIBE SI.Car;
DESCRIBE SI.Customer;
DESCRIBE SI.SALEINV;
DESCRIBE hr.DEPARTMENTS;
DESCRIBE hr.EMPLOYEES;

SELECT Department_ID, Department_Name FROM hr.Departments;

SELECT * FROM SI.SALEINV;