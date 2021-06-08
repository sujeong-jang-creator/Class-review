import cx_Oracle

connection = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
print("1----", connection)    # 1---- <cx_Oracle.Connection to SCOTT@xe>

cursor = connection.cursor()
print("2----", cursor)

cursor.execute('''SELECT * FROM dept''')

for deptno, dname, loc in cursor:
    print("Values:", deptno, dname, loc)

cursor.close()
connection.close()