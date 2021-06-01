-- 직원중에 [sales] 부서에 있는 직원의 전화번호를 출력하세요.

SELECT * FROM departments;
SELECT * FROM employees;

SELECT first_name, department_name, phone_number
FROM departments de, employees em
WHERE department_name = 'Sales' AND de.department_id(+) = em.department_id;

SQL> SELECT first_name, department_name, phone_number
  2  FROM departments de, employees em
  3  WHERE department_name = 'Sales' AND de.department_id(+) = em.department_id;

FIRST_NAME                               DEPARTMENT_NAME                                              PHONE_NUMBER
---------------------------------------- ------------------------------------------------------------ ----------------------------------------
John                                     Sales                                                        011.44.1344.429268
Karen                                    Sales                                                        011.44.1344.467268
Alberto                                  Sales                                                        011.44.1344.429278
Gerald                                   Sales                                                        011.44.1344.619268
Eleni                                    Sales                                                        011.44.1344.429018
Peter                                    Sales                                                        011.44.1344.129268
David                                    Sales                                                        011.44.1344.345268
Peter                                    Sales                                                        011.44.1344.478968
Christopher                              Sales                                                        011.44.1344.498718
Nanette                                  Sales                                                        011.44.1344.987668
Oliver                                   Sales                                                        011.44.1344.486508
Janette                                  Sales                                                        011.44.1345.429268
Patrick                                  Sales                                                        011.44.1345.929268
Allan                                    Sales                                                        011.44.1345.829268
Lindsey                                  Sales                                                        011.44.1345.729268
Louise                                   Sales                                                        011.44.1345.629268
Sarath                                   Sales                                                        011.44.1345.529268
Clara                                    Sales                                                        011.44.1346.129268
Danielle                                 Sales                                                        011.44.1346.229268
Mattea                                   Sales                                                        011.44.1346.329268
David                                    Sales                                                        011.44.1346.529268
Sundar                                   Sales                                                        011.44.1346.629268
Amit                                     Sales                                                        011.44.1346.729268
Lisa                                     Sales                                                        011.44.1343.929268
Harrison                                 Sales                                                        011.44.1343.829268
Tayler                                   Sales                                                        011.44.1343.729268
William                                  Sales                                                        011.44.1343.629268
Elizabeth                                Sales                                                        011.44.1343.529268
Sundita                                  Sales                                                        011.44.1343.329268
Ellen                                    Sales                                                        011.44.1644.429267
Alyssa                                   Sales                                                        011.44.1644.429266
Jonathon                                 Sales                                                        011.44.1644.429265
Jack                                     Sales                                                        011.44.1644.429264
Charles                                  Sales                                                        011.44.1644.429262

34 rows selected.