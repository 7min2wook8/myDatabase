--[검색]
--1. 기본 검색
--2. 그룹 검색
--3. 조인 검색
--4. 서브 쿼리

select ename, salary from employee
where salary > (select salary from employee where ename = 'SCOTT');


--1. 단일행 서브 쿼리 : 서브 쿼리 결과가 1개
--단일 비교 연산자 (>, =, >=, <>, <, <= )
--scott 과 동일한 부서에서 근무하는 서원 검색
select ename, dno from employee
where ename != 'SCOTT' and 
dno = (select dno from employee where ename = 'SCOTT');


--2. 다중행 서브 쿼리 : 서브 쿼리 결과가 여러 개
-- 다중행 비교 연산자(in(and), any(or), all, some, exists)

--부서별 최소 급여를 받는 사원의 사원번호, 이름 검색
select eno, ename, salary from employee
    where salary in (select min(salary) from employee GROUP by dno);
                -- 값 800, 950, 1300 리턴

--직급이 SALESMAN이 아니면서 급여가 임의의 SALESMAN보다 낮은 사원 검색
SELECT ENO, ename, JOB, SALARY FROM employee
    WHERE JOB <> 'SALESMAN' AND salary < ANY (
        SELECT SALARY 
        FROM EMPLOYEE 
        WHERE JOB = 'SALESMAN') ;
        
        
--직급이 SALESMAN이 아니면서 급여가 모든 SALESMAN보다 낮은 사원 검색
SELECT ENO, ename, JOB, SALARY FROM employee
    WHERE JOB <> 'SALESMAN' AND 
    salary < ALL (
        SELECT SALARY 
        FROM EMPLOYEE 
        WHERE JOB = 'SALESMAN') ;

--서브쿼리 연습
--1. 사원 번호가 7788인 사원과 담당업무가 같은 사원명, 담당업무 출력
SELECT ename,JOB 
FROM EMPLOYEE
WHERE JOB = (SELECT JOB 
                FROM employee 
                WHERE ENO = 7788);
                
--2. 사원번호가 7499보다 급여가 많은 사원명, 담당업무, 급여 출력
SELECT ENAME, JOB, SALARY
    FROM employee
    WHERE SALARY > (SELECT SALARY 
                        FROM employee
                        WHERE employee.eno = 7499);
                        
--3. 최소, 최대 급여를 받는 사원명, 담당업무, 급여 출력
SELECT ENAME, JOB, SALARY 
    FROM employee
--    WHERE SALARY = (SELECT MAX(SALARY) FROM employee) OR
--          SALARY = (SELECT MIN(SALARY) FROM employee);
    where salary in ((SELECT MAX(SALARY) FROM employee), 
                     (SELECT MIN(SALARY) FROM employee));

--4. 부서별 최소 급여를 받는 사원명, 급여, 부서번호 출력 -부서기준 오름차순 정렬
SELECT ENAME, SALARY, ENO 
    FROM employee    
    WHERE SALARY IN (select min(salary) from employee GROUP by dno)
    ORDER BY ENO DESC;
    
--5. 부서별 최소 급여를 받는 사원명, 급여, 부서번호, 부서명, 근무지 출력
SELECT e.ENAME, e.SALARY, e.dno, d.dname, d.loc
    FROM employee e, department d
    where e.dno = d.dno and SALARY IN (select min(salary) 
                                        from employee 
                                        GROUP by dno);
                                        
select ename, salary, dno,  (select dname from department where e.dno = dno),
                            (select loc from department where e.dno = dno) 
                            from employee e
    where salary in (select min(salary) from employee group by dno);
    

--6. 담당업무가 ANALYST인 사원보다 급여가 적으면서 업무가 ANALYST가 아닌
--사번, 사원명, 담당업무, 급여 출력, 급여가 많은 순서로 정렬
select eno, ename, job, salary
    from employee
    where job <> 'ANALYST' and 
    salary < all (select salary 
                  from employee
                  where job = 'ANALYST')
    order by salary desc;


--7. 직속상관(매니저)이 없는 사원명 검색 - 서브쿼리 사용
SELECT ENAME FROM EMPLOYEE
--WHERE MANAGER IS NULL; (SELECT MANAGER FROM employee WHERE MANAGER IS NULL);
WHERE ENO IN(SELECT ENO FROM EMPLOYEE WHERE MANAGER IS NOT NULL);
--8. 직속상관이 없는 사원명, 부서명, 근무지 검색 -예제 5번 참조하여 2가지 방법
SELECT e.ENAME, e.JOB, d.loc FROM employee e, department d
    where e.dno = d.dno and e.manager is null;
    --ENO IN (SELECT ENO FROM EMPLOYEE WHERE MANAGER IS NULL)

--9. 부하직원이 없는 직원의 사번, 사원명, 급여 검색
select eno, ename, salary 
    from employee 
    where eno not in (select manager
                        FROM employee
                        where manager is not null);

--10.'BLAKE'와 동일한 부서에 속한 사원명, 입사일, 검색 - 'BLAKE'는 출력 제외
select ename, hiredate 
    from employee
    where dno = (select dno
                    from employee
                    where ename = 'BLAKE') and ename <> 'BLAKE';
                    
                    
--11. 근무지가 'DALLS'인 사원명, 부서번호, 담당업무 검색 - 이름기준 오름차순
select ename, dno, job 
    from employee
    where dno = (select dno 
                    from department 
                    where loc = 'DALLAS')
                        order by ename;
                    
select e.ename, e.dno, e.job
from employee e, department d
where d.dno = e.dno and 
d.loc = 'DALLAS' order by ename;

--12. 'SCOTT'과 동일한 부서에서 근무하는 사원명, 부서번호, 부서명, 근무지 검색
--select e.ename, e.dno, e.job, d.loc from employee e, department d
--    where e.dno = d.dno and d.dname = (select d.dname from employee e, department d 
--                                            where e.ename = 'SCOTT' and e.dno = d.dno);
    
select ename, dno, 
    (select dname from department where e.dno = dno) "부서명", 
    (select loc from department where e.dno = dno) "근무지" 
    from employee e
        where dno = (select dno from employee where ename = 'SCOTT');
    
--13. 담당업무별로 업무가 ANALYST 인 사원보다 급여가 적고 업무가 'CLERK'이 아닌 사원들중에서 최고 급여를 검색
select job, max(salary)
    from employee 
    where salary  < all (select salary from employee where job = 'ANALYST') and 
    job <> 'CLERK'
    group by job;