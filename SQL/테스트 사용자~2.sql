/*
    1. ���̺� person_t ����
    2. �ֹι�ȣ(����, 14) �̸�(����, 10) ����(����,3) ��ȭ(���� 20), �ּ�(����, 50) ���(���� 50)
    3. �ֹε�Ϲ�ȣ�� �ߺ��ɼ� ���� ������ ����
    4. ��� �÷��� ���� NULL���� ������� ����
    5. ������ ������ 3�� �Է��ϱ�
    6. ��� ������ �˻��ϱ�    
*/
drop table person_t;
create table person_t(
    regNumber VARCHAR2(14) PRIMARY key,
    name VARCHAR2(10) not null,
    age NUMBER(3) not null,
    tell VARCHAR2(20) not null,
    addres VARCHAR2(50) not null,
    hobby VARCHAR2(30) not null
);


insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('090909-090909', 'ȫ�浿', 300, '010-0000-0000','���� �强�� ������','����');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('720814-090909', '���缮', 52, '010-1111-1111','����Ư���� ���α� ������','����mc');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('930516-090909', '������', 31, '010-2222-2222','����Ư���� ������ ������','����');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('790331-090909', '��ȫö', 45, '010-3333-3333','����Ư���� ������ �Ż絿','������');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('710318-090909', '������', 53, '010-4444-4444','����Ư���� �������� ��浿','������');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('790820-090909', '����', 45, '010-5555-5555','����Ư���� ������ ������','����');

select * from person_t;

select * from person_t where name = 'ȫ�浿';

select * from person_t where age=300;

select * from person_t where age=300 and name = 'ȫ�浿';

select * from person_t where age=300 or name = 'ȫ�浿';


delete from person_t where name = 'ȫ�浿';

update person_t set name = '�����K' where name ='����';

delete from person_t;