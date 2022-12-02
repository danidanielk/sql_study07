select * from user_sequences;
drop sequence aug30_snack_seq;
drop sequence ceo_seq;
drop sequence menu_seq;
drop sequence snack_seq;
drop sequence store_seq;

select * from tab; 
drop table aug30_snack cascade constraint purge;
drop table cafe cascade constraint purge;
drop table ceo cascade constraint purge;
drop table maker cascade constraint purge;
drop table drink cascade constraint purge;
drop table member cascade constraint purge;
drop table menu cascade constraint purge;
drop table snack cascade constraint purge;
drop table store cascade constraint purge;

--2000 �� ������ ������ �ּҰ����� ������
select min(s_price) from snack1 where s_price <= 2000;
--��� ������ ��հ���
select avg(s_price) from snack1;
--������ �̸��� ������ 30% ���ε� �ݾ�
select s_name , s_price*0.7 from snack1;
--3500���� ������ ������ �?
select count(s_name) from snack1 where s_price = 3500;
--3000�� ������ ������ �̸�,ȸ���̸�
select s_name, s_maker from snack1 where s_price <=3000;
--��� ���� �̸�, ����, ������� ��ȸ
select s_name,s_price,s_date from snack1;
--��� ���� �̸�, ����, �ΰ��� ��ȸ 10%
select s_name , s_price, s_price*0.1 from snack1;
--��� ���� �̸�, ����, �ǸŰ� ��ȸ 20%����
select s_name, s_price, s_price*0.8 from snack1;
--3000�� ���� ū �ݾ��� ���ڵ��� ��հ� ��ȸ
select avg(s_price) from snack1 where s_price >3000;
--�ְ�,������,�� ���� ���� ������� ��ȸ
select max(s_price), min(s_price),count(s_name) from snack1 
--3000�� �̻��� ������ ��ü ���� ��ȸ
select * from snack1 where s_price >=3000;
--3000�� �̸��� ������ �̸�, ����, �ǸŰ� ��ȸ 20% ����
select s_name , s_price , s_price*0.8 from snack1 where s_price < 3000;
--��Ϲ���Ĩ�� ���� ��ȸ
select s_price from snack1 where s_name like'%����%';
--ũ��� ȸ���� ���� ���� ���� ��ȸ
select sum(s_price) from snack1 where s_maker = 'ũ���';
--9�� ������ �Ծ�� �ϴ� ���� �̸�, ����, ������� ��ȸ
select s_name, s_price , s_date from snack1 where s_date < to_date('20221001','YYYYMMDD');
--'��'�� ���� ȸ�翡�� ���� ������ �̸� ��ȸ
select s_name from snack1 where s_maker like'%��%';
--'��' ������ ���ڵ� ��հ� ��ȸ
select avg(s_price) from snack1 where s_name like '%��%';
--ũ�����ڰų�,����~�ΰ� �̸�,����ȸ��,���� ��ȸ
select s_name , s_maker , s_price from snack1 where s_maker in 'ũ���' or s_name like '%����%';
--������ �̸��� '���޴���'���� �����ϰų� '��' �� ������ ������ �̸�,������ ,���� ��ȸ 
select s_price , s_maker , s_name from snack1 where s_name = '���޴���' or s_name like '%��';
--���� ������ �߿��� ȸ�簡 ũ����̰� ������ 1000�� �����̰ų� 3000�� �̻��� ���� ��ü���� ��ȸ
select * from snack1 where s_maker='ũ���' and (s_price <=1000 or s_price >=3000);
--�Ե� �Ǵ� ���� ȸ���� ���� ��� ������ 1800 �� �̻��� �� �� ȸ���� ��� ���� ������ �� ����
select s_maker,avg(s_price) from snack1 group by s_maker having s_maker = '�Ե�' or s_maker ='����' and avg(s_price)>=1800 order by avg(s_price)desc;
--ȸ�纰�� �׷��� ��� ���� ��հ���, �ּҰ���, �ְ��� �� �˰������
select avg(s_price), min(s_price), max (s_price) from SNACK1 group by s_maker;
--ȸ�� �̸�, ȸ�纰 ���� �� ���� �հ�� ��� ���ڵ��� �հ�
--ȸ�纰�� ���� ��� ������ 2000�� �̻��� ȸ���� �̸��� ���� ��� ������ ��ȸ.


