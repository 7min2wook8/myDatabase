--

set serveroutput on --pl/sql ����� ���� ����
--���ν��� : ���α׷��ֿ��� void �Լ� ����(������ ���� �Լ�)

create or replace procedure emp_info_p(
    p_empno in employee.eno % type    --�Ű�����
)is 
    v_eno employee.eno%type;
    v_sal employee.salary%type;
    v_name varchar2(20);
    
    begin
        select eno,ename,salary into v_eno, v_name, v_sal from employee
        where eno = p_empno;
        dbms_output.put_line('���:' || v_eno);
        dbms_output.put_line('�̸�:' || v_name);
        dbms_output.put_line('�޿�' || v_sal);
        
    exception
        when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
            
   end;
/

--���ν��� ȣ�� ���
--accept p_eno prompt '�˻��� ����� �Է��ϼ���.'
--exec emp_info_p(&p_eno);

--�μ���ȣ�� �Ű������� �Է¹޾� �μ����� �ִ�޿��� ����ϴ� ���ν���
create or replace procedure emp_info_p2(
    p_empdno in employee.dno % type    --�Ű�����
)is 
    v_dno employee.dno%type;
    v_sal employee.salary%type;

    begin
        select dno, max(salary) into v_dno, v_sal from employee
        where dno = p_empdno
        group by dno;
        
        dbms_output.put_line('�̸� : ' || v_dno || ' �ִ� �޿� : ' || v_sal);
        
    exception
        when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
            
   end;
/

--accept p_dno prompt '�˻��� ����� �Է��ϼ���.'
--exec emp_info_p2(&p_dno);

--�μ� ��ȣ�� �Ű������� �Է¹޾� ���, �����, �Ի���, �޿��� ����ϴ� ���ν���
create or replace procedure emp_info_p3(
    p_empdno in employee.dno % type    --�Ű�����
)is 
    v_dno employee.dno%type;
    v_ename employee.ename%type;
    v_hiredate employee.hiredate%type;
    v_sal employee.salary%type;

    cursor emp_cursor is select *             
            from employee 
            where dno = p_empdno;
            
    emp_buf employee % rowtype;-- employee�� ���̺��� �Ӽ� ������ ���� class ����� ���
begin
    dbms_output.put_line('cursor ���'); 
    dbms_output.put_line('�����ȣ ' || ' �̸�' || '       �Ի���' || '          �޿�'); 
   open emp_cursor;
        loop
            fetch emp_cursor into emp_buf;  -- emp_cursor�� ������ ���� emp_buf�� ����                
            exit when emp_cursor % notfound;-- emp_cursor�� ���� ���� ã���������� exit��
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
    
    
    dbms_output.put_line('for ���'); 
    dbms_output.put_line('�����ȣ ' || ' �̸�' || '       �Ի���' || '          �޿�'); 
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
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
            
end;
/



--����� ������� �Ű������� �޾Ƽ� ���� ��� �Ǵ� ������ ��ġ�ϴ� �μ���ȣ�� ���� �� 
--�����, �Ի���,����, �޿� ����ϴ� ���ν���
--����1 �����Ͱ� ������ '�˻��� �����Ͱ� �������� �ʽ��ϴ�.' ���� �޼��� ���

create or replace procedure emp_sam_p4(
    p_empeno in employee.eno%type,    --�Ű�����
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
            dbms_output.put_line('�̸� :' || v_ename);        
            dbms_output.put_line('�Ի��� :' || v_hiredate);   
            dbms_output.put_line('���� :' || v_job);   
            dbms_output.put_line('�޿� :' || v_sal);
            v_count := 1;
            
        end loop;
        
        if v_count = 0 then
            dbms_output.put_line('�˻��� �����Ͱ� �������� �ʽ��ϴ�.');
        end if;
            
exception
        when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);

end;
/


--accept p_dno prompt '�˻��� ����� �Է��ϼ���.'
--accept p_ename prompt '�˻��� ������� �Է��ϼ���.'
--exec emp_sam_p4(&p_dno, '&p_ename');


--�Լ� function : ���α׷��ֿ��� return�� �ִ� �Լ�
--���� - db - �Լ� ������ ������

--�μ� ��ȣ�� �ִ��� Ȯ���ϴ� �Լ�
--rownum : ������ ��ȣ ����
--select count(*) from department where dno = 100 and rownum =1;

create or replace function dept_dno_cnt_f(
    p_deptno department.dno%type
) RETURN number is
--�Ϲ� ���� ���� ����
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
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
            return -1;
end;
/
--accept p_dno prompt '�˻��� ����� �Է��ϼ���.'

--select DISTINCT dept_dno_cnt_f(5) from department;

--����� ������� �Ű������� �޾Ƽ� ��� �Ǵ� ������ ��ġ�ϴ� �μ���ȣ�� ���� ��
--�����, �Ի���, ����, �޿� ����ϴ� ���ν���
--����1) �����Ͱ� ������ '�˻��� �����Ͱ� �������� �ʽ��ϴ�.' ���� �޽��� ���
--����2) dept_dno_cnt_f �Լ��� ����Ͽ� ����1) ó��
create or replace function dept_dno_cnt_f2(
    p_deptno employee.eno%type,
    p_deptname employee.ename%type
) RETURN number is
--�Ϲ� ���� ���� ����
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
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
            return -1;
end;
/


set serveroutput on --pl/sql ����� ���� ����
create or replace procedure emp_find2_p(
    p_empeno in employee.eno%type,    --�Ű�����
    p_ename in employee.ename%type
) is
    
BEGIN

        if dept_dno_cnt_f2(p_empeno, p_ename) = 0 then
             
            dbms_output.put_line('�˻��� �����Ͱ� �������� �ʽ��ϴ�.');
            
        else
            for emp_row in (select ename, hiredate, job, salary             
                from employee                    
                where dno in (select dno from employee 
                                where eno = p_empeno or ename = p_ename))
            loop                
                dbms_output.put_line('----------------------------------------------------------------');
                dbms_output.put_line('����� :' || emp_row.ename);   
                dbms_output.put_line('�Ի��� :' || emp_row.hiredate);   
                dbms_output.put_line('���� :' || emp_row.job);   
                dbms_output.put_line('�޿� :' || emp_row.salary);
                
                
            end loop;
--            
        
        end if;
        
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
end;
/


exec emp_find2_p(10,'SCOTT');