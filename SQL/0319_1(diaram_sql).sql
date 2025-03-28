drop table ai_student_2025;
drop table ai_professor_2025;
commit;
-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- ai_professor_2025 Table Create SQL
-- ���̺� ���� SQL - ai_professor_2025
CREATE TABLE ai_professor_2025
(
    ai_pid        varchar2(10)    NOT NULL, 
    ai_pname      varchar(20)     NOT NULL, 
    ai_phakkwa    varchar(30)     NOT NULL, 
     PRIMARY KEY (ai_pid)
);

-- ���̺� Comment ���� SQL - ai_professor_2025
COMMENT ON TABLE ai_professor_2025 IS '���� ���̺�';

-- �÷� Comment ���� SQL - ai_professor_2025.ai_pid
COMMENT ON COLUMN ai_professor_2025.ai_pid IS '������ȣ';

-- �÷� Comment ���� SQL - ai_professor_2025.ai_pname
COMMENT ON COLUMN ai_professor_2025.ai_pname IS '�����̸�';

-- �÷� Comment ���� SQL - ai_professor_2025.ai_phakkwa
COMMENT ON COLUMN ai_professor_2025.ai_phakkwa IS '�а�';


-- ai_student_2025 Table Create SQL
-- ���̺� ���� SQL - ai_student_2025
CREATE TABLE ai_student_2025
(
    ai_sid       varchar2(10)    NOT NULL, 
    ai_sname     varchar(20)     NOT NULL, 
    as_shakwa    varchar(30)     NOT NULL, 
    ai_pid       varchar2(10)    NOT NULL, 
     PRIMARY KEY (ai_sid)
);

-- ���̺� Comment ���� SQL - ai_student_2025
COMMENT ON TABLE ai_student_2025 IS '�л� ���̺�';

-- �÷� Comment ���� SQL - ai_student_2025.ai_sid
COMMENT ON COLUMN ai_student_2025.ai_sid IS '�л���ȣ';

-- �÷� Comment ���� SQL - ai_student_2025.ai_sname
COMMENT ON COLUMN ai_student_2025.ai_sname IS '�̸�';

-- �÷� Comment ���� SQL - ai_student_2025.as_shakwa
COMMENT ON COLUMN ai_student_2025.as_shakwa IS '�а�';

-- �÷� Comment ���� SQL - ai_student_2025.ai_pid
COMMENT ON COLUMN ai_student_2025.ai_pid IS '������ȣ';

-- Foreign Key ���� SQL - ai_student_2025(ai_pid) -> ai_professor_2025(ai_pid)
ALTER TABLE ai_student_2025
    ADD CONSTRAINT FK_ai_student_2025_ai_pid_ai_professor_2025_ai_pid FOREIGN KEY (ai_pid)
        REFERENCES ai_professor_2025 (ai_pid) ;

-- Foreign Key ���� SQL - ai_student_2025(ai_pid)
-- ALTER TABLE ai_student_2025
-- DROP CONSTRAINT FK_ai_student_2025_ai_pid_ai_professor_2025_ai_pid;

insert into ai_professor_2025 values('p98761','�����̸�','��ǻ�Ͱ�');
insert into ai_professor_2025 values('p98762','�˺���Ʈ','�����');
insert into ai_professor_2025 values('p98763','���ν�Ÿ��','���ڰ�');

insert into ai_student_2025 values('s98761','���缮','����','p98763');
insert into ai_student_2025 values('s98762','������','ü��','p98762');
insert into ai_student_2025 values('s98763','����ȿ','����','p98761');
insert into ai_student_2025 values('s98764','�̱���','����','p98763');
insert into ai_student_2025 values('s98765','����','ü��','p98762');
insert into ai_student_2025 values('s98766','������','����','p98761');

--delete from ai_student_2025 where ai_sid like '0000_';
--delete from ai_professor_2025 where ai_professor_2025.ai_pid like '0000_';
--where ename like '%A%' and e.dno = d.dno;

select * from ai_student_2025 p, ai_professor_2025 s where p.ai_pid = s.ai_pid;
commit;