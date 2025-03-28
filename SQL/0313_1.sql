create table month_sell(
    pro_id VARCHAR2(5),     --��ǰID
    month VARCHAR2(10),     --��
    company VARCHAR2(10),   --ȸ��
    money   number          --�����
);

insert into month_sell values('p0001', '24/01/31','�Ｚ', 55000);
insert into month_sell values('p0001', '24/03/31','�Ｚ', 75000);
insert into month_sell values('p0002', '24/01/31','lg', 55000);
insert into month_sell values('p0002', '24/01/31','lg', 25000);
insert into month_sell values('p0003', '24/03/31','����', 15000);
insert into month_sell values('p0003', '24/01/31','����', 25000);

commit;


select * from month_sell;

--��ǰ ID, ������ �� ���� �հ踦 �˻�
select pro_id, month, sum(money) as "�����"
from month_sell
group by pro_id, month
order by pro_id;

--rollup ������ �Լ�
--3���� : ��ǰID, ��, �����
--2���� : ��ǰID, ��ǰ�� �����
--1���� : �����
select pro_id, month, sum(money) as "�����"
from month_sell
group by ROLLUP (pro_id, month);

--1���� : �����
--2���� : ��, ������ �����
--3���� : ��ǰID, ��ǰ�� �����
--4���� : ��ǰID �� �����

select pro_id, month, sum(money) as "�����"
from month_sell
group by cube (pro_id, month);

--1.�μ���ȣ, ������, �����, �޿� �Ѿ��� rollup, cube�� ����Ͽ� �˻�
--2.decode�� ����ؼ� �μ���� �������� �ѱ۷� ���

select decode( dno, 10, 'ȸ����', 20, 'ȫ����', 30, '������', '�μ��� �հ�') as "�μ���",
       decode( job, 'CLERK', '�繫', 'PRESIDENT', '����', 'MANAGER', '����',
                    'ANALYST', '����', 'SALESMAN', '����', NULL, ' ') AS "������",
        count(*), sum(salary)
from employee
group by rollup(dno, job);
--group by cube(dno, job);

select dno, job, count(*), sum(salary)
from employee
--group by rollup(dno, job);
group by cube(dno, job);



