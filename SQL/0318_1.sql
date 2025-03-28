
delete from dept_copy where dno = 50;

set serveroutput on;

declare
    cnt number := 1;
    
    exist_dno_err exception;
begin
    if cnt > 0 then
        dbms_output.put_line('이미 등록된 부서입니다.');
        
        --강제로 예외처리 실행
        raise exist_dno_err;
        
    else 
        insert into dept_copy(dno, dname, loc)
            values(50,'개발부','대구');
         dbms_output.put_line('정상적인 등록된 부서입니다.');
        commit;
        
    end if;
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line('부서 정보 입력중 오류발생으로 롤백 수행!!');
            rollback;
end;
/


--1. 사번이 존재하는지 검사하는 함수 정의 find_eno_f
--2. 사번을 매개변수로 받아 삭제하는 프로시저 정의 del_eno_p
-- 조건1) 사번이 존재하면 삭제 후 커밋
-- 없으면 "사번이 존재하지 않습니다." 출력 후 롤백 처리
-- 조건2) 사용자 정의 예외 처리 사용

--select count(*) from emp_copy where eno = 7369 GROUP by eno;
--
--create or replace function find_eno_f(
--    p_eno emp_copy.eno%TYPE
--)return number is
--    
--    v_eno number;
--begin
--    select count(*) into v_eno from emp_copy where eno = p_eno and rownum = 1 GROUP by eno;
--    dbms_output.put_line('확인' || v_eno);
--    if v_eno > 0 then
--        RETURN 1;
--    else
--        RETURN 0;
--    end if;
--    
--exception
--    when others then
--        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
--            dbms_output.put_line(sqlcode || sqlerrm);            
--            return -1;
--end;
--/


delete from emp_copy where eno = 1234;
rollback;
--2. 사번을 매개변수로 받아 삭제하는 프로시저 정의 del_eno_p
create or replace procedure del_eno_p(
     p_eno emp_copy.eno%TYPE
) is
        exist_dno_err exception;
begin

    if  find_eno_f(p_eno) = 1 then
        delete from emp_copy where eno = p_eno;
        commit;
        dbms_output.put_line(p_eno || '사번이 삭제되었습니다.');
    else
        dbms_output.put_line('사번을 찾을 수 없습니다.');
        raise exist_dno_err;
       
    end if;
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
           
end;
/

--exec del_eno_p(1234);

create or replace procedure in_eno_p(
     p_eno emp_copy.eno%TYPE,
     p_ename emp_copy.ename%TYPE,
     p_job emp_copy.job%TYPE,
     p_manager emp_copy.manager%TYPE,
     p_hiredate emp_copy.hiredate%TYPE,
     p_salary emp_copy.salary%TYPE,     
     p_dno emp_copy.dno%TYPE     
) is
        exist_dno_err exception;
begin

    if  find_eno_f(p_eno) = 1 then
        dbms_output.put_line('등록되어있습니다.');
        raise exist_dno_err;
        
    else
        insert into emp_copy(eno, ename, job, manager, hiredate, salary, dno)
            values(p_eno, p_ename, p_job, p_manager, p_hiredate, p_salary, p_dno);         
        commit;
        dbms_output.put_line(p_eno || '추가 되었습니다.');
        
       
    end if;
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
           
end;
/

--exec in_eno_p(8000,'suzi','SALESMAN',7369,'25/03/18',3000,10);


create or replace procedure up_eno_p(
     p_eno emp_copy.eno%TYPE,
     p_ename emp_copy.ename%TYPE,
     p_job emp_copy.job%TYPE,
     p_manager emp_copy.manager%TYPE,
     p_hiredate emp_copy.hiredate%TYPE,
     p_salary emp_copy.salary%TYPE,     
     p_dno emp_copy.dno%TYPE     
) is
        exist_dno_err exception;
begin

    if  find_eno_f(p_eno) = 1 then
        update emp_copy set ename = p_ename, 
                            job = p_job, 
                            manager = p_manager, 
                            hiredate = p_hiredate, 
                            salary = p_salary, 
                            dno = p_dno
                                where eno = p_eno;
        commit;
        dbms_output.put_line('수정 되어있습니다.');
        
        
    else
        dbms_output.put_line('찾을 수 없습니다.');
        raise exist_dno_err;
       
    end if;
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
           
end;
/

--exec up_eno_p(8000,'suzi','SALESMAN',7369,'25/03/18',2500,20);

--accept input_comm prompt'어떤 작업을 할 것인지 입력하세요.'



create or replace procedure del2_eno_p(
     p_eno in emp_copy.eno%TYPE,
     msg out varchar2
) is
        exist_dno_err exception;
begin

    if  find_eno_f(p_eno) = 1 then
        delete from emp_copy where eno = p_eno;
        msg := p_eno || '사번이 삭제되었습니다.';
        commit;
        
    else
        dbms_output.put_line('사번을 찾을 수 없습니다.');
        raise exist_dno_err;
       
    end if;
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
           
end;
/


--accept ex_eno prompt'사번을 입력하세요.'
--declare
--    msg varchar2(80);
--begin
--    del2_eno_p(&ex_eno, msg);  --프로시저 호출
--    dbms_output.put_line('수행 결과' || msg);
--exception
--    when others then
--        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
--            dbms_output.put_line(sqlcode || sqlerrm);
--             rollback;
--           
--end;
--/


/*
    1. 부서테이블(dept_copy)에 부서번호, 부서명, 근무지를 추가하는 프로시저 정의
        dept_ins_p
    2. 부서번호가 존재하는지 검사하는 함수 정의 - find_dno_f
    3. 부서번호, 부서명, 근무지를 accept를 사용하여 입력받음.
    4. out 매개변수를 통하여 에러 메시지와, 정상 메시지를 받아 출력
    5. 사용자 정의 예외를 사용하기
*/

set serveroutput on;

create or replace function find_dno_f(
    p_dno in dept_copy.dno%TYPE
) return number is
    
    v_count number;
    
begin
    select count(*) into v_count from dept_copy where dno = p_dno and rownum = 1;
    
    if v_count > 0 then
        return 1;
--        
    else
        return 0;
--        
    end if;
    
exception
   when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
end;
/ 
            
--set serveroutput on;
create or replace procedure dept_ins_p(
     p_dno dept_copy.dno%TYPE,     
     p_dname dept_copy.dname%TYPE,
     p_loc dept_copy.loc%TYPE,
     msg out varchar2 
) is
        v_num int := 0;
        exist_dno_err exception;
        
begin

        v_num :=  find_dno_f(p_dno);
    if  v_num = 0 then
        insert into dept_copy 
            values(p_dno, p_dname, p_loc);         
        commit;        
        msg := v_num ||'가 추가되었습니다.';    
    else
        msg := '실패하였습니다.';
        raise exist_dno_err;
       
    end if;
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
           
end;
/

accept ex_dno prompt'사번을 입력하세요.'
accept ex_dname prompt'직업을 입력하세요.'
accept ex_loc prompt'지역을 입력하세요.'
declare
    msg varchar2(80);
begin
    dbms_output.put_line('수행 결과' || &ex_dno);
    --dept_ins_p(&ex_dno, '&ex_dname', '&ex_loc', msg);  --프로시저 호출
    --dbms_output.put_line('수행 결과' || msg);
    
exception
    when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
end;
/
