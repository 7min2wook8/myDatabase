
drop table student_t;

create table student_t(
    --±âº»Å°, ÁÖÅ°, pk
    id VARCHAR2(10) PRIMARY KEY,
    name VARCHAR2(20),
    age NUMBER(3),
    tel VARCHAR2(20) not null    
);

insert into student_t VALUES('st-1000', '±èÃ¶¼ö', 10, '010-1234-5678');
insert into student_t VALUES('st-1002', '±è¿µÈñ', 15, '010-1234-5678');
insert into student_t VALUES('st-1003', 'È«±æµ¿', 300, '010-1234-5678');
insert into student_t VALUES('st-1004', '±è¸í¼ö', 65, '010-1234-5678');
insert into student_t VALUES('st-1005', 'À¯Àç¼®', 60, '010-1234-5678');
insert into student_t VALUES('st-1006', 'Á¤ÁØÇÏ', 55, '010-1234-5678');

insert into student_t(id,name) VALUES('st-1006', 'ÇÏÇÏ');
commit;

select * FROM student_t;

alter TABLE student_t MODIFY tel varchar2(30);
