import psycopg2
import random

# Параметры подключения к базе данных
db_params = {
    'dbname': 'qa_ddl_36_35',
    'user': 'qa_36_gr_user_35',
    'password': '123',
    'host': '159.69.151.133',
    'port': '5056'
}

# Создание подключения к базе данных
conn = psycopg2.connect(**db_params)
cursor = conn.cursor()

# Создайте список уникальных значений для employee_id, предполагая, что у вас есть 70 уникальных записей в таблице employees
unique_employee_ids = list(range(1, 71))

# Перемешайте список уникальных значений
random.shuffle(unique_employee_ids)

# Генерация и вставка 40 строк с уникальными значениями для employee_id и случайными значениями для role_id
for i in range(1, 41):
    employee_id = unique_employee_ids[i - 1]
    role_id = random.randint(1, 15)  # Предполагается, что у вас есть 15 уникальных записей в таблице roles
    cursor.execute("INSERT INTO roles_employee (employee_id, role_id) VALUES (%s, %s)", (employee_id, role_id))

# Подтверждение изменений и закрытие соединения
conn.commit()
conn.close()
