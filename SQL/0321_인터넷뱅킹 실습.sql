--0321_���ͳݹ�ŷ �ǽ�.sql


--1. ��õ�� ������ ����, ������, ���¹�ȣ �˻�
select cu.cname, ac.bname, ac.acno 
from account21 ac, customer21 cu 
where ac.bname = 'KB��õ��' and ac.cno = cu.cno; 
--2. ����ġ ���� ���¹�ȣ(acno), ����(cname), ���ּ�(caddr), ������(cbirth)�� �˻�
select ac.acno, cu.cname, cu.caddr, cu.cbirth 
from account21 ac, customer21 cu
where ac.cno = cu.cno and ac.cno = (select cno from customer21 where cname = '����ġ');
--3. ��õ�� ������ ����, ������, ���¹�ȣ �˻�
select cu.cname, br.bname ,ac.acno 
from customer21 cu, account21 ac, branch21 br
where cu.cno = ac.cno and ac.bname = 'KB��õ��' and ac.bname = br.bname;
--4. 25/03/01 ~ 25/03/31 ������ ��� �ŷ� ���� �˻�
(select * from savingacc21 where sadate between '25/03/01' and '25/03/31');
--5. 2025�� 3���� �ŷ��� ȫ�浿 ���� ����, ��/��� ����, ���� ��ȣ, �ŷ����¹�ȣ,
--�ŷ� �ð�, �ŷ��ݾ�, �ܾ� �˻�
--����) �ݾ��� ��ȭ ǥ�÷� ���
select cu.cname "����", sa.sainout "��/��� ����", ac.acno "���¹�ȣ", sa.sainout"�ŷ����¹�ȣ", 
to_char(sa.samoney, 'L999,999,999')"�ŷ� �ݾ�" , 
to_char(sa.sajango, 'L999,999,999')"�ܾ�"
from savingacc21 sa, customer21 cu, account21 ac
where sa.cno = cu.cno and 
ac.acno = sa.acno and
sa.cno = (select cno from customer21 where cname = 'ȫ�浿');

--6. 2025�� 3�� �ŷ��� ������ ���� ����, ��/��� ����, ���¹�ȣ, �ŷ��ð�, ��/����� �̸�, �ŷ����� ,�ܾ� �˻�
select c.cname "����", s.sainout "��/��� ����", a.acno "���¹�ȣ", s.sadate"�ŷ��ð�",
(select cname from customer21 where cno  = 
    (select cno from account21 where acno = s.transfer)) "��/����� �̸�" ,
to_char(s.samoney, 'L999,999,999')"�ŷ� �ݾ�" , 
to_char(s.sajango, 'L999,999,999')"�ܾ�"
from savingacc21 s, customer21 c, account21 a
where s.cno = c.cno and a.acno = s.acno and
s.sadate between '25/03/01' and '25/03/31' and
c.cname = '������';

