# Наполнить таблицу employee_salary 40 строками:
# - в 10 строк из 40 вставить несуществующие employee_id

import psycopg2
import random

# Установите соответствующие параметры подключения к вашей базе данных
db_params = {
    'dbname': 'qa_ddl_36_35',
    'user': 'qa_36_gr_user_35',
    'password': '123',
    'host': '159.69.151.133',
    'port': '5056'
}

# Создайте подключение к базе данных
conn = psycopg2.connect(**db_params)
cursor = conn.cursor()

# Генерируйте и вставляйте 30 уникальных строки с правильными employee_id
for employee_id in range(1, 31):
    salary_id = random.randint(1, 40)  # Здесь предполагается, что у вас есть 40 уникальных записей в таблице salary
    cursor.execute("INSERT INTO employee_salary (employee_id, salary_id) VALUES (%s, %s)", (employee_id, salary_id))

# Генерируйте и вставляйте 10 строк с несуществующими employee_id
for _ in range(10):
    employee_id = random.randint(100, 1000)  # Здесь используются произвольные значения, которые не существуют
    salary_id = random.randint(1, 40)
    cursor.execute("INSERT INTO employee_salary (employee_id, salary_id) VALUES (%s, %s)", (employee_id, salary_id))

# Подтвердите изменения и закройте соединение
conn.commit()
conn.close()
