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

--2000 원 이하의 과자중 최소가격이 얼마인지
select min(s_price) from snack1 where s_price <= 2000;
--모든 과자의 평균가격
select avg(s_price) from snack1;
--과자의 이름과 가격의 30% 할인된 금액
select s_name , s_price*0.7 from snack1;
--3500원인 과자의 개수는 몇개?
select count(s_name) from snack1 where s_price = 3500;
--3000원 이하인 과자의 이름,회사이름
select s_name, s_maker from snack1 where s_price <=3000;
--모든 과자 이름, 가격, 유통기한 조회
select s_name,s_price,s_date from snack1;
--모든 과자 이름, 가격, 부가세 조회 10%
select s_name , s_price, s_price*0.1 from snack1;
--모든 과자 이름, 가격, 판매가 조회 20%할인
select s_name, s_price, s_price*0.8 from snack1;
--3000원 보다 큰 금액의 과자들의 평균가 조회
select avg(s_price) from snack1 where s_price >3000;
--최고가,최저가,총 과자 종류 몇가지인지 조회
select max(s_price), min(s_price),count(s_name) from snack1 
--3000원 이상인 과자의 전체 정보 조회
select * from snack1 where s_price >=3000;
--3000원 미만인 과자의 이름, 가격, 판매가 조회 20% 할인
select s_name , s_price , s_price*0.8 from snack1 where s_price < 3000;
--허니버터칩의 가격 조회
select s_price from snack1 where s_name like'%스니%';
--크라운 회사의 과자 가격 총합 조회
select sum(s_price) from snack1 where s_maker = '크라운';
--9월 안으로 먹어야 하는 과자 이름, 가격, 유통기한 조회
select s_name, s_price , s_date from snack1 where s_date < to_date('20221001','YYYYMMDD');
--'해'가 들어가는 회사에서 만든 과자의 이름 조회
select s_name from snack1 where s_maker like'%해%';
--'이' 가들어가는 과자들 평균가 조회
select avg(s_price) from snack1 where s_name like '%이%';
--크라운과자거나,몽쉘~인거 이름,제조회사,가격 조회
select s_name , s_maker , s_price from snack1 where s_maker in '크라운' or s_name like '%몽쉘%';
--과자의 이름이 '새콤달콤'으로 시작하거나 '이' 로 끝나는 과자의 이름,제조사 ,가격 조회 
select s_price , s_maker , s_name from snack1 where s_name = '새콤달콤' or s_name like '%이';
--과자 데이터 중에서 회사가 크라운이고 가격이 1000원 이하이거나 3000원 이상인 과자 전체정보 조회
select * from snack1 where s_maker='크라운' and (s_price <=1000 or s_price >=3000);
--롯데 또는 해태 회사의 과자 평균 가격이 1800 원 이상일 때 각 회사의 평균 가격 내림차 순 정렬
select s_maker,avg(s_price) from snack1 group by s_maker having s_maker = '롯데' or s_maker ='해태' and avg(s_price)>=1800 order by avg(s_price)desc;
--회사별로 그룹을 지어서 과자 평균가격, 최소가격, 최고가격 을 알고싶을때
select avg(s_price), min(s_price), max (s_price) from SNACK1 group by s_maker;
--회사 이름, 회사별 과자 총 가격 합계와 모든 과자들의 합계
--회사별로 과자 평균 가격이 2000원 이상인 회사의 이름과 과자 평균 가격을 조회.


