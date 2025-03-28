/*
    여러줄 서식
    f5 : sql 명령어 전체 실행
    ctrl + 엔터 : 특정 부분만 실행
*/
drop TABLE customer;

create table customer(
  name varchar2(20),
  age number(5),
  gender char(1),
  reg_date date default sysdate
);

insert into customer (name, age, gender, reg_date)
    values('유관순',100,'F',sysdate);

insert into customer (name)
values('강감찬',sysdate);


select * from customer;
--주석