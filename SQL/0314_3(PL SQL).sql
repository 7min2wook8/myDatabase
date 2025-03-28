--0314_3
--PL/SQL : 기본 SQL(DML)에 프로그래밍 요소를 적용

--PL/SQL을 사용하기 위해서 반드시 최소 1번 실행 필요
-- /(슬러쉬): PL/SQL의 마지막을 의미함
set serveroutput on
    begin
        dbms_output.put_line('안녕하세요 오라클'); --콘솔 출력
    end;
/

--제어문
declare 
--변수 선언
    grade char;
    result varchar2(30);
    
begin
    grade := 'B';
    
    IF grade = 'A' then
        result := 'A학점';
        
    elsif grade = 'B' then
        result := 'B학점';
        
    elsif grade = 'C' then
        result := 'C학점';
        
    elsif grade = 'D' then
        result := 'D학점';
    else
        result := 'F학점';
    end if;
        dbms_output.put_line(grade || ':' || result);
        
exception
-- begin 실행중 오류가 발생하면 동작
    when others then
        dbms_output.put_line('error 발생');
end;
/


accept input prompt'학점(A,B,C,D,F)을 입력하세요.'
declare 
--변수 선언
    grade char := '&input';
    result varchar2(30);
    
begin
    --grade := 'B';
    
    IF grade = 'A' then
        result := 'A학점';
        
    elsif grade = 'B' then
        result := 'B학점';
        
    elsif grade = 'C' then
        result := 'C학점';
        
    elsif grade = 'D' then
        result := 'D학점';
    else
        result := 'F학점';
    end if;
        dbms_output.put_line(grade || ':' || result);
        
exception
-- begin 실행중 오류가 발생하면 동작
    when others then
        dbms_output.put_line('error 발생');
end;
/

--swich 문

declare 
--변수 선언
    grade char;
    result varchar2(30);
    
begin
    grade := 'B';
    
    case grade
    when 'A' then
        result := 'A학점';
        
    when 'B' then
        result := 'B학점';
        
    when 'C' then
        result := 'C학점';
        
    when 'D' then
        result := 'D학점';
    else
        result := 'F학점';
    end case;
        dbms_output.put_line(grade || ':' || result);
        
exception
-- begin 실행중 오류가 발생하면 동작
    when others then
        dbms_output.put_line('error 발생');
end;
/

--간단한 계산기(+, -, * , /)
--
accept num1 prompt'숫자1을 입력하세요.'
accept num2 prompt'숫자2를 입력하세요.'
accept op prompt'연산자를 입력하세요.'
    declare
    
        num1 NUMBER := '&num1' ;
        grade VARCHAR2(30) := '&op';
        num2 NUMBER := '&num2';
        result NUMBER := 0;
        
    BEGIN
    
        case grade
            when '+' then
            result := num1 + num2;
            
            when '-' then
            result := num1 - num2;
            
            when '*' then
            result := num1 * num2;            
            
            when '/' then
            result := num1 / num2;
            
            else
                dbms_output.put_line('식이 잘못되었습니다.');
            
        end case;
        dbms_output.put_line(num1 || grade || num2 || '=' || result);
            
    exception
    
        when others then
            dbms_output.put_line('error 발생');
            
    end;
    /