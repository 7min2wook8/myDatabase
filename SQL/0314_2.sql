--0314_2
--select�� ������ ��Ÿ sql ���� crud, ddl

--pk fk���踦 �����ϰ� ������ ����
drop table department cascade CONSTRAINTS purge;


--department ���̺� ����(�����͸� ����, ���� ���� ����)
create table dept_copy as select * from department;

-- ������ �Ϻη� �������� �Ͽ� ������ ����
create table dept_copy2 as select * from department where 0=1;

create table emp_copy as select * from employee;

--��¥ ������ �Է�: to_date �Լ� ���
insert into emp_copy values (1234,'ȫ�浿', '�̻�', NULL, TO_DATE('1980-12-25','yyyy-mm-dd'),99000, NULL, 20);

select * from dept_copy;
-- �μ� ��ȣ�� 10�� �μ����� '���ߺ�', ������ '�뱸'�� ����
update dept_copy set dname='���ߺ�', loc = '�뱸' where dno = 10;

-- 10�� �μ��� �������� 20�� �μ��� ���������� ����
update dept_copy 
    set loc = (select loc 
                from dept_copy 
                where dno = 20) 
    where dno = 10;

-- emp_copy ���̺��� �����ο� �ٹ��ϴ� ��� ��� ����

delete from emp_cpy where dno =
(select dno from dept_copy where dnme = 'SALESl');


--����Ŭ���� �����ϴ� ��Ÿ �Լ���
--trunc () ��¥, ������ �Ҽ����� �ڸ�
--months_between (date1, date2) : date1�� date ������ ���� ���� ����

select ename "�����", sysdate "���� ��¥", hiredate "�Ի���",
    trunc(months_between(sysdate,hiredate)) "�ٹ� ������"
    from employee;


--�Ի����� 6������ ���� ���, �Ի��� �˻�
--add_months(date, n) : date�� n������ ����
select ename, hiredate, add_months(hiredate,6) "�Ի��Ͽ��� 6���� ���� ����"
    from employee;
    
--��¥ ǥ�� ���
-- to_char() : ��¥, ���ڸ� ���ڷ� ǥ��(to_date()�� �ٸ�)
select ename, hiredate, 
    to_char(hiredate, 'yy-mm'),
    to_char(hiredate,'yyyy_mm_dd'),
    to_char(hiredate,'[yy] [mm] [dd]') 
    from employee;
    
-- ���� ��¥, �ð� ǥ��
-- dual : ����Ŭ���� ����ϴ� �ӽ����̺�
select to_char(sysdate,'yyyy/mm/dd, hh24:mi:ss') from dual;
    
--��ȭ��ȣ
-- L : ������ ��ȭ ��ȣ
-- 0 : �ڸ����� ���� ������ '0'�� ä��
-- 9 : �ڸ����� ���� ������ ���ڸ� ������
select ename, to_char(salary, 'L000,000') from employee;
select ename, to_char(salary, 'L999,999') from employee;
select ename, to_char(salary, '$999,999') from employee;












