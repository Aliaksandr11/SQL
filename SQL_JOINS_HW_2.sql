1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
SELECT employee_name, monthly_salary FROM employees
JOIN employee_salary ON employees.id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id;
  
2. Вывести всех работников у которых ЗП меньше 2000.
SELECT employee_name, monthly_salary FROM employees
JOIN employee_salary es ON employees.id = es.employee_id
JOIN salary ON es.salary_id = salary.id
WHERE monthly_salary < 2000;
  
3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT s.id, monthly_salary
FROM salary s
LEFT JOIN employee_salary es ON s.id = es.salary_id
WHERE es.employee_id IS NULL;
  
4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT s.id, monthly_salary
FROM salary s
LEFT JOIN employee_salary es ON s.id = es.salary_id
WHERE es.employee_id IS NULL AND monthly_salary < 2000;

5. Найти всех работников кому не начислена ЗП.
SELECT employee_name FROM employees
LEFT JOIN employee_salary es ON employees.id = es.employee_id
WHERE es.salary_id IS NULL;

6. Вывести всех работников с названиями их должности.
SELECT e.employee_name, r.role_name
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id;

7. Вывести имена и должность только Java разработчиков.
SELECT e.employee_name, r.role_name
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
WHERE r.role_name LIKE '%Java%';

8. Вывести имена и должность только Python разработчиков.
SELECT e.employee_name, r.role_name
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
WHERE r.role_name LIKE '%Python%';

9. Вывести имена и должность всех QA инженеров.
SELECT employee_name, role_name FROM employees
JOIN roles_employee re ON employees.id =re.employee_id
JOIN roles ON roles.id = re.role_id
WHERE roles.role_name LIKE '%QA%';

10. Вывести имена и должность ручных QA инженеров.
SELECT employee_name, role_name FROM employees
JOIN roles_employee re ON employees.id = re.employee_id
JOIN roles ON roles.id = re.role_id 
WHERE roles.role_name LIKE '%QA%' AND roles.role_name LIKE '%Manual%';

11. Вывести имена и должность автоматизаторов QA.
SELECT employee_name, role_name FROM employees
JOIN roles_employee re ON employees.id = re.employee_id
JOIN roles ON roles.id = re.role_id 
WHERE roles.role_name LIKE '%QA%' AND roles.role_name LIKE '%Automation%';

12. Вывести имена и зарплаты Junior специалистов.
SELECT employee_name, monthly_salary, role_name FROM employees
JOIN employee_salary es ON employees.id = es.employee_id
JOIN salary ON salary.id = es.salary_id
JOIN roles_employee re ON employees.id = re.employee_id
JOIN roles ON roles.id = re.role_id
WHERE roles.role_name LIKE '%Junior%';

13. Вывести имена и зарплаты Middle специалистов.
SELECT employee_name, monthly_salary, role_name FROM employees
JOIN employee_salary es ON employees.id = es.employee_id
JOIN salary ON salary.id = es.salary_id
JOIN roles_employee re ON employees.id = re.employee_id
JOIN roles ON roles.id = re.role_id
WHERE roles.role_name LIKE '%Middle%';

14. Вывести имена и зарплаты Senior специалистов.
SELECT employee_name, monthly_salary, role_name FROM employees
JOIN employee_salary es ON employees.id = es.employee_id
JOIN salary ON salary.id = es.salary_id
JOIN roles_employee re ON employees.id = re.employee_id
JOIN roles ON roles.id = re.role_id
WHERE roles.role_name LIKE '%Senior%';

15. Вывести зарплаты Java разработчиков.
SELECT role_name, monthly_salary FROM salary
JOIN employee_salary es ON salary.id = es.salary_id 
JOIN roles_employee re ON es.employee_id = re.employee_id 
JOIN roles ON roles.id = re.role_id
WHERE roles.role_name LIKE '%Java%';

16. Вывести зарплаты Python разработчиков.
SELECT role_name, monthly_salary FROM salary
JOIN employee_salary es ON salary.id = es.salary_id 
JOIN roles_employee re ON es.employee_id = re.employee_id 
JOIN roles ON roles.id = re.role_id
WHERE roles.role_name LIKE '%Python%';

17. Вывести имена и зарплаты Junior Python разработчиков.
SELECT e.employee_name, s.monthly_salary, r.role_name
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
JOIN salary s ON e.id = s.id
JOIN employee_salary es ON es.salary_id = s.id
WHERE r.role_name LIKE '%Junior Python%';