create table snack1 (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence snack1_seq;

insert into snack1 values(snack1_seq.nextval,'����Ŀ��','������',2000,sysdate);
insert into snack1 values(snack1_seq.nextval,'������','�Ե�',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'������','��ī�ݶ�',500,sysdate);
insert into snack1 values(snack1_seq.nextval,'��ĵ��','�Ե�',3500,sysdate);
insert into snack1 values(snack1_seq.nextval,'�����','������',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'��������','����',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'��¡���','ũ���',2000,sysdate);
insert into snack1 values(snack1_seq.nextval,'��Ŭ����','ũ���',4000,sysdate);
insert into snack1 values(snack1_seq.nextval,'���޴���','ũ���',3000,sysdate);
insert into snack1 values(snack1_seq.nextval,'����','����',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'�ٰ�Ʈ','ũ���',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'Ŀ�ǻ���','����',5000,sysdate);
insert into snack1 values(snack1_seq.nextval,'ġ������ũ','������',4500,sysdate);
insert into snack1 values(snack1_seq.nextval,'����','����',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'�Ұ�����','�Ե�',3000,sysdate);


------------------------------------------------------------------------------------------


1.���������� ����...snack ���̺� �̿��Ͽ� �������� �ۼ�

--���ڵ� �� �ְ�
--���Ϻ�� �����̸�,������,����
--���� �� ���ڴ� ��𿡼� ���峪��
--��հ����� ��� ���ڴ� �� ����?
--��������� ���� �������� ������ ��ü����.

create table snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence snack_seq;

insert into snack values(snack_seq.nextval,'����Ŀ��','������',2000,sysdate);
insert into snack values(snack_seq.nextval,'������','�Ե�',2500,sysdate);
insert into snack values(snack_seq.nextval,'������','��ī�ݶ�',500,sysdate);
insert into snack values(snack_seq.nextval,'��ĵ��','�Ե�',3500,sysdate);
insert into snack values(snack_seq.nextval,'�����','������',1500,sysdate);
insert into snack values(snack_seq.nextval,'��������','����',1500,sysdate);
insert into snack values(snack_seq.nextval,'��¡���','ũ���',1500,sysdate);
insert into snack values(snack_seq.nextval,'��Ŭ����','ũ���',1500,sysdate);
insert into snack values(snack_seq.nextval,'���޴���','ũ���',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'����','����',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'�ٰ�Ʈ','ũ���',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'Ŀ�ǻ���','����',5000,sysdate);
insert into snack1 values(snack1_seq.nextval,'ġ������ũ','������',4500,sysdate);
insert into snack1 values(snack1_seq.nextval,'����','����',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'�Ұ�����','�Ե�',3000,sysdate);

------------------------------------------------------------------------
--���� �� ���� ���� ȸ�翡�� ����� �����̸�, ����
--���� ��� ���ڸ� ����� ȸ��� ��� �ִ���
--��õ�� �ִ� ȸ�翡�� ����� ������ ��հ�
--��հ� �̻��� ���ڸ� ����� ȸ���� �̸�,��ġ --error : single-row subquery ��¼�� ��¼�� in ����ؼ� �ذ�

create table maker (
m_name varchar(20 char) primary key,
m_address varchar(30 char) not null,
m_staff number(3)not null
);

insert into maker values('������','ȭ��',56);
insert into maker values('�Ե�','�Ϻ�',20);
insert into maker values('��ī�ݶ�','�̱�',500);
insert into maker values('ũ���','ȣ��',450);
insert into maker values('����','���ѹα�',980);

select * from maker;
----------------------------------------------------------------------------------

-- ��հ����� ��� ����� �� ���� ����
-- ���� �� ���Ḧ �Ĵ� ī���� �̸���
-- ���￡ �ִ� ī�信�� ����� ���� ��հ�����
-- �¼��� 90�� �̻��� ī�信�� �Ĵ� ������ �̸���
-- ��հ� ������ ������ �̸�
-- ���� ��� ���Ḧ �Ĵ� ī��� ��� �ִ���


create table drink (
d_name varchar2(30 char) primary key,
d_price number(8) not null,
d_cafe varchar2(30 char) not null
);
insert into drink values('�Ƹ޸�ī��',2000,'a');
insert into drink values('��',3000,'a');
insert into drink values('����',2500,'a');
insert into drink values('ȫ��',2500,'b');
insert into drink values('������',3000,'b');
insert into drink values('����������',4000,'b');

create table cafe (
c_name varchar2(30 char) primary key,
c_location varchar2(30 char) not null,
c_seat number(4) not null
);

select round(avg(d_price))from drink;
drop table cafe cascade constraint purge;
insert into cafe values('a','����',100);
insert into cafe values('b','�Ǳ�',80);
---------------------------------------------------------------------------------------



--�¼� �� ���� ���� �Ĵ� ��ϴ� ����� ��ü���� ��ȸ
--���������� �޴� ��ü�� �̸�, ������ ���� �������� ������ ���ٸ� �޴����� ������ ���� ���� (������ �������ϰ� �������� oredr by �÷��� asc/desc , ����)
--��ü ����Ե� �̸�,���� ��ȸ
--���������� �Ĵ� �� ��?
--���������� �޴� ��ü�� ��հ�
--���� ��� �޴� �̸�, ����
--�ֿ����� ������� �̸� ,����
--�¼� ���� ���� ���� �Ĵ��� �̸� ,������ ����,�¼���
--ȫ����� �Ǳ��� ��ϴ� ����� �̸�,����
--������ �� ������ ��𰡸� ���� �� �ֳ���
--�ֿ��� ����Գ� ���� �޴� �̸�,����
----------------------------���� Ȱ��---------------------------------------------------
-- ��ü �Ĵ� �̸�,������,����� �̸�, ����Ի���
-- ��ü �޴���, ����, �Ĵ��̸�, ������
-- �¼��� �� 50�� �̻��� �Ĵ��� �޴���,����,�Ĵ��̸�,������,�¼���
-- �Ը� ���� ū �Ĵ��� �޴���, ����, �Ĵ��̸�, ������, �¼���
-- �ֿ����� ����Գ� ��ü �޴���, ����, �Ĵ��̸�, ������ ,������̸�, ������ �޴��� - �����ټ�, �Ĵ��̸�- �����ټ�.
----------------------------�ο�� --------------------------------
�޴����̺� m_no (sequence ó���� ġ������ ������ �־  �����۾� �� ���)
--�޴� �̸��� ������ ������ �����ؼ� �޴� ��ü ������ ��ȸ�غ���.
--2~4 ���� �޴����̺� ������ �޴������� ������ ��
--�浿 �̸��� ���� ����Գ� �޴���,����,�Ĵ��,������,������̸� ���� �� �������� ������ ���ٸ� �޴����� �����ټ� 3~8��° ���� ��ȸ.
--�达 ���� ���� ����Գ� �޴���,����,������̸�,����� ���� �� ������ ������������ �������ؼ� 2~3�������� 



create table store (
f_no number(3)primary key,
f_name varchar2 (30char) not null,
f_location varchar2 (30char)not null,
f_ceo number(3) not null,
f_seat number(5) not null
);
create sequence store_seq;


insert into store values(store_seq.nextval,'ȫ�����','�Ǳ�',1,100);
insert into store values(store_seq.nextval,'ȫ�����','����',2,80);
insert into store values(store_seq.nextval,'�ѽ�����','����',3,150);
insert into store values(store_seq.nextval,'��õ����','��õ',4,130);



create table ceo (
c_no number(3) primary key,
c_name varchar2(30char) not null,
c_birthday date not null,
c_gender varchar2 (10char) not null
);

create sequence ceo_seq;


insert into ceo values(ceo_seq.nextval,'ȫ�浿',to_date('1990-03-01','YYYY-MM-DD'),'����');
insert into ceo values(ceo_seq.nextval,'��浿',to_date('1992-02-01','YYYY-MM-DD'),'����');
insert into ceo values(ceo_seq.nextval,'ȫ�浿',to_date('1991-12-12','YYYY-MM-DD'),'����');
insert into ceo values(ceo_seq.nextval,'�ֱ浿',to_date('1989-09-01','YYYY-MM-DD'),'����');


create table menu(
m_no number (3) primary key,
m_name varchar2(20char) not null,
m_price number(6) not null,
m_f_no number(3) not null
);

create sequence menu_seq;

insert into menu values(menu_seq.nextval,'�����',4000,1);
insert into menu values(menu_seq.nextval,'«��',5500,1);
insert into menu values(menu_seq.nextval,'������',3000,1);
insert into menu values(menu_seq.nextval,'�������',2300,2);
insert into menu values(menu_seq.nextval,'��ġ�',6000,2);
insert into menu values(menu_seq.nextval,'�ܹ���',4500,2);
insert into menu values(menu_seq.nextval,'�ʷ���',8000,3);
insert into menu values(menu_seq.nextval,'����ȭ��',35000,3);
insert into menu values(menu_seq.nextval,'��ͺ�',700,3);
insert into menu values(menu_seq.nextval,'��ī��',12000,4);
insert into menu values(menu_seq.nextval,'�׻�',3000,4);
insert into menu values(menu_seq.nextval,'����',500,4);


-------------------------------------------------------

join : �ϳ��� ��ɹ��� ���� ���� ���̺� ����� �����͸� �ѹ��� ��ȸ�� �� �ִ� ���.

create table tb1 (name varchar2(10char), age number(3));
insert into tb1 values ('����',30);
insert into tb1 values ('�ں��',35);
insert into tb1 values ('�ֺ��',40);
insert into tb1 values ('�����',40);

create table tb2 (name varchar2(10char), age number(3));
insert into tb2 values ('����',30);
insert into tb2 values ('�����',50);
insert into tb2 values ('�̺��',55);

--cross join : ������ ���� ���� �� ���̺� ���� ������ ��� ����� ��ȸ (��� ����� ��) ��ǻ� �Ⱦ�;
select * from tb1, tb2;
select * from tb1 cross join tb2;

--inner join : ���ǿ� �ش��ϴ� ���� ����.
--select * from tb1 inner join tb2 on tb1.name = tb2.name;
select * from tb1 , tb2  where tb1.name = tb2.name;   --equi ����	: ���� ũ�ν� ���ο� ������ ���� ���ǿ��´°�ã�°� ** �̰ŷοܿ���;;
--select * from tb1 join tb2 using (name);			--equi ����2	: 
--select * from tb1 natural join tb2;					--�ڿ����� 	: ������ ���� ���ʿ� ���� �̸��� ���� ������ �÷����� ��ȸ

--outer join : ������ �� ���̺��� �����Ͱ� ��� ��ȸ���ǰ� ��� ���̺��� �����Ͱ� �ִ°�� �ش� �÷��� ���� �������� ���ؼ����
--			1. left outer join : ���� ���̺� ���� ���� �� ������ ���̺��� ���ǿ� ���� �ʾƵ�(null)���� ����.
select * from tb1 left outer join tb2 on tb1.name = tb2.name;
--select * from tb1 , tb2 where tb1.name = tb2.name(+);
--select * from tb1 a, tb2 b where a.name = b. name(+);  --����� ������� �ؼ� �԰���.
--			2. right outer join : ������ ���̺� ���� ���� �� ���� ���̺��� ���ǿ� ���� �ʾƵ�(null)���� ����. ����Ʈ�� �ַ� ����� �̰� �߾Ⱦ�.
--select * from tb1 right outer join tb2 on tb1.name = tb2.name;
--select * from tb1,tb2 where tb1.name(+) = tb2.name;

--			3. full outer join : ���� ���̺� ���� ���� �� , �ٸ��� ���̺��� ������ ���� �ʾƵ� ������ ����
select * from tb1 full outer join tb2 on tb1.name = tb2.name;

--self join ** �򰥸� : �ϳ��� ���̺� ���� �ִ� �÷����� �����ϴ� ������ �ʿ��� ���. 
-- ���� ���� .
-- �� ������Ʈ�� ȸ���� 5���� �ְ�, �����ڰ� 2���� �ִ�. 
-- ȸ���� �̸��� ���� ȸ�� 1~ 5, �������� �̸��� ������1,2 �̴�.
-- ȸ���� ���̵�� ���� member 1~5 , �������� ���̵�� manager1,2 �̴�.
-- ȸ�� 1~3�������� ������ 1�� �����ϰ� / �������� ������ 2�� �����Ѵ�.
create table member(
m_id varchar2(10 char) primary key,
m_name varchar2(10 char) not null,
m_manager varchar2(10char)
);

insert into member values('member1', 'ȸ��1','manager1');
insert into member values('member2', 'ȸ��2','manager1');
insert into member values('member3', 'ȸ��3','manager1');
insert into member values('member4', 'ȸ��4','manager2');
insert into member values('member5', 'ȸ��5','manager2');
insert into member values('manager1', '�ٴ�',null);
insert into member values('manager2', '����',null);

--�� �����ڰ� � ȸ���� �����ϰ� �ִ��� ������ �ۼ��ϼ���


select * from member;
drop table member cascade constraint purge;
���ñ��� S ���°� ������ DML �� ������Ʈ, ����Ʈ ������ DML �� ���� DB�� �ڹ� ���� ����..



------------------------------------------------------------------------------
--��� ��Ʈ�� ������ 30% ���̱�
--Ȩ�÷��� �Ǳ����� ��ǰ ���� 10% ����
--���� ��� ��ǰ 10% ����
--�� ����
--���� ���� ���� ��ǰ �� ����


select * from product;
select * from mart;
select * from tab;
select * from user_sequences;
drop table com cascade constraint purge;
drop sequence com_seq;
drop sequence food_seq;



create table mart (
m_no number(6) primary key,
m_name varchar2(30char) not null,
m_location varchar2(30char)not null,
m_scale number(6)not null,
m_parking number(6) not null
);

create sequence mart_seq;

insert into mart values(mart_seq.nextval,'Ȩ�÷���',	'�Ǳ���',	1000,	500);
insert into mart values(mart_seq.nextval,'Ȩ�÷���',	'������',	500,	300);
insert into mart values(mart_seq.nextval,'�̸�Ʈ',	'������',	800,	800);






create table product(
p_no number(6) primary key,
p_m_no number(6)not null,
p_food varchar2(30char) not null,
p_gram number(5) not null,
p_price number(6) not null,
	constraint fk foreign key(p_m_no)
	references mart(m_no)
	on delete cascade
);

create sequence product_seq;

insert into product values(product_seq.nextval,1,'����',3000,10000);
insert into product values(product_seq.nextval,2,'��',500,5000);
insert into product values(product_seq.nextval,3,'����',2000,5000);



--c - �μ�Ʈ : ���������,��¥ ����ְ� ...
--R - ����Ʈ : ���� ��κ� �ð��� �Ҿ���
--U - ������Ʈ: 
update ���̺��
	set �÷��� = ��, �÷��� = ��, ... �ٲܳ���
	where ����;
	
--D - ����Ʈ :
delete from ���̺��
	where ����;
	-- ��.. ���� ����Ű�� ���� �ȵ��ִ°��? ������ �Խñۿ� �����ؼ� Ż�� ���ѹ��ȴµ� ���� ���ܹ������ �Ǵٸ� ������ ������ ���̵�� �����Ѵٸ� �ָ��� ��Ȳ�̵�
	--�������� ������ ������� ���� ;; 

	
-----------------------------------------------------------------------------------
--���̺��� �������� ���� ������ ��ǻ���� ���� ��¥�� ����ǻ�� ���� ��ȸ
--���� �ֱٿ� ������ ��ǻ���� �̸��� ��ȸ
--3��°�� ������ ����~5��°�� ������ ���� ��ü ���� ��ȸ

drop table com cascade constraint purge;
	
create table com (
c_no number(3) primary key,
c_name varchar2(30char) not null,
c_window varchar2(30char) not null,
c_date date not null,
c_gram number(6,2) not null,
c_cpu varchar2(30char) not null
);

create sequence com_seq;


insert into com values(com_seq.nextval,'���� ��ü','Windows 10 pro',to_date('20220901','YYYYMMDD'),5.12,'i5-1234');
insert into com values(com_seq.nextval,'���� ��ü','Windows 10 pro',to_date('20220823','YYYYMMDD'),5.23,'i7-5678');
insert into com values(com_seq.nextval,'�ʰ�',    'Windows 10 pro',to_date('20220904','YYYYMMDD'),3.22,'i7-1234');

	