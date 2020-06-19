show user;

create table habibi_member
(idx                number(10)   not null -- 회원번호(시퀀스)
,userid             varchar2(50) not null -- 회원아이디(primary key)
,passwd             varchar2(200) not null -- 비밀번호
,name               varchar2(20) not null -- 이름
,email              varchar2(100) not null -- 이메일
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

drop table habibi_member purge;

insert into habibi_member(userid,passwd,name,email
,passwd_check_q,passwd_check_a,postcode,address1,address2,mobile1,mobile2,mobile3
,is_sms,is_email)
values('admin','qwer1234$','관리자','kwonsk8@gmail.com','기억에남는추억의장소는?','KH정보교육원'
,'04540','서울 중구 남대문로 120','대일빌딩3층','010','2872','3091','1','1');

commit;

select *
from habibi_member;


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
,constraint UQ_habibi_product_name unique(prod_name)
);

insert into habibi_product 
values ('H001SLP','sleeping','침대1',200000,500000,14,'brown','wood','100X180',1);

commit;

select *
from habibi_product;

drop table habibi_cart;
create table habibi_cart
(cart_num          number(10) not null     -- 장바구니 번호
,fk_cart_userid    varchar2(50) not null   -- 회원 아이디
,fk_cart_code      varchar2(20) not null   -- 상품/이미지 코드
,fk_cart_name      varchar2(30) not null   -- 상품명
,cart_stock        number(3) default 1     -- 주문수량
,cart_date         date default sysdate    -- 담은날짜
,cart_price        number(10) not null     -- 상품가격
,constraint FK_habibi_cart_userid foreign key(fk_cart_userid)
                                references habibi_member(userid)
,constraint FK_habibi_cart_code foreign key(fk_cart_code)
                                references habibi_product(prod_code)
,constraint FK_habibi_cart_name foreign key(fk_cart_name)
                                references habibi_product(prod_name)   
);

insert into habibi_cart (cart_num,fk_cart_userid,fk_cart_code,fk_cart_name,cart_price)
values (1,'admin','H001SLP','침대1',500000);

commit;

select *
from habibi_cart
where fk_cart_userid = 'admin';