--0321_인터넷뱅킹 실습.sql


--1. 신천점 고객들의 고객명, 지점명, 계좌번호 검색
select cu.cname, ac.bname, ac.acno 
from account21 ac, customer21 cu 
where ac.bname = 'KB신천점' and ac.cno = cu.cno; 
--2. 전우치 고객의 계좌번호(acno), 고객명(cname), 고객주소(caddr), 고객생일(cbirth)을 검색
select ac.acno, cu.cname, cu.caddr, cu.cbirth 
from account21 ac, customer21 cu
where ac.cno = cu.cno and ac.cno = (select cno from customer21 where cname = '전우치');
--3. 신천점 고객들의 고객명, 지점명, 계좌번호 검색
select cu.cname, br.bname ,ac.acno 
from customer21 cu, account21 ac, branch21 br
where cu.cno = ac.cno and ac.bname = 'KB신천점' and ac.bname = br.bname;
--4. 25/03/01 ~ 25/03/31 사이의 모든 거래 정보 검색
(select * from savingacc21 where sadate between '25/03/01' and '25/03/31');
--5. 2025년 3월에 거래된 홍길동 고객의 고객명, 입/출금 정보, 계좌 번호, 거래계좌번호,
--거래 시간, 거래금액, 잔액 검색
--조건) 금액은 원화 표시로 출력
select cu.cname "고객명", sa.sainout "입/출금 정보", ac.acno "계좌번호", sa.sainout"거래계좌번호", 
to_char(sa.samoney, 'L999,999,999')"거래 금액" , 
to_char(sa.sajango, 'L999,999,999')"잔액"
from savingacc21 sa, customer21 cu, account21 ac
where sa.cno = cu.cno and 
ac.acno = sa.acno and
sa.cno = (select cno from customer21 where cname = '홍길동');

--6. 2025년 3월 거래된 유관순 고객의 고객명, 입/출금 정보, 계좌번호, 거래시간, 입/출금자 이름, 거래내역 ,잔액 검색
select c.cname "고객명", s.sainout "입/출금 정보", a.acno "계좌번호", s.sadate"거래시간",
(select cname from customer21 where cno  = 
    (select cno from account21 where acno = s.transfer)) "입/출금자 이름" ,
to_char(s.samoney, 'L999,999,999')"거래 금액" , 
to_char(s.sajango, 'L999,999,999')"잔액"
from savingacc21 s, customer21 c, account21 a
where s.cno = c.cno and a.acno = s.acno and
s.sadate between '25/03/01' and '25/03/31' and
c.cname = '유관순';

