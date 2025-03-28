--select���� �׷��� ����ϴ� ��� �ݵ�� ����ؾ��ϴ� ���� �Լ�

select sum(salary) as "�޿��Ѿ�", round(avg(salary)) as "�޿� ���",
    max(salary) as "�ִ� �޿�", min(salary) as "�ּ� �޿�",
    count(*) as "��� ��" from employee;
    
-- DB���� �׷��� ǥ���ϴ� ��� 2����
-- 1. ������ �Լ� ���
-- 2. group by �� ��� --> �ַ� ���

select count(*) as "����� ��" from employee;

--�ߺ����� �ʴ� ���� ������ ����
--distinct : �ߺ� ����
select DISTINCT job as "������ ����" from employee;
select count(DISTINCT job) as "������ ����" from employee;
select count(job) as "������ ����" from employee;

--�μ��� �޿� ����� ���϶�
select dno as "�μ� ��ȣ", round(avg(salary)) as "�޿� ���" 
from employee
group by dno;

--�μ��� �׸��� ������(GROUP BY dno, job)�� �μ���ȣ, ������, ����� ��(count(*)), �޿� �� �հ�(sum(salary)) �˻�
select dno, job, count(*),sum(salary) from employee
GROUP BY dno, job
order by dno, job;

--�μ����� �ִ� �޿��� 3000 �޷� �̻��� �����ϴ� �μ�, �ִ� �޿� �˻�, 
select dno, max(salary) from employee
GROUP by dno
having max(salary) >= 3000;

--���ǿ� ���� ǥ���ϴ� 2���� ���
select ename, dno, decode(dno, 10, 'ȸ����',
                                20, 'ȫ����',
                                30, '������',
                                40, '�濵������', '�μ�����') as "�μ���"
from employee
order by dno;

select ename, dno, case when dno = 10 then 'ȸ����'
                        when dno = 20 then 'ȫ����'
                        when dno = 30 then '������'
                        when dno = 40 then '�濵������'
                        else '�μ�����'
                        end as "�μ���"
                        
from employee 
order by dno;


--��������
--1. �μ��� �ο��� 3���� ���� �μ��� �μ���ȣ, �ο���, �޿��� �հ� �˻�
select dno, count(*), sum(salary) 
from employee
group by dno
having count(*) > 3;

--2. ������ �޿� �ְ��, ������, �Ѿ�, ��� �˻� - ����� �ݿø� ó��
select dno, max(salary), min(salary), sum(salary), round(avg(salary))
from employee
group by dno;

--3. �μ����� �������� ������ ����� �� �˻�
select dno, job, count(job) from employee
GROUP by dno, job
order by dno, job;


--4. ������ ����� ���� �޿� �˻� 
--  ����) �����ڸ� �� �� ���� ����� �����޿��� 2000�̸��� �׷��� ����
--  ����) �޿� ���� �������� ����
select job, min(salary) as "�����޿�"
from employee
where manager is not null
group by job
having min(salary) > 2000
order by min(salary) desc;

--5. �� �μ��� ���� �μ���ȣ, ��� ��, �μ����� ��� ����� ��� �޿��� �μ����� �˻�
--  ����) �μ� ���� �������� ����
select dno, count(*), round(avg(salary))
from employee
group by dno
order by dno;

--6. �� �μ��� ���� �μ���ȣ, �μ���, ������, ��� ��, �μ����� ��� ����� ��ձ޿� �˻�
--  ����) �μ���, �������� department ���̺��� �����Ͽ� decode �Ǵ� case ���
select dno, case when dno = 10 then 'ACCOUNT'
                when dno = 20 then 'RESEARCH'
                when dno = 30 then 'SALES'
                when dno = 40 then 'OPERATIONS'
                else 'Not found'
                end as "�μ���",
            case when dno = 10 then 'NEW YORK'
                when dno = 20 then 'DALLAS'
                when dno = 30 then 'CHICAGO'
                when dno = 40 then 'BOSTON'
                else 'Not found'
                end as "������",
    count(*), round(avg(salary))
    
    from employee
    
group by dno;
                
