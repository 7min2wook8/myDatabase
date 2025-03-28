--���� : 2�� �̻��� ���̺��� �������� �����Ͽ� ������ �˻�

SELECT *
    FROM employee, department
    WHERE employee.dno = department.dno;


SELECT eno, ename, employee.dno, dname
    FROM employee, department
    WHERE employee.dno = department.dno;


SELECT e.eno, e.ename, d.dno, d.dname
    FROM employee e, department d       --��Ī ����
    WHERE e.dno = d.dno;                --��Ī ���� �� ���� �̸� ����ϸ� ���� �ȵ�

--1. ���� ���� : equi ����
--����� 7788 �� �����, �μ���, �ٹ����� �˻� -alias(��Ī) ���
SELECT d.dname "�����", d.dname "�μ���", d.loc "��Ī"
    FROM employee e, department d       
    WHERE e.dno = d.dno and e.eno = 7788;


--2. ���� ���� : �ڿ�����(natural join)--�ڵ� �ߺ� ���� : �ڿ� ����(natural join)
--���̺���� ���� ����ϸ� ���� �߻�
select eno, ename, dno, dname
    from employee e natural join department d
    where e.eno = 7788;


--3. ���� ���� : join ~ using(�ڿ� ���ΰ� ����)
select eno, ename, dno, dname
    from employee e join department d using(dno)
    where e.eno = 7788;

--4. ���� ���� : join ~ on(equi ���ΰ� ���� ��ø� �������)
select e.eno, e.ename, d.dno, d.dname
    from employee e join department d on e.dno = d.dno
    where e.eno = 7788;

-- ���� ���� : ������ �ϸ鼭 NULL���� �ڵ����� ����

-- �ܺ� ���� : ������ �ϸ鼭 NULL���� �˻�

--5. �������� : Non-equi ���� -> between, > , < , >= , <=
select ename "�����", salary "�޿�", grade "�޿����"
    from employee, salgrade
    where salary between losal and hisal;
    
--3���� ���̺��� ����
--�����, �μ���, �޿�, �޿���� �˻�
select e.ename "�����", d.dname "�μ���", e.salary , s.grade "�޿����"
    from employee e, salgrade s, department d
    where e.dno = d.dno and salary BETWEEN losal and hisal;


--�������� ���� ���� ������������ ��� ������!!!
--1. �̸��� 'A'�� ���Ե� ��� ����� �̸��� �μ��� �˻�
select ename, d.dname
    from employee e, department d
    where ename like '%A%' and e.dno = d.dno;

--2. Ŀ�̼��� ������ �����, �μ���, �ٹ���, �󿩱� �˻�
select e.ename, e.job, d.loc, e.commission
    from employee e, department d
    --where e.dno = d.dno and e.commission > 0;
    where e.dno = d.dno and nvl(e.commission , 0) > 0;

--3. ���忡 �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ, �μ��� �˻�
select e.ename, e.job, e.dno, d.dname
    from employee e, department d
    --where e.dno = 10 AND d.dno = e.dno;
    where e.dno = d.dno AND d.loc = 'NEW YORK';

