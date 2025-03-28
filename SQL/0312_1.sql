--select에서 그룹을 사용하는 경우 반드시 사용해야하는 집계 함수

select sum(salary) as "급여총액", round(avg(salary)) as "급여 평균",
    max(salary) as "최대 급여", min(salary) as "최소 급여",
    count(*) as "사원 수" from employee;
    
-- DB에서 그룹을 표현하는 방식 2가지
-- 1. 윈도우 함수 사용
-- 2. group by 절 사용 --> 주로 사용

select count(*) as "사원의 수" from employee;

--중복되지 않는 직업 종류의 개수
--distinct : 중복 제거
select DISTINCT job as "직업의 종류" from employee;
select count(DISTINCT job) as "직업의 개수" from employee;
select count(job) as "직업의 개수" from employee;

--부서별 급여 평균을 구하라
select dno as "부서 번호", round(avg(salary)) as "급여 평균" 
from employee
group by dno;

--부서별 그리고 직업별(GROUP BY dno, job)로 부서번호, 담당업무, 사원의 수(count(*)), 급여 총 합계(sum(salary)) 검색
select dno, job, count(*),sum(salary) from employee
GROUP BY dno, job
order by dno, job;

--부서별로 최대 급여가 3000 달러 이상이 존재하는 부서, 최대 급여 검색, 
select dno, max(salary) from employee
GROUP by dno
having max(salary) >= 3000;

--조건에 따라 표현하는 2가지 방법
select ename, dno, decode(dno, 10, '회계팀',
                                20, '홍보팀',
                                30, '영업팀',
                                40, '경영지원팀', '부서없음') as "부서명"
from employee
order by dno;

select ename, dno, case when dno = 10 then '회계팀'
                        when dno = 20 then '홍보팀'
                        when dno = 30 then '영업팀'
                        when dno = 40 then '경영지원팀'
                        else '부서없음'
                        end as "부서명"
                        
from employee 
order by dno;


--연습문제
--1. 부서별 인원이 3명보다 많은 부서의 부서번호, 인원수, 급여의 합계 검색
select dno, count(*), sum(salary) 
from employee
group by dno
having count(*) > 3;

--2. 업무별 급여 최고액, 최저액, 총액, 평균 검색 - 평균은 반올림 처리
select dno, max(salary), min(salary), sum(salary), round(avg(salary))
from employee
group by dno;

--3. 부서별로 담당업무가 동일한 사원의 수 검색
select dno, job, count(job) from employee
GROUP by dno, job
order by dno, job;


--4. 업무별 사원의 최저 급여 검색 
--  조건) 관리자를 알 수 없는 사원과 최저급여가 2000미만인 그룹은 제외
--  조건) 급여 기준 내림차순 정렬
select job, min(salary) as "최저급여"
from employee
where manager is not null
group by job
having min(salary) > 2000
order by min(salary) desc;

--5. 각 부서에 대해 부서번호, 사원 수, 부서내의 모든 사원의 평균 급여를 부서별로 검색
--  조건) 부서 기준 오름차순 정렬
select dno, count(*), round(avg(salary))
from employee
group by dno
order by dno;

--6. 각 부서에 대해 부서번호, 부서명, 지역명, 사원 수, 부서내의 모든 사원의 평균급여 검색
--  조건) 부서명, 지역명은 department 테이블을 참고하여 decode 또는 case 사용
select dno, case when dno = 10 then 'ACCOUNT'
                when dno = 20 then 'RESEARCH'
                when dno = 30 then 'SALES'
                when dno = 40 then 'OPERATIONS'
                else 'Not found'
                end as "부서명",
            case when dno = 10 then 'NEW YORK'
                when dno = 20 then 'DALLAS'
                when dno = 30 then 'CHICAGO'
                when dno = 40 then 'BOSTON'
                else 'Not found'
                end as "지역명",
    count(*), round(avg(salary))
    
    from employee
    
group by dno;
                
