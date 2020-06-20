show user;

create table habibi_member
(userid             varchar2(50) not null -- 회원아이디(primary key)
,passwd             varchar2(200) not null -- 비밀번호
,name               varchar2(20) not null -- 이름
,email              varchar2(100) not null -- 이메일
,passwd_check_q     varchar2(100) -- 비밀번호 확인 질문
,passwd_check_a     varchar2(200) -- 비밀번호 확인 답변
,postcode           varchar2(5) -- 우편번호
,address1           varchar2(200) -- 주소
,address2           varchar2(200) -- 상세주소
,mobile1            varchar2(3) -- 휴대폰번호1
,mobile2            varchar2(4) -- 휴대폰번호2
,mobile3            varchar2(4) -- 휴대폰번호3
,is_sms             varchar(1) -- sms 수신여부(check)
,is_email           varchar(1) -- email 수신여부(check)
,point              number default 0 -- 적립금
,is_member          varchar(1) default 1 -- 탈퇴여부(check)
,join_date          date default sysdate -- 가입일자
,last_passwd_date   date default sysdate -- 마지막 암호변경날짜
,last_login_date    date default sysdate -- 마지막 로그인날짜
,constraint PK_habibi_member primary key(userid)
,constraint CK_habibi_member_sms check(is_sms in ('0','1'))
,constraint CK_habibi_member_email check(is_email in ('0','1'))
,constraint CK_habibi_member_member check(is_member in ('0','1'))
);

insert into habibi_member(userid,passwd,name,email
,passwd_check_q,passwd_check_a,postcode,address1,address2,mobile1,mobile2,mobile3
,is_sms,is_email)
values('admin','qwer1234$','관리자','kwonsk8@gmail.com','기억에남는추억의장소는?','KH정보교육원'
,'04540','서울 중구 남대문로 120','대일빌딩3층','010','2872','3091','1','1');

commit;

select *
from habibi_member;

-- drop table habibi_product;
create table habibi_product
(prod_code          varchar2(20) not null
,prod_category      varchar2(20) not null
,prod_name         varchar2(30)  not null
,prod_cost          number(10) not null
,prod_price         number(10) not null
,prod_stock         number(3) default 0 not null 
,prod_color         varchar2(20) not null
,prod_mtl           varchar2(50) not null
,prod_size          varchar2(50) not null
,prod_status        number(1) default 1 not null
,constraint PK_habibi_product primary key(prod_code)
,constraint CK_habibi_product_status check(prod_status in (0,1))
);


insert all
into habibi_product
values ('H001SLP','sleeping','single standard bed',150000,230000,14,'white','메이플(maple) 원목','w1166 x d2066 x h350 mm',1)
into habibi_product
values ('H002SLP','sleeping','swedish bed',270000,340000,8,'beige','체리(cherry) 원목','w1866 x d2066 x h350 mm',1)
into habibi_product
values ('H003SLP','sleeping','premium bed',240000,310000,5,'dark brown','오크(oak) 원목','w1566 x d2066 x h350 mm',1)
into habibi_product
values ('H004SLP','sleeping','big head bed',320000,450000,20,'brown','월넛(walnut) 원목','w1166 x d2066 x h350 mm',1)
into habibi_product
values ('H005SLP','sleeping','vintage queen bed',200000,270000,14,'vintage brown','체리(cherry) 원목','w1566 x d2066 x h750 mm',1)
into habibi_product
values ('H006SLP','sleeping','european bed',200000,320000,14,'oak brown','오크(oak) 원목','w1166 x d2088 x h750 mm',1)
into habibi_product
values ('H007SLP','sleeping','over the wall bed',150000,230000,14,'maple brown','월넛(walnut) 원목','w1166 x d2066 x h500 mm',1)
into habibi_product
values ('H008SLP','sleeping','double standard bed',120000,190000,3,'beige','체리(cherry) 원목','w1566 x d2066 x h350 mm',1)
into habibi_product
values ('H009SLP','sleeping','simple flame bed',140000,250000,20,'vintage brown','메이플(maple) 원목','w1866 x d2066 x h350 mm',1)
into habibi_product
values ('H010SLP','sleeping','elegant bed',170000,290000,2,'stone gray','월넛(walnut) 원목','w1566 x d2044 x h750 mm',1)
into habibi_product
values ('H011SLP','sleeping','single standard bed',150000,230000,14,'white','메이플(maple) 원목','w1166 x d2066 x h350 mm',1)
into habibi_product
values ('H012SLP','sleeping','swedish bed',270000,340000,8,'beige','체리(cherry) 원목','w1866 x d2066 x h350 mm',1)
into habibi_product
values ('H013SLP','sleeping','premium bed',240000,310000,5,'dark brown','오크(oak) 원목','w1566 x d2066 x h350 mm',1)
into habibi_product
values ('H014SLP','sleeping','big head bed',320000,450000,20,'brown','월넛(walnut) 원목','w1166 x d2066 x h350 mm',1)
into habibi_product
values ('H015SLP','sleeping','vintage queen bed',200000,270000,14,'vintage brown','체리(cherry) 원목','w1566 x d2066 x h750 mm',1)
into habibi_product
values ('H016SLP','sleeping','european bed',200000,320000,14,'oak brown','오크(oak) 원목','w1166 x d2088 x h750 mm',1)
into habibi_product
values ('H017SLP','sleeping','over the wall bed',150000,230000,14,'maple brown','월넛(walnut) 원목','w1166 x d2066 x h500 mm',1)
into habibi_product
values ('H018SLP','sleeping','double standard bed',120000,190000,3,'beige','체리(cherry) 원목','w1566 x d2066 x h350 mm',1)
into habibi_product
values ('H019SLP','sleeping','simple flame bed',140000,250000,20,'vintage brown','메이플(maple) 원목','w1866 x d2066 x h350 mm',1)
into habibi_product
values ('H020SLP','sleeping','elegant bed',170000,290000,2,'stone gray','월넛(walnut) 원목','w1566 x d2044 x h750 mm',1)
select * from dual;

commit;

select *
from habibi_product;

drop table habibi_cart;
create table habibi_cart
(cart_num          number(10) not null     -- 장바구니 번호
,fk_userid    varchar2(50) not null   -- 회원 아이디
,fk_prod_code      varchar2(20) not null   -- 상품/이미지 코드
,fk_prod_name      varchar2(30) not null   -- 상품명
,fk_prod_stock        number(3) default 1     -- 주문수량
,cart_date         date default sysdate    -- 담은날짜
,fk_prod_price        number(10) not null     -- 상품가격
,constraint FK_habibi_cart_userid foreign key(fk_userid)
                                references habibi_member(userid)
,constraint FK_habibi_cart_code foreign key(fk_prod_code)
                                references habibi_product(prod_code)
,constraint FK_habibi_cart_name foreign key(fk_prod_name)
                                references habibi_product(prod_name)   
);

commit;
