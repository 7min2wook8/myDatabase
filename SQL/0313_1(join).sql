--조인 : 2개 이상의 테이블을 수평으로 연결하여 데이터 검색

SELECT *
    FROM employee, department
    WHERE employee.dno = department.dno;


SELECT eno, ename, employee.dno, dname
    FROM employee, department
    WHERE employee.dno = department.dno;


SELECT e.eno, e.ename, d.dno, d.dname
    FROM employee e, department d       --별칭 지정
    WHERE e.dno = d.dno;                --별칭 지정 후 기존 이름 사용하면 적용 안됨

--1. 내부 조인 : equi 조인
--사번이 7788 인 사원명, 부서명, 근무지를 검색 -alias(별칭) 사용
SELECT d.dname "사원명", d.dname "부서명", d.loc "별칭"
    FROM employee e, department d       
    WHERE e.dno = d.dno and e.eno = 7788;


--2. 내부 조인 : 자연조인(natural join)--자동 중복 제거 : 자연 조인(natural join)
--테이블명을 직접 명시하면 오류 발생
select eno, ename, dno, dname
    from employee e natural join department d
    where e.eno = 7788;


--3. 내부 조인 : join ~ using(자연 조인과 같음)
select eno, ename, dno, dname
    from employee e join department d using(dno)
    where e.eno = 7788;

--4. 내부 조인 : join ~ on(equi 조인과 같음 명시를 해줘야함)
select e.eno, e.ename, d.dno, d.dname
    from employee e join department d on e.dno = d.dno
    where e.eno = 7788;

-- 내부 조인 : 조인을 하면서 NULL값을 자동으로 제거

-- 외부 조인 : 조인을 하면서 NULL값을 검색

--5. 내부조인 : Non-equi 조인 -> between, > , < , >= , <=
select ename "사원명", salary "급여", grade "급여등급"
    from employee, salgrade
    where salary between losal and hisal;
    
--3개의 테이블을 조인
--사원명, 부서명, 급여, 급여등급 검색
select e.ename "사원명", d.dname "부서명", e.salary , s.grade "급여등급"
    from employee e, salgrade s, department d
    where e.dno = d.dno and salary BETWEEN losal and hisal;


--연습문제 조인 이후 서브쿼리에서 계속 연습함!!!
--1. 이름에 'A'가 포함된 모든 사원의 이름과 부서명 검색
select ename, d.dname
    from employee e, department d
    where ename like '%A%' and e.dno = d.dno;

--2. 커미션을 수령한 사원명, 부서명, 근무지, 상여금 검색
select e.ename, e.job, d.loc, e.commission
    from employee e, department d
    --where e.dno = d.dno and e.commission > 0;
    where e.dno = d.dno and nvl(e.commission , 0) > 0;

--3. 뉴욕에 근무하는 모든 사원의 이름, 업무, 부서번호, 부서명 검색
select e.ename, e.job, e.dno, d.dname
    from employee e, department d
    --where e.dno = 10 AND d.dno = e.dno;
    where e.dno = d.dno AND d.loc = 'NEW YORK';

