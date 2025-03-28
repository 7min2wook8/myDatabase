--[�˻�]
--1. �⺻ �˻�
--2. �׷� �˻�
--3. ���� �˻�
--4. ���� ����

select ename, salary from employee
where salary > (select salary from employee where ename = 'SCOTT');


--1. ������ ���� ���� : ���� ���� ����� 1��
--���� �� ������ (>, =, >=, <>, <, <= )
--scott �� ������ �μ����� �ٹ��ϴ� ���� �˻�
select ename, dno from employee
where ename != 'SCOTT' and 
dno = (select dno from employee where ename = 'SCOTT');


--2. ������ ���� ���� : ���� ���� ����� ���� ��
-- ������ �� ������(in(and), any(or), all, some, exists)

--�μ��� �ּ� �޿��� �޴� ����� �����ȣ, �̸� �˻�
select eno, ename, salary from employee
    where salary in (select min(salary) from employee GROUP by dno);
                -- �� 800, 950, 1300 ����

--������ SALESMAN�� �ƴϸ鼭 �޿��� ������ SALESMAN���� ���� ��� �˻�
SELECT ENO, ename, JOB, SALARY FROM employee
    WHERE JOB <> 'SALESMAN' AND salary < ANY (
        SELECT SALARY 
        FROM EMPLOYEE 
        WHERE JOB = 'SALESMAN') ;
        
        
--������ SALESMAN�� �ƴϸ鼭 �޿��� ��� SALESMAN���� ���� ��� �˻�
SELECT ENO, ename, JOB, SALARY FROM employee
    WHERE JOB <> 'SALESMAN' AND 
    salary < ALL (
        SELECT SALARY 
        FROM EMPLOYEE 
        WHERE JOB = 'SALESMAN') ;

--�������� ����
--1. ��� ��ȣ�� 7788�� ����� �������� ���� �����, ������ ���
SELECT ename,JOB 
FROM EMPLOYEE
WHERE JOB = (SELECT JOB 
                FROM employee 
                WHERE ENO = 7788);
                
--2. �����ȣ�� 7499���� �޿��� ���� �����, ������, �޿� ���
SELECT ENAME, JOB, SALARY
    FROM employee
    WHERE SALARY > (SELECT SALARY 
                        FROM employee
                        WHERE employee.eno = 7499);
                        
--3. �ּ�, �ִ� �޿��� �޴� �����, ������, �޿� ���
SELECT ENAME, JOB, SALARY 
    FROM employee
--    WHERE SALARY = (SELECT MAX(SALARY) FROM employee) OR
--          SALARY = (SELECT MIN(SALARY) FROM employee);
    where salary in ((SELECT MAX(SALARY) FROM employee), 
                     (SELECT MIN(SALARY) FROM employee));

--4. �μ��� �ּ� �޿��� �޴� �����, �޿�, �μ���ȣ ��� -�μ����� �������� ����
SELECT ENAME, SALARY, ENO 
    FROM employee    
    WHERE SALARY IN (select min(salary) from employee GROUP by dno)
    ORDER BY ENO DESC;
    
--5. �μ��� �ּ� �޿��� �޴� �����, �޿�, �μ���ȣ, �μ���, �ٹ��� ���
SELECT e.ENAME, e.SALARY, e.dno, d.dname, d.loc
    FROM employee e, department d
    where e.dno = d.dno and SALARY IN (select min(salary) 
                                        from employee 
                                        GROUP by dno);
                                        
select ename, salary, dno,  (select dname from department where e.dno = dno),
                            (select loc from department where e.dno = dno) 
                            from employee e
    where salary in (select min(salary) from employee group by dno);
    

--6. �������� ANALYST�� ������� �޿��� �����鼭 ������ ANALYST�� �ƴ�
--���, �����, ������, �޿� ���, �޿��� ���� ������ ����
select eno, ename, job, salary
    from employee
    where job <> 'ANALYST' and 
    salary < all (select salary 
                  from employee
                  where job = 'ANALYST')
    order by salary desc;


--7. ���ӻ��(�Ŵ���)�� ���� ����� �˻� - �������� ���
SELECT ENAME FROM EMPLOYEE
--WHERE MANAGER IS NULL; (SELECT MANAGER FROM employee WHERE MANAGER IS NULL);
WHERE ENO IN(SELECT ENO FROM EMPLOYEE WHERE MANAGER IS NOT NULL);
--8. ���ӻ���� ���� �����, �μ���, �ٹ��� �˻� -���� 5�� �����Ͽ� 2���� ���
SELECT e.ENAME, e.JOB, d.loc FROM employee e, department d
    where e.dno = d.dno and e.manager is null;
    --ENO IN (SELECT ENO FROM EMPLOYEE WHERE MANAGER IS NULL)

--9. ���������� ���� ������ ���, �����, �޿� �˻�
select eno, ename, salary 
    from employee 
    where eno not in (select manager
                        FROM employee
                        where manager is not null);

--10.'BLAKE'�� ������ �μ��� ���� �����, �Ի���, �˻� - 'BLAKE'�� ��� ����
select ename, hiredate 
    from employee
    where dno = (select dno
                    from employee
                    where ename = 'BLAKE') and ename <> 'BLAKE';
                    
                    
--11. �ٹ����� 'DALLS'�� �����, �μ���ȣ, ������ �˻� - �̸����� ��������
select ename, dno, job 
    from employee
    where dno = (select dno 
                    from department 
                    where loc = 'DALLAS')
                        order by ename;
                    
select e.ename, e.dno, e.job
from employee e, department d
where d.dno = e.dno and 
d.loc = 'DALLAS' order by ename;

--12. 'SCOTT'�� ������ �μ����� �ٹ��ϴ� �����, �μ���ȣ, �μ���, �ٹ��� �˻�
--select e.ename, e.dno, e.job, d.loc from employee e, department d
--    where e.dno = d.dno and d.dname = (select d.dname from employee e, department d 
--                                            where e.ename = 'SCOTT' and e.dno = d.dno);
    
select ename, dno, 
    (select dname from department where e.dno = dno) "�μ���", 
    (select loc from department where e.dno = dno) "�ٹ���" 
    from employee e
        where dno = (select dno from employee where ename = 'SCOTT');
    
--13. ���������� ������ ANALYST �� ������� �޿��� ���� ������ 'CLERK'�� �ƴ� ������߿��� �ְ� �޿��� �˻�
select job, max(salary)
    from employee 
    where salary  < all (select salary from employee where job = 'ANALYST') and 
    job <> 'CLERK'
    group by job;