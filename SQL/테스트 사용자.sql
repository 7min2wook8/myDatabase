/*
    ������ ����
    f5 : sql ��ɾ� ��ü ����
    ctrl + ���� : Ư�� �κи� ����
*/
drop TABLE customer;

create table customer(
  name varchar2(20),
  age number(5),
  gender char(1),
  reg_date date default sysdate
);

insert into customer (name, age, gender, reg_date)
    values('������',100,'F',sysdate);

insert into customer (name)
values('������',sysdate);


select * from customer;
--�ּ