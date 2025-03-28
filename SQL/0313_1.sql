create table month_sell(
    pro_id VARCHAR2(5),     --상품ID
    month VARCHAR2(10),     --월
    company VARCHAR2(10),   --회사
    money   number          --매출액
);

insert into month_sell values('p0001', '24/01/31','삼성', 55000);
insert into month_sell values('p0001', '24/03/31','삼성', 75000);
insert into month_sell values('p0002', '24/01/31','lg', 55000);
insert into month_sell values('p0002', '24/01/31','lg', 25000);
insert into month_sell values('p0003', '24/03/31','애플', 15000);
insert into month_sell values('p0003', '24/01/31','애플', 25000);

commit;


select * from month_sell;

--상품 ID, 월별로 월 매출 합계를 검색
select pro_id, month, sum(money) as "매출액"
from month_sell
group by pro_id, month
order by pro_id;

--rollup 다차원 함수
--3레벨 : 상품ID, 월, 매출액
--2레벨 : 상품ID, 제품별 매출액
--1레벨 : 매출액
select pro_id, month, sum(money) as "매출액"
from month_sell
group by ROLLUP (pro_id, month);

--1레벨 : 매출액
--2레벨 : 월, 월별별 매출액
--3레벨 : 제품ID, 제품별 매출액
--4레벨 : 제품ID 월 매출액

select pro_id, month, sum(money) as "매출액"
from month_sell
group by cube (pro_id, month);

--1.부서번호, 담당업무, 사원수, 급여 총액을 rollup, cube를 사용하여 검색
--2.decode를 사용해서 부서명과 직업명을 한글로 출력

select decode( dno, 10, '회계팀', 20, '홍보팀', 30, '영업팀', '부서별 합계') as "부서명",
       decode( job, 'CLERK', '사무', 'PRESIDENT', '사장', 'MANAGER', '팀장',
                    'ANALYST', '감사', 'SALESMAN', '영업', NULL, ' ') AS "담당업무",
        count(*), sum(salary)
from employee
group by rollup(dno, job);
--group by cube(dno, job);

select dno, job, count(*), sum(salary)
from employee
--group by rollup(dno, job);
group by cube(dno, job);



