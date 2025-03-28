--급여가 1500달러 이상인 사번 사원명 급여를 검색
select eno, ename, salary from employee
    where salary >= 1500;

--급여가 1500달러와 다른 사번, 사원명, 급여를 검색
select eno, ename, salary from employee
    where salary <> 1500;

-- 주의 : 문자 정보는 '' 반드시 사용함
select * from employee where ename = 'SCOTT';

--날짜 데이터 조회
select * from employee where hiredate <= '1981/01/01';
select * from employee where hiredate <= '81/01/01';


--논리 연산자 : and, or, not
select * from employee where dno = 10 and job ='MANAGER';

--논리 and 연산자와 동일
select * from employee where salary BETWEEN 1000 and 1500;

--논리 or 연산자와 동일
select * from employee where commission in(300, 500, 1400) ;

--특정문자 검색 또는 정렬
--% 어떠한 값도 사용 가능, 자리수 제한이 없음
-- _ : 어떠한 값도 사용 가능, 자리수 1자 제한

-- ename이 A로 시작하는 문자 찾음
select * from employee where ename like 'A%';

--첫 번째 자리는 어떤 문자가 와도 되고 두번째 문자는 무조건 A이고
--뒤에는 아무 글자나 오면 됨
select * from employee where ename like '_A%';

--null값 검사
select * from employee where commission is null;
select * from employee where commission is not null;
--select * from employee where commission = null; <- 불가능

--오름 차순
select * from employee order by salary asc;

--내림 차순
select * from employee order by salary desc;

select * from employee order by ename desc;
-- 급여로 내림 차순 정렬을 하다가 동일한 값의 데이터들이 2개 이상 존재하면
--ename으로 오름 차순 정렬
select * from employee order by ename  desc, salary asc;

--연습문제
--1. 사원 번호가 7788인 사원명과 부서번호 검색
select ENAME, DNO from employee where ENO = 7788;
--2. 급여가 2000달러를 넘는 사원명과 급여를 급여가 많은 사원부터 정렬하여 검색
select ename, salary 
from employee 
where salary > 2000
order by ename desc;

--3. 모든 사원에 대해서 300달러 급여 인상을 적용한 후 사원명, 급여, 인상된 급여 검색
select ename, salary as "급여", salary+300 "인상된 급여" from employee;

--4. 사원명, 급여, 연간 연봉(상여금 포함)을 연봉이 많은 순서로 검색
--nvl(commission, 0) : NULL값을 0으로 변경
select ename, salary, (salary*12)+ nvl(commission, 0) as year_Salary
from employee order by year_Salary;

--5. 급여가 2000~3000 사이에 포함되지 않는 사원 검색
select ename 
from employee 
where salary not between 2000 and 3000;

--6. 급여가 1000~2000 사이에 포함되는 사원 검색. 급여가 많은 순으로 정렬
select ename, salary from employee 
where salary between 1000 and 2000
order by salary desc;

--7. 1981년 2월 20 ~ 1981년 5월 1일 사이에 입사한 사원명, 담당업무, 급여, 입사일 검색
--먼저 입사한 순으로 정렬
select ename, job, salary, hiredate 
from employee
where hiredate >= '81/2/20' and hiredate <= '81/5/1'
order by hiredate;

--8. 부서번호가 20 또는 30에 속하는 사원명, 부서번호, 담당업무 검색.
-- 오름차순 이름 정렬
select ename, dno, job 
from EMPLOYEE 
--where dno = 20 or dno =30
where dno in (20, 30)
order by ename;

--9. 사원 급여가 2000~3000이고 부서번호가 20또는 30인 사원명, 급여, 부서번호 검색.
--내림 차순 이름 정렬
select ename, salary ,dno 
from EMPLOYEE 
--where (dno = 20 or dno =30) and
where dno in(20, 30) and
salary between 2000 and 3000
order by ename;

--10. 1981년도 입사한 모든 사원의 이름과 입사일 검색
select ename, hiredate from employee 
--where hiredate >= '81/1/1' and hiredate <= '81/12/31';
where hiredate between '81/1/1' and '81/12/31';

--11. 관리자가 없는 사원의 이름과 담당업무 검색
select ename, job 
from employee 
where manager is null;
--12. 상여금을 받은 사원명, 급여, 상여금 검색. 
--급여, 상여금이 많은 순서로 정렬
select ename, salary, COMMISSION
from employee
where COMMISSION is not null and COMMISSION > 0
order by salary desc, COMMISSION desc ;

--13. 사원명에 'A' 또는 'E'를 모두 포함하는 사원의 모든 정보 검색
select * from employee
where ename like '%A%' or ename like '%E%';


--14. 이름의 3번째 문자가 'R'인 모든 사원 정보검색
select * from employee
where ename like '__R%';

--15. 담당업무가 사무원 또는 영업사원이면서 급여가 1600, 950, 1300이 아닌 사원의
--이름, 담당업무, 급여 검색
select ename, job, salary
from employee
where (job = 'SALESMAN' or job = 'CLERK') and  --job in ('CLERK','SALESMAN')
not salary in(1600, 950, 1300);