18. Вывести имена и зарплаты Middle JS разработчиков.
SELECT e.employee_name, s.monthly_salary, r.role_name
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
JOIN salary s ON e.id = s.id
JOIN employee_salary es ON es.salary_id = s.id
WHERE r.role_name LIKE '%Middle JavaScript%';

19. Вывести имена и зарплаты Senior Java разработчиков.
SELECT e.employee_name, s.monthly_salary, r.role_name
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
JOIN salary s ON e.id = s.id
JOIN employee_salary es ON es.salary_id = s.id
WHERE r.role_name LIKE '%Senior JavaScript%';

20. Вывести зарплаты Junior QA инженеров.
SELECT r.role_name, s.monthly_salary
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
JOIN salary s ON e.id = s.id
WHERE r.role_name LIKE '%Junior%' AND r.role_name LIKE '%QA%';

21. Вывести среднюю зарплату всех Junior специалистов.
SELECT AVG(monthly_salary) FROM salary
JOIN employee_salary es ON salary.id = es.salary_id
JOIN roles ON roles.id = salary.id
JOIN roles_employee re ON roles.id = re.employee_id
WHERE roles.role_name LIKE '%Junior%';


22. Вывести сумму зарплат JS разработчиков.
SELECT SUM(monthly_salary) FROM salary
JOIN employee_salary es ON salary.id = es.salary_id
JOIN roles ON roles.id = salary.id
JOIN roles_employee re ON roles.id = re.employee_id
WHERE roles.role_name LIKE '%Java%';


23. Вывести минимальную ЗП QA инженеров.
SELECT MIN(monthly_salary) FROM salary
JOIN employee_salary es ON salary.id = es.salary_id
JOIN roles ON roles.id = salary.id
JOIN roles_employee re ON roles.id = re.employee_id
WHERE roles.role_name LIKE '%QA%';


24. Вывести максимальную ЗП QA инженеров.
SELECT MAX(monthly_salary) FROM salary
JOIN employee_salary es ON salary.id = es.salary_id
JOIN roles ON roles.id = salary.id
JOIN roles_employee re ON roles.id = re.employee_id
WHERE roles.role_name LIKE '%QA%';

25. Вывести количество QA инженеров.
SELECT COUNT(role_name) FROM roles
JOIN roles_employee re ON re.role_id = roles.id
WHERE roles.role_name LIKE '%QA%';

26. Вывести количество Middle специалистов.
SELECT COUNT(role_name) FROM roles
JOIN roles_employee re ON re.role_id = roles.id
WHERE roles.role_name LIKE '%Middle%';

27. Вывести количество разработчиков.
SELECT COUNT(role_name) FROM roles
JOIN roles_employee re ON re.role_id = roles.id
WHERE roles.role_name LIKE '%developer%';

28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT SUM(monthly_salary) FROM salary
JOIN employee_salary es ON es.salary_id = salary.id
JOIN roles_employee re ON re.role_id = es.salary_id
JOIN roles ON roles.id = re.role_id
WHERE roles.role_name LIKE '%developer%';

29. Вывести имена, должности и ЗП всех специалистов по возрастанию.
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees e
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON es.salary_id = s.id
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
ORDER BY s.monthly_salary;

30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300.
SELECT employee_name, role_name, monthly_salary FROM employees e
JOIN employee_salary es ON es.employee_id = e.id 
JOIN salary ON salary.id = es.salary_id 
JOIN roles_employee re ON re.employee_id = e.id 
JOIN roles ON roles.id = re.role_id
WHERE monthly_salary BETWEEN 1700 AND 2300
ORDER BY monthly_salary;

31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300.
SELECT employee_name, role_name, monthly_salary FROM employees e
JOIN employee_salary es ON es.employee_id = e.id 
JOIN salary ON salary.id = es.salary_id 
JOIN roles_employee re ON re.employee_id = e.id 
JOIN roles ON roles.id = re.role_id
WHERE monthly_salary < 2300
ORDER BY monthly_salary;

32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000.
SELECT employee_name, role_name, monthly_salary FROM employees e
JOIN employee_salary es ON es.employee_id = e.id 
JOIN salary ON salary.id = es.salary_id 
JOIN roles_employee re ON re.employee_id = e.id 
JOIN roles ON roles.id = re.role_id
WHERE monthly_salary in (1100, 1500, 2000)
ORDER BY monthly_salary;




 















  
  
