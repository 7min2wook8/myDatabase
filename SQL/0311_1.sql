--0311_1.sql

/*
������ Ÿ��
varchar     �������� ���� ���ĺ�
varchar2    �������� ���� ���ĺ�
nvarchar2   �������� ���� �ٱ���
char        �������� ����
number      �������� ����
int         �������� ����
date        ��¥
clob        ��뷮 �ؽ�Ʈ
blob        �̹���, ������, ����
*/


drop table student_t;
--���� ����(constraint) : ���̺��� ���Ǵ� Ư���� ����
create table student_t(
    id     NUMBER,
    name   VARCHAR2(20) NOT NULL,
    age    NUMBER NOT NULL,
    addr   VARCHAR2(40) NOT NULL,
    gender varchar2(4) not null,
    --�������Ǹ� 'pk_std_id'�� ����Ͽ� pk ����
    CONSTRAINT pk_std_id PRIMARY KEY(id),
    --�������Ǹ� ����� ���� ����
    CONSTRAINT age_chk CHECK(age > 17),
    CONSTRAINT gen_chk CHECK(gender in ('��','��'))
     
     
);


--������ ����, 1�� ����, ������ 1000
CREATE SEQUENCE seq_std_id INCREMENT BY 1 START WITH 1000;

INSERT INTO student_t VALUES (
    seq_std_id.NEXTVAL,
    'ȫ�浿',
    10,
    '���� �Ծ� ȫ�밨��',
    '��'
);

SELECT
    *
FROM
    student_t;

drop SEQUENCE seq_std_id;

commit;

/*
1. person_t ���̺� ����
2. ���̵� id ������,5  �̸� name ���� 20, ���� gender ���� 5,
��ȭ tel ���� 20, ���� age ���� 3
3.���̵� �⺻Ű�� ���� �������� p_id_pk
4. ���� Į���� '����','����' ���� ��� �������� p_gen_chk
5. ��� �Ӽ��� NULL���� ���� �� ����
6. ���̴� 20�� ���� ���ƾ��� p_age_chk
7. ������ 5�� �̻� �߰��ϰ� �˻��ϱ�
8. 100���� 1�� �����ϴ� seq_id_p ������ �����Ͽ� pk�� ���
9. �������ǿ� ����Ǵ� �����͸� ����Ͽ� ���� �߻� Ȯ���ϱ�

*/

drop TABLE person_t;
create TABLE person_t(
    id      NUMBER(5),
    name    VARCHAR2(20) not null,
    gender  VARCHAR2(10) not null,
    tel     VARCHAR2(20) not null,
    age     NUMBER(3) not null,
    CONSTRAINT p_id_pk PRIMARY KEY(ID),
    CONSTRAINT p_gen_chk CHECK(gender in ('����', '����')),
    CONSTRAINT p_age_chk CHECK(age > 20)
);
DROP SEQUENCE seq_id_p;
--������ ����, 1�� ���, 10000���� ����
create SEQUENCE seq_id_p INCREMENT BY 1 START WITH 100;
insert into person_t values(seq_id_p.nextval, 'ȫ��', '����', '010-1111-1111', 30);
insert into person_t values(seq_id_p.nextval, '����', '����', '010-2222-2222', 21);
insert into person_t values(seq_id_p.nextval, '����', '����', '010-3333-3333', 22);

select * from person_t;