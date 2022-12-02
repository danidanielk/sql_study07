--모든 마트의 주차장 30% 줄이기
update mart set m_parking = m_parking*0.7;
--홈플러스 판교점의 상품 가격 10% 할인
update product set p_price = p_price *0.9 where p_m_no = (select m_no from mart where m_location = '판교점');
--제일 비싼 상품 10% 할인
update product set p_price = p_price * 0.9 where p_price = (select max(p_price)from product);
--무 삭제
delete from product where p_food = '무';
--가장 좁은 매장 상품 다 삭제
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

insert into mart values(mart_seq.nextval,'홈플러스',	'판교점',	1000,	500);
insert into mart values(mart_seq.nextval,'홈플러스',	'강남점',	500,	300);
insert into mart values(mart_seq.nextval,'이마트',	'서초점',	800,	800);
insert into mart values(mart_seq.nextval,'danimart',	'서초점',	800,	800);





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

insert into product values(product_seq.nextval,1,'배추',3000,10000);
insert into product values(product_seq.nextval,2,'무',500,5000);
insert into product values(product_seq.nextval,3,'배추',2000,5000);
insert into product values(product_seq.nextval,3,'dani',2000,5000);
insert into product values(product_seq.nextval,4,'dani',2000,5000);


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