create table snack1 (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence snack1_seq;

insert into snack1 values(snack1_seq.nextval,'스니커즈','오리온',2000,sysdate);
insert into snack1 values(snack1_seq.nextval,'오감자','롯데',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'조지아','코카콜라',500,sysdate);
insert into snack1 values(snack1_seq.nextval,'목캔디','롯데',3500,sysdate);
insert into snack1 values(snack1_seq.nextval,'쿠앤쿠','오리온',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'몽쉘통통','해태',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'오징어땅콩','크라운',2000,sysdate);
insert into snack1 values(snack1_seq.nextval,'이클립스','크라운',4000,sysdate);
insert into snack1 values(snack1_seq.nextval,'새콤달콤','크라운',3000,sysdate);
insert into snack1 values(snack1_seq.nextval,'오땅','해태',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'바게트','크라운',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'커피사탕','해태',5000,sysdate);
insert into snack1 values(snack1_seq.nextval,'치즈케이크','오리온',4500,sysdate);
insert into snack1 values(snack1_seq.nextval,'족발','해태',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'불고기버거','롯데',3000,sysdate);


------------------------------------------------------------------------------------------


1.서브쿼리문 기초...snack 테이블만 이용하여 서브쿼리 작성

--과자들 중 최고가
--제일비싼 과자이름,제조사,가격
--제일 싼 과자는 어디에서 만드나요
--평균가보다 비싼 과자는 몇 종류?
--유통기한이 가장 오래남은 과자의 전체정보.

create table snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence snack_seq;

insert into snack values(snack_seq.nextval,'스니커즈','오리온',2000,sysdate);
insert into snack values(snack_seq.nextval,'오감자','롯데',2500,sysdate);
insert into snack values(snack_seq.nextval,'조지아','코카콜라',500,sysdate);
insert into snack values(snack_seq.nextval,'목캔디','롯데',3500,sysdate);
insert into snack values(snack_seq.nextval,'쿠앤쿠','오리온',1500,sysdate);
insert into snack values(snack_seq.nextval,'몽쉘통통','해태',1500,sysdate);
insert into snack values(snack_seq.nextval,'오징어땅콩','크라운',1500,sysdate);
insert into snack values(snack_seq.nextval,'이클립스','크라운',1500,sysdate);
insert into snack values(snack_seq.nextval,'새콤달콤','크라운',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'오땅','해태',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'바게트','크라운',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'커피사탕','해태',5000,sysdate);
insert into snack1 values(snack1_seq.nextval,'치즈케이크','오리온',4500,sysdate);
insert into snack1 values(snack1_seq.nextval,'족발','해태',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'불고기버거','롯데',3000,sysdate);

------------------------------------------------------------------------
--직원 수 제일 적은 회사에서 만드는 과자이름, 가격
--제일 비싼 과자를 만드는 회사는 어디에 있는지
--부천에 있는 회사에서 만드는 과자의 평균가
--평균가 이상의 과자를 만드는 회사의 이름,위치 --error : single-row subquery 어쩌고 저쩌고 in 사용해서 해결

create table maker (
m_name varchar(20 char) primary key,
m_address varchar(30 char) not null,
m_staff number(3)not null
);

insert into maker values('오리온','화성',56);
insert into maker values('롯데','일본',20);
insert into maker values('코카콜라','미국',500);
insert into maker values('크라운','호주',450);
insert into maker values('해태','대한민국',980);

select * from maker;
----------------------------------------------------------------------------------

-- 평균가보다 비싼 음료는 몇 종류 인지
-- 제일 싼 음료를 파는 카페의 이름은
-- 서울에 있는 카페에서 만드는 음료 평균가격은
-- 좌석이 90석 이상인 카페에서 파는 음료의 이름은
-- 평균가 이하인 음료의 이름
-- 가장 비싼 음료를 파는 카페는 어디에 있는지


create table drink (
d_name varchar2(30 char) primary key,
d_price number(8) not null,
d_cafe varchar2(30 char) not null
);
insert into drink values('아메리카노',2000,'a');
insert into drink values('라떼',3000,'a');
insert into drink values('녹차',2500,'a');
insert into drink values('홍차',2500,'b');
insert into drink values('스무디',3000,'b');
insert into drink values('에스프레소',4000,'b');

create table cafe (
c_name varchar2(30 char) primary key,
c_location varchar2(30 char) not null,
c_seat number(4) not null
);

select round(avg(d_price))from drink;
drop table cafe cascade constraint purge;
insert into cafe values('a','서울',100);
insert into cafe values('b','판교',80);
---------------------------------------------------------------------------------------



--좌석 수 제일 많은 식당 운영하는 사람의 전체정보 조회
--프렌차이즈 메뉴 전체의 이름, 가격을 가격 오름차순 가격이 같다면 메뉴명을 가나다 역순 정렬 (정렬을 여러번하고 싶을때는 oredr by 컬럼명 asc/desc , 연결)
--전체 사장님들 이름,생일 조회
--프랜차이즈 식당 몇 개?
--프랜차이즈 메뉴 전체의 평균가
--제일 비싼 메뉴 이름, 가격
--최연장자 사장님의 이름 ,생일
--좌석 수가 제일 적은 식당의 이름 ,지점의 지역,좌석수
--홍콩반점 판교점 운영하는 사람의 이름,생일
--자장이 들어간 음식은 어디가면 먹을 수 있나요
--최연소 사장님네 가게 메뉴 이름,가격
----------------------------조인 활용---------------------------------------------------
-- 전체 식당 이름,지점명,사장님 이름, 사장님생일
-- 전체 메뉴명, 가격, 식당이름, 지점명
-- 좌석수 가 50개 이상인 식당의 메뉴명,가격,식당이름,지점명,좌석수
-- 규모가 제일 큰 식당의 메뉴명, 가격, 식당이름, 지점명, 좌석수
-- 최연장자 사장님네 전체 메뉴명, 가격, 식당이름, 지점명 ,사장님이름, 생일을 메뉴명 - 가나다순, 식당이름- 가나다순.
----------------------------로우넘 --------------------------------
메뉴테이블에 m_no (sequence 처리된 치명적인 단점이 있어서  보완작업 후 사용)
--메뉴 이름을 가나다 순으로 정렬해서 메뉴 전체 정보를 조회해보자.
--2~4 까지 메뉴테이블 정보를 메뉴명으로 가나다 순
--길동 이름을 가진 사장님네 메뉴명,가격,식당명,지점명,사장님이름 가격 은 내림차순 가격이 같다면 메뉴명은 가나다순 3~8번째 까지 조회.
--김씨 성을 가진 사장님네 메뉴명,가격,사장님이름,사장님 성별 을 가격이 오름차순으로 정렬을해서 2~3번까지만 



create table store (
f_no number(3)primary key,
f_name varchar2 (30char) not null,
f_location varchar2 (30char)not null,
f_ceo number(3) not null,
f_seat number(5) not null
);
create sequence store_seq;


insert into store values(store_seq.nextval,'홍콩반점','판교',1,100);
insert into store values(store_seq.nextval,'홍콩반점','종로',2,80);
insert into store values(store_seq.nextval,'한신포차','강남',3,150);
insert into store values(store_seq.nextval,'부천포차','부천',4,130);



create table ceo (
c_no number(3) primary key,
c_name varchar2(30char) not null,
c_birthday date not null,
c_gender varchar2 (10char) not null
);

create sequence ceo_seq;


insert into ceo values(ceo_seq.nextval,'홍길동',to_date('1990-03-01','YYYY-MM-DD'),'남자');
insert into ceo values(ceo_seq.nextval,'김길동',to_date('1992-02-01','YYYY-MM-DD'),'여자');
insert into ceo values(ceo_seq.nextval,'홍길동',to_date('1991-12-12','YYYY-MM-DD'),'여자');
insert into ceo values(ceo_seq.nextval,'최길동',to_date('1989-09-01','YYYY-MM-DD'),'남자');


create table menu(
m_no number (3) primary key,
m_name varchar2(20char) not null,
m_price number(6) not null,
m_f_no number(3) not null
);

create sequence menu_seq;

insert into menu values(menu_seq.nextval,'자장면',4000,1);
insert into menu values(menu_seq.nextval,'짬뽕',5500,1);
insert into menu values(menu_seq.nextval,'물만두',3000,1);
insert into menu values(menu_seq.nextval,'돼지고기',2300,2);
insert into menu values(menu_seq.nextval,'김치찌개',6000,2);
insert into menu values(menu_seq.nextval,'햄버고',4500,2);
insert into menu values(menu_seq.nextval,'필로폰',8000,3);
insert into menu values(menu_seq.nextval,'마리화나',35000,3);
insert into menu values(menu_seq.nextval,'양귀비',700,3);
insert into menu values(menu_seq.nextval,'코카인',12000,4);
insert into menu values(menu_seq.nextval,'액상',3000,4);
insert into menu values(menu_seq.nextval,'볼펜',500,4);


-------------------------------------------------------

join : 하나의 명령문에 의해 여러 테이블에 저장된 데이터를 한번에 조회할 수 있는 기능.

create table tb1 (name varchar2(10char), age number(3));
insert into tb1 values ('김비버',30);
insert into tb1 values ('박비버',35);
insert into tb1 values ('최비버',40);
insert into tb1 values ('오비버',40);

create table tb2 (name varchar2(10char), age number(3));
insert into tb2 values ('김비버',30);
insert into tb2 values ('정비버',50);
insert into tb2 values ('이비버',55);

--cross join : 별도의 조건 없이 두 테이블 간의 가능한 모든 결과를 조회 (모든 경우의 수) 사실상 안씀;
select * from tb1, tb2;
select * from tb1 cross join tb2;

--inner join : 조건에 해당하는 값만 나옴.
--select * from tb1 inner join tb2 on tb1.name = tb2.name;
select * from tb1 , tb2  where tb1.name = tb2.name;   --equi 조인	: 위에 크로스 조인에 웨얼절 붙혀 조건에맞는값찾는거 ** 이거로외우자;;
--select * from tb1 join tb2 using (name);			--equi 조인2	: 
--select * from tb1 natural join tb2;					--자연조인 	: 조건절 없이 양쪽에 같은 이름을 가진 동일한 컬럼만을 조회

--outer join : 기준이 될 테이블의 데이터가 모두 조회가되고 대상 테이블의 데이터가 있는경우 해당 컬럼의 값을 가져오기 위해서사용
--			1. left outer join : 왼쪽 테이블에 값이 있을 시 오른쪽 테이블이 조건에 맞지 않아도(null)값이 나옴.
select * from tb1 left outer join tb2 on tb1.name = tb2.name;
--select * from tb1 , tb2 where tb1.name = tb2.name(+);
--select * from tb1 a, tb2 b where a.name = b. name(+);  --요로케 변수사용 해서 쌉가능.
--			2. right outer join : 오른쪽 테이블에 값이 있을 시 왼쪽 테이블이 조건에 맞지 않아도(null)값이 나옴. 레프트를 주로 사용함 이거 잘안씀.
--select * from tb1 right outer join tb2 on tb1.name = tb2.name;
--select * from tb1,tb2 where tb1.name(+) = tb2.name;

--			3. full outer join : 한쪽 테이블에 값이 있을 시 , 다른족 테이블이 조건이 맞지 않아도 내용이 나옴
select * from tb1 full outer join tb2 on tb1.name = tb2.name;

--self join ** 헷갈림 : 하나의 테이블 내에 있는 컬럼끼리 연결하는 조인이 필요한 경우. 
-- 예를 들어보자 .
-- 한 웹사이트에 회원이 5명이 있고, 관리자가 2명이 있다. 
-- 회원의 이름은 각각 회원 1~ 5, 관리자의 이름은 관리자1,2 이다.
-- 회원의 아이디는 각각 member 1~5 , 관리자의 아이디는 manager1,2 이다.
-- 회원 1~3번까지는 관리자 1이 관리하고 / 나머지는 관리자 2가 관리한다.
create table member(
m_id varchar2(10 char) primary key,
m_name varchar2(10 char) not null,
m_manager varchar2(10char)
);

insert into member values('member1', '회원1','manager1');
insert into member values('member2', '회원2','manager1');
insert into member values('member3', '회원3','manager1');
insert into member values('member4', '회원4','manager2');
insert into member values('member5', '회원5','manager2');
insert into member values('manager1', '다니',null);
insert into member values('manager2', '세니',null);

--각 관리자가 어떤 회원을 관리하고 있는지 쿼리문 작성하세요


select * from member;
drop table member cascade constraint purge;
오늘까지 S 끝냈고 다음주 DML 중 업데이트, 딜리트 끝나면 DML 끝 이후 DB와 자바 연동 시작..



------------------------------------------------------------------------------
--모든 마트의 주차장 30% 줄이기
--홈플러스 판교점의 상품 가격 10% 할인
--제일 비싼 상품 10% 할인
--무 삭제
--가장 좁은 매장 상품 다 삭제


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

insert into mart values(mart_seq.nextval,'홈플러스',	'판교점',	1000,	500);
insert into mart values(mart_seq.nextval,'홈플러스',	'강남점',	500,	300);
insert into mart values(mart_seq.nextval,'이마트',	'서초점',	800,	800);






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

insert into product values(product_seq.nextval,1,'배추',3000,10000);
insert into product values(product_seq.nextval,2,'무',500,5000);
insert into product values(product_seq.nextval,3,'배추',2000,5000);



--c - 인서트 : 시퀀스사용,날짜 집어넣고 ...
--R - 셀렉트 : 거의 대부분 시간을 할애함
--U - 업데이트: 
update 테이블명
	set 컬럼명 = 값, 컬럼명 = 값, ... 바꿀내용
	where 조건;
	
--D - 딜리트 :
delete from 테이블명
	where 조건;
	-- 음.. 만약 포린키로 설정 안되있는경우? 누군가 게시글에 욕을해서 탈퇴를 시켜버렸는데 글을 남겨버린경우 또다른 누군가 삭제된 아이디로 가입한다면 애매한 상황이됨
	--팀원끼리 상의후 어떻게할지 결정 ;; 

	
-----------------------------------------------------------------------------------
--테이블에서 포맷한지 가장 오래된 컴퓨터의 포맷 날짜와 총컴퓨터 수를 조회
--가장 최근에 포맷한 컴퓨터의 이름을 조회
--3번째로 가벼운 컴터~5번째로 가벼운 컴터 전체 정보 조회

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

	