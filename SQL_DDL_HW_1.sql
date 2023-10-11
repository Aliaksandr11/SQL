1. Создать таблицу employees
   - id. serial,  primary key,
   - employee_name. Varchar(50), not null
   
   CREATE TABLE employees (id serial PRIMARY KEY,
   employee_name Varchar(50) not null);

2. Создать таблицу salary
   - id. Serial  primary key,
   - monthly_salary. Int, not null
   
   CREATE TABLE salary (id serial PRIMARY KEY,
   monthly_salary INT NOT NULL);
   
3. Наполнить таблицу salary 15 строками:
   INSERT INTO salary (monthly_salary)
   VALUES (1000),
          (1100),
          (1200),
          (1300),
          (1400),
          (1500),
          (1600),
          (1700),
          (1800),
          (1900),
          (2000),
          (2100),
          (2200),
          (2300),
          (2400),
          (2500);
          
4. Создать таблицу employee_salary
   - id. Serial  primary key,
   - employee_id. Int, not null, unique
   - salary_id. Int, not null
   
   CREATE TABLE employee_salary (id serial primary key,
   employee_id int not null unique,
   salary_id int not null);

5. Создать таблицу roles
   - id. Serial  primary key,
   - role_name. int, not null, unique
   
   CREATE TABLE roles (id serial primary key,
   role_name int not null unique) ; 
   
6. Поменять тип столба role_name с int на varchar(30)
   ALTER TABLE roles
   ALTER COLUMN role_name TYPE varchar(30);
   
7. Наполнить таблицу roles 20 строками:
   INSERT INTO roles(role_name)
   VALUES 
    ('Junior Python developer'),
    ('Middle Python developer'),
    ('Senior Python developer'),
    ('Junior Java developer'),
    ('Middle Java developer'),
    ('Senior Java developer'),
    ('Junior JavaScript developer'),
    ('Middle JavaScript developer'),
    ('Senior JavaScript developer'),
    ('Junior Manual QA engineer'),
    ('Middle Manual QA engineer'),
    ('Senior Manual QA engineer'),
    ('Project Manager'),
    ('Designer'),
    ('HR'),
    ('CEO'),
    ('Sales manager'),
    ('Junior Automation QA engineer'),
    ('Middle Automation QA engineer'),
    ('Senior Automation QA engineer');
    
8. Создать таблицу roles_employee
   - id. Serial  primary key,
   - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
   - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
   
   CREATE TABLE roles_employee (id serial primary key,
    employee_id int not null unique,
    role_id int not null,
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employees (id),
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles (id));




          
           
   
