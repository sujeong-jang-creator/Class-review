import cx_Oracle

connection = cx_Oracle.connect(user='hr', password='hr', dsn='xe')
print("db 접속성공")

cursor=connection.cursor()

# result set
cursor.execute("""
            SELECT first_name, last_name
            FROM employees
            WHERE department_id = :a AND employee_id >:b""",
            a = 50,
            b = 190)

for fname, lname in cursor:
    print("View : ", fname, lname)

cursor.close()
connection.close()

