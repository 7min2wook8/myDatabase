--0314_3
--PL/SQL : �⺻ SQL(DML)�� ���α׷��� ��Ҹ� ����

--PL/SQL�� ����ϱ� ���ؼ� �ݵ�� �ּ� 1�� ���� �ʿ�
-- /(������): PL/SQL�� �������� �ǹ���
set serveroutput on
    begin
        dbms_output.put_line('�ȳ��ϼ��� ����Ŭ'); --�ܼ� ���
    end;
/

--���
declare 
--���� ����
    grade char;
    result varchar2(30);
    
begin
    grade := 'B';
    
    IF grade = 'A' then
        result := 'A����';
        
    elsif grade = 'B' then
        result := 'B����';
        
    elsif grade = 'C' then
        result := 'C����';
        
    elsif grade = 'D' then
        result := 'D����';
    else
        result := 'F����';
    end if;
        dbms_output.put_line(grade || ':' || result);
        
exception
-- begin ������ ������ �߻��ϸ� ����
    when others then
        dbms_output.put_line('error �߻�');
end;
/


accept input prompt'����(A,B,C,D,F)�� �Է��ϼ���.'
declare 
--���� ����
    grade char := '&input';
    result varchar2(30);
    
begin
    --grade := 'B';
    
    IF grade = 'A' then
        result := 'A����';
        
    elsif grade = 'B' then
        result := 'B����';
        
    elsif grade = 'C' then
        result := 'C����';
        
    elsif grade = 'D' then
        result := 'D����';
    else
        result := 'F����';
    end if;
        dbms_output.put_line(grade || ':' || result);
        
exception
-- begin ������ ������ �߻��ϸ� ����
    when others then
        dbms_output.put_line('error �߻�');
end;
/

--swich ��

declare 
--���� ����
    grade char;
    result varchar2(30);
    
begin
    grade := 'B';
    
    case grade
    when 'A' then
        result := 'A����';
        
    when 'B' then
        result := 'B����';
        
    when 'C' then
        result := 'C����';
        
    when 'D' then
        result := 'D����';
    else
        result := 'F����';
    end case;
        dbms_output.put_line(grade || ':' || result);
        
exception
-- begin ������ ������ �߻��ϸ� ����
    when others then
        dbms_output.put_line('error �߻�');
end;
/

--������ ����(+, -, * , /)
--
accept num1 prompt'����1�� �Է��ϼ���.'
accept num2 prompt'����2�� �Է��ϼ���.'
accept op prompt'�����ڸ� �Է��ϼ���.'
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
                dbms_output.put_line('���� �߸��Ǿ����ϴ�.');
            
        end case;
        dbms_output.put_line(num1 || grade || num2 || '=' || result);
            
    exception
    
        when others then
            dbms_output.put_line('error �߻�');
            
    end;
    /