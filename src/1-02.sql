1. dhfkzmfdlql 서버에 다음 데이터를 표현할 수 있는 db 자료구조를 만드는 sql 문을 작성 해주세요
	-컴퓨터이름	:	돼지본체
	-운영체제		:	windows 10 pro
	-포맷날짜		:	2022-09-01
	-무게			:	5.12kg
	-cpu		:	i5-1234
	
	-컴퓨터이름	:	돼지본체
	-운영체제		:	windows 10 pro
	-포맷날짜		:	2022-08-23
	-무게			:	5.23kg
	-cpu		:	i7-5678
	
	-컴퓨터이름	:	탱고
	-운영체제		:	windows 10 pro
	-포맷날짜		:	2022-09-04
	-무게			:	3.22kg
	-cpu		:	i7-1234

2. 인서트 하시오
3.테이블에서 포맷한지 가장 오래된 컴퓨터의 포맷 날짜와 총컴퓨터 수를 조회
4.가장 최근에 포맷한 컴퓨터의 이름을 조회
5.3번째로 가벼운 컴터~5번째로 가벼운 컴터 전체 정보 조회

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


insert into com values(com_seq.nextval,'돼지 본체','Windows 10 pro',to_date('20220901','YYYYMMDD'),5.12,'i5-1234');
insert into com values(com_seq.nextval,'돼지 본체','Windows 10 pro',to_date('20220823','YYYYMMDD'),5.23,'i7-5678');
insert into com values(com_seq.nextval,'탱고',    'Windows 10 pro',to_date('20220904','YYYYMMDD'),3.22,'i7-1234');

select c_date ,count(c_name) from com where c_date = (select min(c_date)from com);
select min(c_date) , count(c_name) from com;


select c_name from com where c_date (select max(c_date)from com);
select c_name from com where c_date=(select max(c_date) from com);


select * from(select rownum rn ,c_no,c_name,c_window,c_date ,c_gram,c_cpu from (select * from com order by c_gram where c_gram =(select min(c_gram)from com))where rn between 3 and 5 ;

select * from (select rownum rn,c_no,c_name,c_window,c_date,c_gram,c_cpu  from (select * from com order by c_gram))where rn between 3 and 5;




