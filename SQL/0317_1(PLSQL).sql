set serveroutput on --pl/sql 출력을 위해 실행


--반복문 for

declare
    i number := 0;
    
    begin
    --for(i=0; i<5; i++)
        for i in 1..5 loop
            dbms_output.put_line('i의 값=' || i);
        end loop;
    end;
/
        
--10회 반복하면서 2의 배수 출력
declare
    i number := 0;
    
    begin
    --for(i=1; i<=10; i++)
        for i in 1..10 loop
            dbms_output.put_line('i의 값=' || i*2);
        end loop;
    end;
/



--1~10사이의 2의 배수 출력
declare
    i number := 0;
    
    begin
    --for(i=1; i<=10; i++)
        for i in 1..10 loop
            --mod(i,2): i를 2로 나눈 나머지
            if mod(i,2) = 0 then
                dbms_output.put_line('1~10 짝수=' || i);
            end if;
        end loop;
    end;
/

--반복문 while
declare
    i number := 0;
    result number := 0;
    
    begin
        i := 1;
        while i < 10 loop
            result := i * 3;
            dbms_output.put_line(i ||' * 3 = ' || result);
            i := i+1;
        end loop;    
    end;
/


--반복문 while
declare
    v_sum number := 0; 
    v_num number := 0;
    
    begin
        v_num := 1;
           loop
           v_sum := v_sum + v_num;
           if v_num >= 10 then
                exit;
            end if;
            v_num := v_num + 1;
            
        end loop;
            dbms_output.put_line('1~10의 합 : ' || v_sum);
            
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);

end;    
/


--1~ 100 까지 사이의 값중에서 3의 배수의 합을 출력
declare
    v_sum number := 0; 
    v_num number := 0;
    
    begin
        v_num := 1;
           loop
           if mod(v_num, 3) = 0 then
            v_sum := v_sum + v_num;
           end if;
           
           if v_num >= 100 then
                exit;
            end if;
            
            v_num := v_num + 1;
            
        end loop;
            dbms_output.put_line('1~100의 3의 배수 합 : ' || v_sum);
            
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);

end;    
/


--cursor : 오라클에서 쿼리 결과로 얻어진 여러 데이터(행)의 위치 정보

declare
    --select 의 결과값을 emp_cursor에 담음
    cursor emp_cursor is select * from employee where dno = 20;
    emp_buf employee % rowtype;-- employee의 테이블의 속성 정보를 얻음 class 선언과 비슷
begin

    open emp_cursor;
        loop
            fetch emp_cursor into emp_buf;  -- emp_cursor의 한줄의 값을 emp_buf에 쌓음
            exit when emp_cursor % notfound;-- emp_cursor의 다음 값을 찾을수없으면 exit함
            
                dbms_output.put_line(emp_buf.eno || ':'|| emp_buf.ename);
                
        end loop;
    close emp_cursor;
end;
/

--간결 표현
declare
    
begin

--cursor emp_cursor is select * from employee where dno = 20;
--emp_buf employee % rowtype;-- employee의 테이블의 속성 정보를 얻음 class 선언과 비슷
--위의 문장을 한줄로 압축
    for emp_row in (select * from employee where dno = 20)
    loop
        if emp_row.ename = 'SCOTT' then
             dbms_output.put_line('hello scott');
        end if;
        if emp_row.salary > 2000 then
            dbms_output.put_line(emp_row.eno || ':' || emp_row.ename || ':' || emp_row.salary );
        end if;
        
    end loop;
end;
/

-- 쿼릐의 결과가 단일값인 경우
declare
    v_eno number;
    v_ename varchar2(20);
    
begin
--eno의 값을 v_eno에 ename의 값을 v_ename에 담음
    select eno, ename into v_eno, V_ename from employee
        where eno = 7788;
            dbms_output.put_line('사번:' || v_eno);
            dbms_output.put_line('이름:' || v_ename);
end;
/
