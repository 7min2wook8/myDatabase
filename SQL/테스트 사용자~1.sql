
drop table student_t;

create table student_t(
    --�⺻Ű, ��Ű, pk
    id VARCHAR2(10) PRIMARY KEY,
    name VARCHAR2(20),
    age NUMBER(3),
    tel VARCHAR2(20) not null    
);

insert into student_t VALUES('st-1000', '��ö��', 10, '010-1234-5678');
insert into student_t VALUES('st-1002', '�迵��', 15, '010-1234-5678');
insert into student_t VALUES('st-1003', 'ȫ�浿', 300, '010-1234-5678');
insert into student_t VALUES('st-1004', '����', 65, '010-1234-5678');
insert into student_t VALUES('st-1005', '���缮', 60, '010-1234-5678');
insert into student_t VALUES('st-1006', '������', 55, '010-1234-5678');

insert into student_t(id,name) VALUES('st-1006', '����');
commit;

select * FROM student_t;

alter TABLE student_t MODIFY tel varchar2(30);
