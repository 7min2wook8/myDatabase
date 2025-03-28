--0314_2
--select를 제외한 기타 sql 정리 crud, ddl

--pk fk관계를 무시하고 강제로 삭제
drop table department cascade CONSTRAINTS purge;


--department 테이블 복사(데이터만 복사, 제약 조건 무시)
create table dept_copy as select * from department;

-- 조건을 일부러 거짓으로 하여 구조만 복사
create table dept_copy2 as select * from department where 0=1;

create table emp_copy as select * from employee;

--날짜 데이터 입력: to_date 함수 사용
insert into emp_copy values (1234,'홍길동', '이사', NULL, TO_DATE('1980-12-25','yyyy-mm-dd'),99000, NULL, 20);

select * from dept_copy;
-- 부서 번호가 10인 부서명을 '개발부', 지역을 '대구'로 변경
update dept_copy set dname='개발부', loc = '대구' where dno = 10;

-- 10번 부서의 지역명을 20번 부서의 지역명으로 수정
update dept_copy 
    set loc = (select loc 
                from dept_copy 
                where dno = 20) 
    where dno = 10;

-- emp_copy 테이블에서 영업부에 근무하는 사원 모두 삭제

delete from emp_cpy where dno =
(select dno from dept_copy where dnme = 'SALESl');


--오라클에서 제공하는 기타 함수들
--trunc () 날짜, 숫자의 소수점을 자름
--months_between (date1, date2) : date1과 date 사이의 개월 수를 구함

select ename "사원명", sysdate "현재 날짜", hiredate "입사일",
    trunc(months_between(sysdate,hiredate)) "근무 개월수"
    from employee;


--입사한지 6개월이 지난 사원, 입사일 검색
--add_months(date, n) : date에 n개월을 더함
select ename, hiredate, add_months(hiredate,6) "입사일에서 6개월 지난 시점"
    from employee;
    
--날짜 표시 방법
-- to_char() : 날짜, 숫자를 문자로 표현(to_date()와 다름)
select ename, hiredate, 
    to_char(hiredate, 'yy-mm'),
    to_char(hiredate,'yyyy_mm_dd'),
    to_char(hiredate,'[yy] [mm] [dd]') 
    from employee;
    
-- 현재 날짜, 시간 표시
-- dual : 오라클에서 사용하는 임시테이블
select to_char(sysdate,'yyyy/mm/dd, hh24:mi:ss') from dual;
    
--통화기호
-- L : 지역별 통화 기호
-- 0 : 자리수가 맞지 않으면 '0'을 채움
-- 9 : 자리수가 맞지 않으면 빈자리 무시함
select ename, to_char(salary, 'L000,000') from employee;
select ename, to_char(salary, 'L999,999') from employee;
select ename, to_char(salary, '$999,999') from employee;












