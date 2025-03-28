--�޿��� 1500�޷� �̻��� ��� ����� �޿��� �˻�
select eno, ename, salary from employee
    where salary >= 1500;

--�޿��� 1500�޷��� �ٸ� ���, �����, �޿��� �˻�
select eno, ename, salary from employee
    where salary <> 1500;

-- ���� : ���� ������ '' �ݵ�� �����
select * from employee where ename = 'SCOTT';

--��¥ ������ ��ȸ
select * from employee where hiredate <= '1981/01/01';
select * from employee where hiredate <= '81/01/01';


--�� ������ : and, or, not
select * from employee where dno = 10 and job ='MANAGER';

--�� and �����ڿ� ����
select * from employee where salary BETWEEN 1000 and 1500;

--�� or �����ڿ� ����
select * from employee where commission in(300, 500, 1400) ;

--Ư������ �˻� �Ǵ� ����
--% ��� ���� ��� ����, �ڸ��� ������ ����
-- _ : ��� ���� ��� ����, �ڸ��� 1�� ����

-- ename�� A�� �����ϴ� ���� ã��
select * from employee where ename like 'A%';

--ù ��° �ڸ��� � ���ڰ� �͵� �ǰ� �ι�° ���ڴ� ������ A�̰�
--�ڿ��� �ƹ� ���ڳ� ���� ��
select * from employee where ename like '_A%';

--null�� �˻�
select * from employee where commission is null;
select * from employee where commission is not null;
--select * from employee where commission = null; <- �Ұ���

--���� ����
select * from employee order by salary asc;

--���� ����
select * from employee order by salary desc;

select * from employee order by ename desc;
-- �޿��� ���� ���� ������ �ϴٰ� ������ ���� �����͵��� 2�� �̻� �����ϸ�
--ename���� ���� ���� ����
select * from employee order by ename  desc, salary asc;

--��������
--1. ��� ��ȣ�� 7788�� ������ �μ���ȣ �˻�
select ENAME, DNO from employee where ENO = 7788;
--2. �޿��� 2000�޷��� �Ѵ� ������ �޿��� �޿��� ���� ������� �����Ͽ� �˻�
select ename, salary 
from employee 
where salary > 2000
order by ename desc;

--3. ��� ����� ���ؼ� 300�޷� �޿� �λ��� ������ �� �����, �޿�, �λ�� �޿� �˻�
select ename, salary as "�޿�", salary+300 "�λ�� �޿�" from employee;

--4. �����, �޿�, ���� ����(�󿩱� ����)�� ������ ���� ������ �˻�
--nvl(commission, 0) : NULL���� 0���� ����
select ename, salary, (salary*12)+ nvl(commission, 0) as year_Salary
from employee order by year_Salary;

--5. �޿��� 2000~3000 ���̿� ���Ե��� �ʴ� ��� �˻�
select ename 
from employee 
where salary not between 2000 and 3000;

--6. �޿��� 1000~2000 ���̿� ���ԵǴ� ��� �˻�. �޿��� ���� ������ ����
select ename, salary from employee 
where salary between 1000 and 2000
order by salary desc;

--7. 1981�� 2�� 20 ~ 1981�� 5�� 1�� ���̿� �Ի��� �����, ������, �޿�, �Ի��� �˻�
--���� �Ի��� ������ ����
select ename, job, salary, hiredate 
from employee
where hiredate >= '81/2/20' and hiredate <= '81/5/1'
order by hiredate;

--8. �μ���ȣ�� 20 �Ǵ� 30�� ���ϴ� �����, �μ���ȣ, ������ �˻�.
-- �������� �̸� ����
select ename, dno, job 
from EMPLOYEE 
--where dno = 20 or dno =30
where dno in (20, 30)
order by ename;

--9. ��� �޿��� 2000~3000�̰� �μ���ȣ�� 20�Ǵ� 30�� �����, �޿�, �μ���ȣ �˻�.
--���� ���� �̸� ����
select ename, salary ,dno 
from EMPLOYEE 
--where (dno = 20 or dno =30) and
where dno in(20, 30) and
salary between 2000 and 3000
order by ename;

--10. 1981�⵵ �Ի��� ��� ����� �̸��� �Ի��� �˻�
select ename, hiredate from employee 
--where hiredate >= '81/1/1' and hiredate <= '81/12/31';
where hiredate between '81/1/1' and '81/12/31';

--11. �����ڰ� ���� ����� �̸��� ������ �˻�
select ename, job 
from employee 
where manager is null;
--12. �󿩱��� ���� �����, �޿�, �󿩱� �˻�. 
--�޿�, �󿩱��� ���� ������ ����
select ename, salary, COMMISSION
from employee
where COMMISSION is not null and COMMISSION > 0
order by salary desc, COMMISSION desc ;

--13. ����� 'A' �Ǵ� 'E'�� ��� �����ϴ� ����� ��� ���� �˻�
select * from employee
where ename like '%A%' or ename like '%E%';


--14. �̸��� 3��° ���ڰ� 'R'�� ��� ��� �����˻�
select * from employee
where ename like '__R%';

--15. �������� �繫�� �Ǵ� ��������̸鼭 �޿��� 1600, 950, 1300�� �ƴ� �����
--�̸�, ������, �޿� �˻�
select ename, job, salary
from employee
where (job = 'SALESMAN' or job = 'CLERK') and  --job in ('CLERK','SALESMAN')
not salary in(1600, 950, 1300);

