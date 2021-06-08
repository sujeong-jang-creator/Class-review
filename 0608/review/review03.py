import cx_Oracle

conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
print("Database version:", conn.version)   # Database version: 11.2.0.2.0

cur = conn.cursor()

cur.execute('''select * from dept''')

rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()
conn.close()