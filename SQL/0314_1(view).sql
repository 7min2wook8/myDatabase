--view (���� ���̺�) : �������̺��� ������� �ʿ��� �����͸� �����Ͽ� ���� -���ȿ� ����
--GRANT create view TO test;

create or replace view myView as
    select ename "�����", dno "�μ���ȣ", 
        (select dname from department where e.dno = dno) "�μ���", 
        (select loc from department where e.dno = dno) "�ٹ���" 
        from employee e
            where dno = (select dno from employee where ename = 'SCOTT');
            
select �����, �μ���ȣ from myView;