1. dhfkzmfdlql ������ ���� �����͸� ǥ���� �� �ִ� db �ڷᱸ���� ����� sql ���� �ۼ� ���ּ���
	-��ǻ���̸�	:	������ü
	-�ü��		:	windows 10 pro
	-���˳�¥		:	2022-09-01
	-����			:	5.12kg
	-cpu		:	i5-1234
	
	-��ǻ���̸�	:	������ü
	-�ü��		:	windows 10 pro
	-���˳�¥		:	2022-08-23
	-����			:	5.23kg
	-cpu		:	i7-5678
	
	-��ǻ���̸�	:	�ʰ�
	-�ü��		:	windows 10 pro
	-���˳�¥		:	2022-09-04
	-����			:	3.22kg
	-cpu		:	i7-1234

2. �μ�Ʈ �Ͻÿ�
3.���̺��� �������� ���� ������ ��ǻ���� ���� ��¥�� ����ǻ�� ���� ��ȸ
4.���� �ֱٿ� ������ ��ǻ���� �̸��� ��ȸ
5.3��°�� ������ ����~5��°�� ������ ���� ��ü ���� ��ȸ

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

select c_date ,count(c_name) from com where c_date = (select min(c_date)from com);
select min(c_date) , count(c_name) from com;


select c_name from com where c_date (select max(c_date)from com);
select c_name from com where c_date=(select max(c_date) from com);


select * from(select rownum rn ,c_no,c_name,c_window,c_date ,c_gram,c_cpu from (select * from com order by c_gram where c_gram =(select min(c_gram)from com))where rn between 3 and 5 ;

select * from (select rownum rn,c_no,c_name,c_window,c_date,c_gram,c_cpu  from (select * from com order by c_gram))where rn between 3 and 5;




