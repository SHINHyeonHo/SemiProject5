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

create sequence seq_habibi_memno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

drop table habibi_member purge;

insert into habibi_member(idx, userid, passwd, name, email, postcode, address1, address2, mobile1, mobile2, mobile3, is_sms, is_email)
values(seq_habibi_memno.nextval, 'admin','qwer1234$','관리자','kwonsk8@gmail.com','04540','서울 중구 남대문로 120','대일빌딩3층','010','2872','3091','1','1');

commit;

select *
from habibi_member;

String sql = "select userid\n"+
"from habibi_member\n"+
"where userid = 'Youks';";


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













------------------------------ 현민이형---------------------------------------------


drop table habibi_cart;

create table habibi_cart
(cart_num          number(10) not null     -- 장바구니 번호
,fk_userid    varchar2(50) not null   -- 회원 아이디
,fk_prod_code      varchar2(20) not null   -- 상품/이미지 코드
,fk_prod_name      varchar2(30) not null   -- 상품명
,cart_stock        number(3) default 1     -- 주문수량
,cart_date         date default sysdate    -- 담은날짜
,cart_price        number(10) not null     -- 상품가격
,constraint FK_habibi_cart_userid foreign key(fk_userid)
                                references habibi_member(userid)
,constraint FK_habibi_cart_code foreign key(fk_prod_code)
                                references habibi_product(prod_code)
,constraint FK_habibi_cart_name foreign key(fk_prod_name)
                                references habibi_product(prod_name)   
);

insert into habibi_cart (cart_num,fk_userid,fk_prod_code,fk_prod_name,cart_price)
values (1,'admin','H001SLP','침대1',500000);

commit;

select cart_num,fk_userid,fk_prod_code,fk_prod_name,cart_stock,cart_date,cart_price
from habibi_cart
where fk_userid = 'admin';
-----------------------------------------------------------------------------------------



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

select *
from habibi_product;

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



insert all
into habibi_product
values ('H001LTG','lighting','led smart lighting',23000,33000,14,'gray', '니켈 도금 스틸','w110 x h35 mm',1)
into habibi_product
values ('H002LTG','lighting','modern track lighting',27000,40000,8,'black','도색 플라스틱','w180 x h35 mm',1)
into habibi_product
values ('H003LTG','lighting','premium side lighting',24000,35000,5,'rose gold','도금 황동','w150 x h350 mm',1)
into habibi_product
values ('H004LTG','lighting','simple white lighting',32000,45000,20,'white','스틸 & 실리콘','w310 x h550 mm',1)
into habibi_product
values ('H005LTG','lighting','vintage ceil lighting',20000,29000,14,'beige','스틸 & 페브릭','w360 x h750 mm',1)
into habibi_product
values ('H006LTG','lighting','european lighting',20000,32000,14,'gray','스틸 & 알루미늄','w210 x h660 mm',1)
into habibi_product
values ('H007LTG','lighting','led basic lighting',15000,23000,14,'light gray','도색 플라스틱','w360 x h500 mm',1)
into habibi_product
values ('H008LTG','lighting','string lighting',12000,19000,3,'random','니켈 도금 스틸','w350 x h450 mm',1)
into habibi_product
values ('H009LTG','lighting','vintage lighting',70000,120000,20,'vintage gold','스틸 & 알루미늄','w480 x h750 mm',1)
into habibi_product
values ('H010LTG','lighting','tall floor lighting',17000,29000,2,'golden yellow','도금 황동','w250 x h750 mm',1)
into habibi_product
values ('H011LTG','lighting','golden ceil lighting',15000,23000,14,'gold','니켈 도금 스틸','w300 x h450 mm',1)
into habibi_product
values ('H012LTG','lighting','mood lighting',27000,34000,8,'white','도색 플라스틱','w480 x h750 mm',1)
into habibi_product
values ('H013LTG','lighting','pineapple lighting',24000,31000,5,'beige','도금 황동','w350 x h850 mm',1)
into habibi_product
values ('H014LTG','lighting','tall floor lighting',32000,45000,20,'orange','스틸 & 실리콘','w300 x h1250 mm',1)
into habibi_product
values ('H015LTG','lighting','modern ceil lighting',60000,90000,14,'white','스틸 & 페브릭','w170 x h720 mm',1)
into habibi_product
values ('H016LTG','lighting','european lighting',20000,32000,14,'yellow','스틸 & 알루미늄','w710 x h790 mm',1)
into habibi_product
values ('H017LTG','lighting','simple basic lighting',15000,23000,14,'dark gray','도색 플라스틱','w490 x h500 mm',1)
into habibi_product
values ('H018LTG','lighting','designed lighting',12000,19000,3,'gray','니켈 도금 스틸','w580 x h350 mm',1)
into habibi_product
values ('H019LTG','lighting','bended tall lighting',14000,25000,20,'silver','스틸 & 알루미늄','w410 x h1700 mm',1)
into habibi_product
values ('H020LTG','lighting','elegant lighting',40000,65000,2,'beige','도금 황동','w350 x h750 mm',1)
select * from dual;


commit;
