# Наполнить таблицу employee 70 строками.

import psycopg2
from faker import Faker
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

# Создайте экземпляр Faker
fake = Faker()

# Генерируйте и вставляйте случайные имена и фамилии в таблицу
for _ in range(70):
    employee_name = fake.first_name() + ' ' + fake.last_name()
    cursor.execute("INSERT INTO employees (employee_name) VALUES (%s)", (employee_name,))


# Подтвердите изменения и закройте соединение
conn.commit()
conn.close()