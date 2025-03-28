--

set serveroutput on --pl/sql 출력을 위해 실행
--프로시저 : 프로그래밍에서 void 함수 형태(리턴이 없는 함수)

create or replace procedure emp_info_p(
    p_empno in employee.eno % type    --매개변수
)is 
    v_eno employee.eno%type;
    v_sal employee.salary%type;
    v_name varchar2(20);
    
    begin
        select eno,ename,salary into v_eno, v_name, v_sal from employee
        where eno = p_empno;
        dbms_output.put_line('사번:' || v_eno);
        dbms_output.put_line('이름:' || v_name);
        dbms_output.put_line('급여' || v_sal);
        
    exception
        when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            
   end;
/

--프로시저 호출 사용
--accept p_eno prompt '검색할 사번을 입력하세요.'
--exec emp_info_p(&p_eno);

--부서번호를 매개변수로 입력받아 부서별로 최대급여를 출력하는 프로시저
create or replace procedure emp_info_p2(
    p_empdno in employee.dno % type    --매개변수
)is 
    v_dno employee.dno%type;
    v_sal employee.salary%type;

    begin
        select dno, max(salary) into v_dno, v_sal from employee
        where dno = p_empdno
        group by dno;
        
        dbms_output.put_line('이름 : ' || v_dno || ' 최대 급여 : ' || v_sal);
        
    exception
        when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            
   end;
/

--accept p_dno prompt '검색할 사번을 입력하세요.'
--exec emp_info_p2(&p_dno);

--부서 번호를 매개변수로 입력받아 사번, 사원명, 입사일, 급여를 출력하는 프로시저
create or replace procedure emp_info_p3(
    p_empdno in employee.dno % type    --매개변수
)is 
    v_dno employee.dno%type;
    v_ename employee.ename%type;
    v_hiredate employee.hiredate%type;
    v_sal employee.salary%type;

    cursor emp_cursor is select *             
            from employee 
            where dno = p_empdno;
            
    emp_buf employee % rowtype;-- employee의 테이블의 속성 정보를 얻음 class 선언과 비슷
begin
    dbms_output.put_line('cursor 사용'); 
    dbms_output.put_line('사원번호 ' || ' 이름' || '       입사일' || '          급여'); 
   open emp_cursor;
        loop
            fetch emp_cursor into emp_buf;  -- emp_cursor의 한줄의 값을 emp_buf에 쌓음                
            exit when emp_cursor % notfound;-- emp_cursor의 다음 값을 찾을수없으면 exit함
                v_dno := emp_buf.dno;
                v_ename := emp_buf.ename;
                v_hiredate := emp_buf.hiredate;
                v_sal := emp_buf.salary;
               
                dbms_output.put_line(v_dno|| '       ' || v_ename|| '     ' || v_hiredate|| '        ' || v_sal);
--            dbms_output.put_line(emp_buf.dno    || '        ' || 
--                                emp_buf.ename   || '        ' || 
--                                emp_buf.hiredate|| '        ' || 
--                                emp_buf.salary);
        end loop;
    close emp_cursor;
    
    
    dbms_output.put_line('for 사용'); 
    dbms_output.put_line('사원번호 ' || ' 이름' || '       입사일' || '          급여'); 
    for emp_row in (select dno, ename, hiredate, salary             
            from employee 
            where dno = p_empdno)
            
       
        loop
            v_dno := emp_row.dno;
            v_ename := emp_row.ename;
            v_hiredate := emp_row.hiredate;
            v_sal := emp_row.salary;
            
            dbms_output.put_line(v_dno|| '       ' || v_ename|| '     ' || v_hiredate|| '        ' || v_sal);        
        
        end loop;   
            
    
         
exception
        when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            
end;
/



--사번과 사원명을 매개변수로 받아서 같은 사번 또는 사원명과 일치하는 부서번호를 구한 후 
--사원명, 입사일,업무, 급여 출력하는 프로시저
--조건1 데이터가 없으면 '검색한 데이터가 존재하지 않습니다.' 오류 메세지 출력

