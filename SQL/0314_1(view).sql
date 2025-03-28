--view (가상 테이블) : 실제테이블을 기반으로 필요한 데이터만 추출하여 만듬 -보안에 적용
--GRANT create view TO test;

create or replace view myView as
    select ename "사원명", dno "부서번호", 
        (select dname from department where e.dno = dno) "부서명", 
        (select loc from department where e.dno = dno) "근무지" 
        from employee e
            where dno = (select dno from employee where ename = 'SCOTT');
            
select 사원명, 부서번호 from myView;