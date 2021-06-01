-- 1번) 부서ID, 거주도시명, 주소 검색하시오.(단 부서가 없는 거주도시명도 검색결과에 포함되도록 출력하라)

set linesize 200
set pagesize 200
SELECT department_id, city, street_address
FROM departments d, locations l
where d.LOCATION_ID(+) = l.LOCATION_ID;