create or replace procedure emp_sam_p4(
    p_empeno in employee.eno%type,    --매개변수
    p_ename in employee.ename%type
)is

    v_dno employee.dno%type;
    v_ename employee.ename%type;
    v_hiredate employee.hiredate%type;
    v_job employee.job%type;
    v_sal employee.salary%type;
    
    v_count number;
    
begin
    v_count := 0;
    for emp_row in (select ename, hiredate, job, salary             
            from employee 
           -- where eno = p_empeno or ename = p_ename)            
            where dno in (select dno from employee 
                            where eno = p_empeno or ename = p_ename))
        loop
            
            v_ename := emp_row.ename;
            v_hiredate := emp_row.hiredate;
            v_job := emp_row.job;
            v_sal := emp_row.salary;
            dbms_output.put_line('----------------------------------------------------------------');
            dbms_output.put_line('이름 :' || v_ename);        
            dbms_output.put_line('입사일 :' || v_hiredate);   
            dbms_output.put_line('업무 :' || v_job);   
            dbms_output.put_line('급여 :' || v_sal);
            v_count := 1;
            
        end loop;
        
        if v_count = 0 then
            dbms_output.put_line('검색한 데이터가 존재하지 않습니다.');
        end if;
            
exception
        when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);

end;
/


--accept p_dno prompt '검색할 사번을 입력하세요.'
--accept p_ename prompt '검색할 사원명을 입력하세요.'
--exec emp_sam_p4(&p_dno, '&p_ename');


--함수 function : 프로그래밍에서 return이 있는 함수
--접속 - db - 함수 폴더에 생성됨

--부서 번호가 있는지 확인하는 함수
--rownum : 가상의 번호 지정
--select count(*) from department where dno = 100 and rownum =1;

create or replace function dept_dno_cnt_f(
    p_deptno department.dno%type
) RETURN number is
--일반 변수 선언 영역
    cnt int;
BEGIN
    select count(*) into cnt from department where dno = p_deptno and rownum =1;
    if cnt > 0 then
        return cnt;
        
    else
        return 0;
        
    end if;    
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            return -1;
end;
/
--accept p_dno prompt '검색할 사번을 입력하세요.'

--select DISTINCT dept_dno_cnt_f(5) from department;

--사번과 사원명을 매개변수로 받아서 사번 또는 사원명과 일치하는 부서번호를 구한 후
--사원명, 입사일, 업무, 급여 출력하는 프로시저
--조건1) 데이터가 없으면 '검색한 데이터가 존재하지 않습니다.' 오류 메시지 출력
--조건2) dept_dno_cnt_f 함수를 사용하여 조건1) 처리
create or replace function dept_dno_cnt_f2(
    p_deptno employee.eno%type,
    p_deptname employee.ename%type
) RETURN number is
--일반 변수 선언 영역
    cnt int;
BEGIN
    select count(*) into cnt from employee 
        where eno = p_deptno or ename = p_deptname and rownum =1;
    if cnt > 0 then
        return cnt;
        
    else
        return 0;
        
    end if;    
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            return -1;
end;
/


set serveroutput on --pl/sql 출력을 위해 실행
create or replace procedure emp_find2_p(
    p_empeno in employee.eno%type,    --매개변수
    p_ename in employee.ename%type
) is
    
BEGIN

        if dept_dno_cnt_f2(p_empeno, p_ename) = 0 then
             
            dbms_output.put_line('검색한 데이터가 존재하지 않습니다.');
            
        else
            for emp_row in (select ename, hiredate, job, salary             
                from employee                    
                where dno in (select dno from employee 
                                where eno = p_empeno or ename = p_ename))
            loop                
                dbms_output.put_line('----------------------------------------------------------------');
                dbms_output.put_line('사원명 :' || emp_row.ename);   
                dbms_output.put_line('입사일 :' || emp_row.hiredate);   
                dbms_output.put_line('업무 :' || emp_row.job);   
                dbms_output.put_line('급여 :' || emp_row.salary);
                
                
            end loop;
--            
        
        end if;
        
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
end;
/


exec emp_find2_p(10,'SCOTT');