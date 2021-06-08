import cx_Oracle

# dept01테이블을 생성하기 위한 함수를 정의
def dept01_create():
    # 원활할 로그인 여부를 위한 예외처리
    try:
        # cx_Oracle을 SCOTT계정과 연결 시도
        conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
        # 로그인이 잘 되었을 경우
        try:
            # 위의 try 커서를 연결
            cur = conn.cursor()
            # 실행 : dept01 테이블 드랍했다가 다시만듬(dept table기준)  
            cur.execute('drop table dept01')
            cur.execute('create table dept01 as select * from dept')
            cur.execute('alter table dept01 add constraint dept01_uk_deptno unique(deptno)')  # constraint : 제약조건
        except Exception as e:
            print(e)
        finally:
            cur.close()
            conn.close()
    except Exception as e:
        print(e)

dept01_create()

def dept01_query(find_dname):
    try:
        conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
        try:
            cur = conn.cursor()
            cur.execute("select * from dept01 where dname like :dname", dname=find_dname)
            rows = cur.fetchall()
            for row in rows:
                print(row)
        except Exception as e:
            print(e)
        finally:
            cur.close()
            conn.close()
    except Exception as e:
        print(e)