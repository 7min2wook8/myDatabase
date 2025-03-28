DROP TABLE customer21 cascade constraints purge;
DROP TABLE savingAcc21 cascade constraints purge;
DROP TABLE branch21 cascade constraints purge;
DROP TABLE account21 cascade constraints purge;

CREATE TABLE customer21 (
	cno	varchar2(10)		primary key,
	cname	varchar2(20)		NOT NULL,
	caddr	varchar2(50)		NOT NULL,
	cbirth	varchar2(40)		NOT NULL
);

CREATE TABLE branch21 (
	bname	varchar2(20)		primary key,
	bcity	varchar2(20)		NOT NULL,
	bjasan	varchar2(20)		NOT NULL,
	bename	varchar2(20)		NOT NULL,
	bopenDate	date		NOT NULL,
	btel	varchar2(30)		NOT NULL
);

CREATE TABLE account21 (
	acno	varchar2(20)		primary key,
	bname	varchar2(20)		NOT NULL,
    cno     varchar2(10)        NOT NULL
);

CREATE TABLE savingAcc21 (
	sano	varchar2(10)		primary key,
	cno	    varchar2(10)		    NOT NULL,
	acno	varchar2(20)		NOT NULL,
	sadate	varchar2(20)		NOT NULL,
	sainout	varchar2(10)		NOT NULL,
	samoney	number		        NOT NULL,
	sajango	number		        NOT NULL,
    transfer VARCHAR2(20)       NOT NULL
);

ALTER TABLE account21 ADD CONSTRAINT FK_branch21_TO_account21_1 FOREIGN KEY (
	bname
)
REFERENCES branch21 (
	bname
);

-- �� ���̺� �⺻Ű - ����Ű �߰�
ALTER TABLE account21 ADD CONSTRAINT FK_customer21_TO_account21_1 FOREIGN KEY (
	cno
)
REFERENCES customer21 (
	cno
);

ALTER TABLE savingAcc21 ADD CONSTRAINT FK_customer21_TO_savingAcc21_1 FOREIGN KEY (
	cno
)
REFERENCES customer21 (
	cno
);

ALTER TABLE savingAcc21 ADD CONSTRAINT FK_account21_TO_savingAcc21_1 FOREIGN KEY (
	acno
)
REFERENCES account21 (
	acno
);

-- ###### ���� ������ �߰� ######
insert into branch21 values ('KB��õ��', '�뱸', '2000��', 'KBSINCHON',
    to_date('1980/02/03', 'yyyy/mm/dd'), '053-123-1234');
insert into branch21 values ('KB������', '�뱸', '5000��', 'KBBUMEO',
    to_date('1982/05/11', 'yyyy/mm/dd'), '053-456-1234');
insert into branch21 values ('KB�ž���', '�뱸', '3000��', 'KBSINAM',
    to_date('1983/08/24', 'yyyy/mm/dd'), '053-987-1234');
    
-- ###### �� ������ �߰� ######
insert into customer21 values ('C0001', 'ȫ�浿', '�뱸 ���� ��õ1��',
    to_date('1990/03/21', 'yyyy/mm/dd'));
insert into customer21 values ('C0002', '����ġ', '�뱸 ���� ��õ3��',
    to_date('1991/07/21', 'yyyy/mm/dd'));
insert into customer21 values ('C0003', '������', '�뱸 ���� ��õ4��',
    to_date('1993/09/21', 'yyyy/mm/dd'));

-- ###### ���� ������ �߰� ######
insert into account21 values ('BO-0001', 'KB��õ��', 'C0001');
insert into account21 values ('BO-0002', 'KB������', 'C0002');
insert into account21 values ('BO-0003', 'KB�ž���', 'C0003');

-- ###### ���� ������ �߰� ######
insert into savingacc21 values ('SA0001', 'C0001','BO-0001',to_char(sysdate-2, 'yy-mm-dd hh24:mi:ss'), 
                                '�Ա�', 100000, 1100000,'BO-0002');
                                
--4�� ����
insert into savingacc21 values ('SA0002', 'C0002','BO-0002',to_char(sysdate-4, 'yy-mm-dd hh24:mi:ss'), 
                                '�Ա�', 100000, 1100000,'BO-0001');

--1�� �߰�
insert into savingacc21 values ('SA0003', 'C0003','BO-0003',to_char(sysdate+2, 'yy-mm-dd hh24:mi:ss'), 
                                '���', 100000, 1000000,'BO-0003');
                 
--20�� �߰�               
insert into savingacc21 values ('SA0004', 'C0003','BO-0003',to_char(sysdate+20/(24*60), 'yy-mm-dd hh24:mi:ss'), 
                                '���', 100000, 900000,'BO-0003');
--30�� �߰� 
--to_char() : ��¥ ������ ���ڿ��� ����
--to_date() : ���ڿ� ������ ��¥ ������ ����
--sysdate : ���� ��ǻ�� ������ �ð��� ���
insert into savingacc21 values ('SA0005', 'C0001','BO-0001',to_char(sysdate+30/(24*60*60), 'yy-mm-dd hh24:mi:ss'), 
                                '�Ա�', 100000, 900000,'BO-0002');
                                

insert all 
    --C0003 ���� ----> C0001 ���·� �۱�
    into savingacc21 values('SA0006','C0003', 'BO-0003',
        to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 
        '���', 100000, 300000, 'B0-0001')
    
    --C0001 ���¿� C0003���°� ���� �ݾ� �Ա� 
    into savingacc21 values('SA0007','C0001', 'BO-0001',
        to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 
        '�Ա�', 100000, 700000, 'B0-0003')
        --dual ����Ŭ���� �����ϴ� �ӽ� ���̺�
        
    --BO-0001 ----> BO0-0002 300,000 �۱� 
    into savingacc21 values('SA0008','C0001', 'BO-0001',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 
    '���', 300000, 400000, 'B0-0002')
    
    --BO-0002 <---- BO-0001 300,000 �Ա� 
    into savingacc21 values('SA0009','C0002', 'BO-0002',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 
    '�Ա�', 300000, 500000, 'B0-0001')
    
    select * from dual;
    
commit;




