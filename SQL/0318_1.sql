
delete from dept_copy where dno = 50;

set serveroutput on;

declare
    cnt number := 1;
    
    exist_dno_err exception;
begin
    if cnt > 0 then
        dbms_output.put_line('�̹� ��ϵ� �μ��Դϴ�.');
        
        --������ ����ó�� ����
        raise exist_dno_err;
        
    else 
        insert into dept_copy(dno, dname, loc)
            values(50,'���ߺ�','�뱸');
         dbms_output.put_line('�������� ��ϵ� �μ��Դϴ�.');
        commit;
        
    end if;
    
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line('�μ� ���� �Է��� �����߻����� �ѹ� ����!!');
            rollback;
end;
/


--1. ����� �����ϴ��� �˻��ϴ� �Լ� ���� find_eno_f
--2. ����� �Ű������� �޾� �����ϴ� ���ν��� ���� del_eno_p
-- ����1) ����� �����ϸ� ���� �� Ŀ��
-- ������ "����� �������� �ʽ��ϴ�." ��� �� �ѹ� ó��
-- ����2) ����� ���� ���� ó�� ���

--select count(*) from emp_copy where eno = 7369 GROUP by eno;
--
--create or replace function find_eno_f(
--    p_eno emp_copy.eno%TYPE
--)return number is
--    
--    v_eno number;
--begin
--    select count(*) into v_eno from emp_copy where eno = p_eno and rownum = 1 GROUP by eno;
--    dbms_output.put_line('Ȯ��' || v_eno);
--    if v_eno > 0 then
--        RETURN 1;
--    else
--        RETURN 0;
--    end if;
--    
--exception
--    when others then
--        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
--            dbms_output.put_line(sqlcode || sqlerrm);            
--            return -1;
--end;
--/


delete from emp_copy where eno = 1234;
rollback;
--2. ����� �Ű������� �޾� �����ϴ� ���ν��� ���� del_eno_p
create or replace procedure del_eno_p(
     p_eno emp_copy.eno%TYPE
) is
        exist_dno_err exception;
begin

    if  find_eno_f(p_eno) = 1 then
        delete from emp_copy where eno = p_eno;
        commit;
        dbms_output.put_line(p_eno || '����� �����Ǿ����ϴ�.');
    else
        dbms_output.put_line('����� ã�� �� �����ϴ�.');
        raise exist_dno_err;
       
    end if;
    
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
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
        dbms_output.put_line('��ϵǾ��ֽ��ϴ�.');
        raise exist_dno_err;
        
    else
        insert into emp_copy(eno, ename, job, manager, hiredate, salary, dno)
            values(p_eno, p_ename, p_job, p_manager, p_hiredate, p_salary, p_dno);         
        commit;
        dbms_output.put_line(p_eno || '�߰� �Ǿ����ϴ�.');
        
       
    end if;
    
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
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
        dbms_output.put_line('���� �Ǿ��ֽ��ϴ�.');
        
        
    else
        dbms_output.put_line('ã�� �� �����ϴ�.');
        raise exist_dno_err;
       
    end if;
    
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
           
end;
/

--exec up_eno_p(8000,'suzi','SALESMAN',7369,'25/03/18',2500,20);

--accept input_comm prompt'� �۾��� �� ������ �Է��ϼ���.'



create or replace procedure del2_eno_p(
     p_eno in emp_copy.eno%TYPE,
     msg out varchar2
) is
        exist_dno_err exception;
begin

    if  find_eno_f(p_eno) = 1 then
        delete from emp_copy where eno = p_eno;
        msg := p_eno || '����� �����Ǿ����ϴ�.';
        commit;
        
    else
        dbms_output.put_line('����� ã�� �� �����ϴ�.');
        raise exist_dno_err;
       
    end if;
    
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
           
end;
/


--accept ex_eno prompt'����� �Է��ϼ���.'
--declare
--    msg varchar2(80);
--begin
--    del2_eno_p(&ex_eno, msg);  --���ν��� ȣ��
--    dbms_output.put_line('���� ���' || msg);
--exception
--    when others then
--        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
--            dbms_output.put_line(sqlcode || sqlerrm);
--             rollback;
--           
--end;
--/


/*
    1. �μ����̺�(dept_copy)�� �μ���ȣ, �μ���, �ٹ����� �߰��ϴ� ���ν��� ����
        dept_ins_p
    2. �μ���ȣ�� �����ϴ��� �˻��ϴ� �Լ� ���� - find_dno_f
    3. �μ���ȣ, �μ���, �ٹ����� accept�� ����Ͽ� �Է¹���.
    4. out �Ű������� ���Ͽ� ���� �޽�����, ���� �޽����� �޾� ���
    5. ����� ���� ���ܸ� ����ϱ�
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
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
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
        msg := v_num ||'�� �߰��Ǿ����ϴ�.';    
    else
        msg := '�����Ͽ����ϴ�.';
        raise exist_dno_err;
       
    end if;
    
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
           
end;
/

accept ex_dno prompt'����� �Է��ϼ���.'
accept ex_dname prompt'������ �Է��ϼ���.'
accept ex_loc prompt'������ �Է��ϼ���.'
declare
    msg varchar2(80);
begin
    dbms_output.put_line('���� ���' || &ex_dno);
    --dept_ins_p(&ex_dno, '&ex_dname', '&ex_loc', msg);  --���ν��� ȣ��
    --dbms_output.put_line('���� ���' || msg);
    
exception
    when others then
        --sqlcode : ���� �ڵ�, sqlerrm : ���� �޼���
            dbms_output.put_line(sqlcode || sqlerrm);
             rollback;
end;
/
