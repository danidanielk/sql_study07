--��� ��Ʈ�� ������ 30% ���̱�
update mart set m_parking = m_parking*0.7;
--Ȩ�÷��� �Ǳ����� ��ǰ ���� 10% ����
update product set p_price = p_price *0.9 where p_m_no = (select m_no from mart where m_location = '�Ǳ���');
--���� ��� ��ǰ 10% ����
update product set p_price = p_price * 0.9 where p_price = (select max(p_price)from product);
--�� ����
delete from product where p_food = '��';
--���� ���� ���� ��ǰ �� ����
delete from mart where m_scale=(select max(m_scale) from mart);


select * from product;
select * from mart;
select * from tab;
select * from user_sequences;
drop table product cascade constraint purge;
drop sequence product_seq;


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
insert into mart values(mart_seq.nextval,'danimart',	'������',	800,	800);





create table product(
p_no number(6) primary key,
p_m_no number(6)not null,
p_name varchar2(30char) not null,
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
insert into product values(product_seq.nextval,3,'dani',2000,5000);
insert into product values(product_seq.nextval,4,'dani',2000,5000);


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