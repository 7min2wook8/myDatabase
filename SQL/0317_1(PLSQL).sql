set serveroutput on --pl/sql ����� ���� ����


--�ݺ��� for

declare
    i number := 0;
    
    begin
    --for(i=0; i<5; i++)
        for i in 1..5 loop
            dbms_output.put_line('i�� ��=' || i);
        end loop;
    end;
/
        
--10ȸ �ݺ��ϸ鼭 2�� ��� ���
declare
    i number := 0;
    
    begin
    --for(i=1; i<=10; i++)
        for i in 1..10 loop
            dbms_output.put_line('i�� ��=' || i*2);
        end loop;
    end;
/



--1~10������ 2�� ��� ���
declare
    i number := 0;
    
    begin
    --for(i=1; i<=10; i++)
        for i in 1..10 loop
            --mod(i,2): i�� 2�� ���� ������
            if mod(i,2) = 0 then
                dbms_output.put_line('1~10 ¦��=' || i);
            end if;
        end loop;
    end;
/

--�ݺ��� while
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


--�ݺ��� while
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
            dbms_output.put_line('1~10�� �� : ' || v_sum);
            
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);

end;    
/


--1~ 100 ���� ������ ���߿��� 3�� ����� ���� ���
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
            dbms_output.put_line('1~100�� 3�� ��� �� : ' || v_sum);
            
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);

end;    
/


--cursor : ����Ŭ���� ���� ����� ����� ���� ������(��)�� ��ġ ����

declare
    --select �� ������� emp_cursor�� ����
    cursor emp_cursor is select * from employee where dno = 20;
    emp_buf employee % rowtype;-- employee�� ���̺��� �Ӽ� ������ ���� class ����� ���
begin

    open emp_cursor;
        loop
            fetch emp_cursor into emp_buf;  -- emp_cursor�� ������ ���� emp_buf�� ����
            exit when emp_cursor % notfound;-- emp_cursor�� ���� ���� ã���������� exit��
            
                dbms_output.put_line(emp_buf.eno || ':'|| emp_buf.ename);
                
        end loop;
    close emp_cursor;
end;
/

--���� ǥ��
declare
    
begin

--cursor emp_cursor is select * from employee where dno = 20;
--emp_buf employee % rowtype;-- employee�� ���̺��� �Ӽ� ������ ���� class ����� ���
--���� ������ ���ٷ� ����
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

-- ���l�� ����� ���ϰ��� ���
declare
    v_eno number;
    v_ename varchar2(20);
    
begin
--eno�� ���� v_eno�� ename�� ���� v_ename�� ����
    select eno, ename into v_eno, V_ename from employee
        where eno = 7788;
            dbms_output.put_line('���:' || v_eno);
            dbms_output.put_line('�̸�:' || v_ename);
end;
/
