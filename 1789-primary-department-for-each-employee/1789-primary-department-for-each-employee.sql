SELECT 
    e1.employee_id, 
    e1.department_id
FROM Employee e1
WHERE e1.primary_flag = (
    SELECT MAX(e2.primary_flag)
    FROM Employee e2
    WHERE e2.employee_id = e1.employee_id
);
