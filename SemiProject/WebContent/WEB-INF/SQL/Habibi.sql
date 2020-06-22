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

set define off; -- insert 하기전에 해주세요 ( & 문자에 대한 대체변수 물어보지 않게 하는 거 )

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


insert all
into habibi_product
values ('H001STG','seating','simple leather sofa',115000,195000,14,'white','가죽','w1120 x d425 x h550 mm',1)
into habibi_product
values ('H002STG','seating','vintage chair',62000,80000,8,'navy','체리(cherry) 원목','w400 x d400 x h550 mm',1)
into habibi_product
values ('H003STG','seating','swing chair',53000,94000,5,'light brown','메이플(maple) 원목','w1345 x d750 x h545 mm',1)
into habibi_product
values ('H004STG','seating','elegant mini chair',32000,45000,20,'white','가죽','w400 x d400 x h550 mm',1)
into habibi_product
values ('H005STG','seating','single design chair',34000,57000,14,'baby pink','가죽','w400 x d400 x h550 mm',1)
into habibi_product
values ('H006STG','seating','basic chair',50000,92000,14,'light gray','스틸 & 알루미늄','w400 x d400 x h550 mm',1)
into habibi_product
values ('H007STG','seating','comfy round sofa',60000,73000,14,'white','페브릭','w1345 x d950 x h545 mm',1)
into habibi_product
values ('H008STG','seating','modern sofa',150000,210000,3,'red orange','페브릭','w1120 x d425 x h550 mm',1)
into habibi_product
values ('H009STG','seating','simple chair',56000,90000,20,'deep yellow','스틸 & 알루미늄','w400 x d400 x h550 mm',1)
into habibi_product
values ('H010STG','seating','vintage chair',37000,84000,2,'muddy pink','페브릭','w400 x d400 x h550 mm',1)
into habibi_product
values ('H011STG','seating','swedish chair',58000,73000,14,'white','스틸 & 알루미늄','w400 x d400 x h550 mm',1)
into habibi_product
values ('H012STG','seating','premium chair',47000,90000,8,'black','가죽','w400 x d400 x h550 mm',1)
into habibi_product
values ('H013STG','seating','european chair',90000,130000,5,'white','오크(oak) 원목','w400 x d400 x h550 mm',1)
into habibi_product
values ('H014STG','seating','basic sofa',78000,125000,20,'gray','페브릭','w1120 x d425 x h550mm',1)
into habibi_product
values ('H015STG','seating','modern outdoor bench',85000,95000,14,'dark gray','스틸 & 알루미늄','w1120 x d425 x h550 mm',1)
into habibi_product
values ('H016STG','seating','simple design chair',30000,45000,14,'orange','플라스틱 & 알루미늄','w400 x d400 x h550 mm',1)
into habibi_product
values ('H017STG','seating','garden bench',56000,73000,14,'maple brown','월넛(walnut) 원목','w1120 x d425 x h550 mm',1)
into habibi_product
values ('H018STG','seating','standard chair',40000,65000,3,'white','플라스틱 & 알루미늄','w400 x d400 x h550 mm',1)
into habibi_product
values ('H019STG','seating','vintage bench',120000,160000,20,'light pink','메이플(maple) 원목','w1120 x d425 x h450 mm',1)
into habibi_product
values ('H020STG','seating','unique design chair',70000,95000,2,'red','플라스틱 & 알루미늄','w412 x d400 x h580 mm',1)
select * from dual;


insert all
into habibi_product
values ('H001TBL','table','modern side table',33000,52000,14,'white','스틸 & 알루미늄','w350 x d350 x h650 mm',1)
into habibi_product
values ('H002TBL','table','simple side table',62000,80000,8,'white','체리(cherry) 원목','w350 x d350 x h650 mm',1)
into habibi_product
values ('H003TBL','table','vintage side table',53000,75000,5,'gray','콘크리트','w350 x d350 x h650 mm',1)
into habibi_product
values ('H004TBL','table','elegant side table',32000,65000,20,'maple brown','오크(oak) 원목','w350 x d350 x h650 mm',1)
into habibi_product
values ('H005TBL','table','simple basic table',34000,50000,14,'white','플라스틱 & 알루미늄','w1150 x d480 x h770 mm',1)
into habibi_product
values ('H006TBL','table','modern glass table',50000,92000,14,'black','유리 & 알루미늄','w1150 x d480 x h325 mm',1)
into habibi_product
values ('H007TBL','table','wooden table',110000,170000,14,'light brown','메이플(maple) 원목','w1345 x d950 x h845 mm',1)
into habibi_product
values ('H008TBL','table','design side table',50000,85000,3,'gold brown','스틸 & 알루미늄','w350 x d350 x h650 mm',1)
into habibi_product
values ('H009TBL','table','simple mini table',76000,105000,20,'light brown','메이플(maple) 원목','w400 x d400 x h550 mm',1)
into habibi_product
values ('H010TBL','table','premium table',37000,84000,2,'oak brown','월넛(walnut) 원목','w1150 x d480 x h325 mm',1)
into habibi_product
values ('H011TBL','table','swedish table',58000,73000,14,'maple brown','메이플(maple) 원목','w1150 x d480 x h650 mm',1)
into habibi_product
values ('H012TBL','table','mini round table',27000,40000,8,'light brown','메이플(maple) 원목','w400 x d400 x h550 mm',1)
into habibi_product
values ('H013TBL','table','simple round table',90000,130000,5,'light brown','오크(oak) 원목','w650 x d650 x h750 mm',1)
into habibi_product
values ('H014TBL','table','standard table',78000,165000,20,'white','플라스틱 & 알루미늄','w550 x d400 x h600 mm',1)
into habibi_product
values ('H015TBL','table','modern table',85000,144000,14,'white','스틸 & 알루미늄','w1420 x d525 x h750 mm',1)
into habibi_product
values ('H016TBL','table','basic round table',30000,55000,14,'white','플라스틱 & 알루미늄','w400 x d400 x h550 mm',1)
into habibi_product
values ('H017TBL','table','european table',56000,93000,14,'maple brown','월넛(walnut) 원목','w1120 x d425 x h750 mm',1)
into habibi_product
values ('H018TBL','table','wooden design table',40000,65000,3,'light brown','월넛(walnut) 원목','w400 x d400 x h250 mm',1)
into habibi_product
values ('H019TBL','table','vintage mini table',40000,80000,20,'oak brown','오크(oak) 원목','w550 x d550 x h750 mm',1)
into habibi_product
values ('H020TBL','table','premium design table',150000,230000,2,'oak brown','오크(oak) 원목','w1300 x d600 x h750 mm',1)
select * from dual;

insert all
into habibi_product
values ('H001STR','storage','modern wall shelf',33000,45000,14,'cherry brown','체리(cherry) 원목','w280 x d65 x h250 mm',1)
into habibi_product
values ('H002STR','storage','vintage storage',62000,95000,8,'light gray','스틸 & 체리(cherry) 원목','w750 x d350 x h650 mm',1)
into habibi_product
values ('H003STR','storage','simple black shelf',53000,75000,5,'black','스틸 & 알루미늄','w550 x d250 x h1250 mm',1)
into habibi_product
values ('H004STR','storage','basic white storage',92000,120000,20,'white','파티클보드 & 아크릴 페인트','w750 x d350 x h650 mm',1)
into habibi_product
values ('H005STR','storage','wooden wall shelf',34000,55000,14,'oak brown','오크(oak) 원목','w280 x d65 x h250 mm',1)
into habibi_product
values ('H006STR','storage','modern storage',50000,92000,14,'walnut brown','월넛(walnut) 원목','w750 x d350 x h650 mm',1)
into habibi_product
values ('H007STR','storage','wooden mini storage',50000,80000,14,'maple brown','메이플(maple) 원목','w1345 x d950 x h845 mm',1)
into habibi_product
values ('H008STR','storage','simple white storage',50000,75000,3,'white','파티클보드 & 아크릴 페인트','w350 x d350 x h700 mm',1)
into habibi_product
values ('H009STR','storage','standard steel storage',76000,105000,20,'gray','스틸 & 알루미늄','w420 x d400 x h1550 mm',1)
into habibi_product
values ('H010STR','storage','premium storage',110000,170000,2,'dark brown','월넛(walnut) 원목','w750 x d350 x h650 mm',1)
into habibi_product
values ('H011STR','storage','swedish storage',98000,133000,14,'cherry brown','체리(cherry) 원목','w750 x d350 x h650 mm',1)
into habibi_product
values ('H012STR','storage','glass door storage',57000,90000,8,'white','파티클보드 & 아크릴 페인트','w520 x d400 x h1550 mm',1)
into habibi_product
values ('H013STR','storage','vintage storage',120000,180000,5,'dark brown','오크(oak) 원목','w520 x d400 x h1550 mm',1)
into habibi_product
values ('H014STR','storage','european storage',88000,115000,20,'white','파티클보드 & 오크(oak) 원목','w750 x d350 x h650 mm',1)
into habibi_product
values ('H015STR','storage','simple wall shelf',25000,44000,14,'maple brown','메이플(maple) 원목','w280 x d65 x h250 mm',1)
into habibi_product
values ('H016STR','storage','string design shelf',60000,85000,14,'oak brown','월넛(walnut) 원목','w550 x d250 x h1250 mm',1)
into habibi_product
values ('H017STR','storage','modern steel storage',56000,93000,14,'gray','스틸 & 알루미늄','w1345 x d950 x h845 mm',1)
into habibi_product
values ('H018STR','storage','unique glass storage',90000,145000,3,'beige','파티클보드 & 알루미늄','w325 x d325 x h500 mm',1)
into habibi_product
values ('H019STR','storage','standard wall shelf',150000,210000,20,'maple brown','메이플(maple) 원목','w1560 x d350 x h1780 mm',1)
into habibi_product
values ('H020STR','storage','premium basic storage',100000,160000,2,'oak brown','오크(oak) 원목','w750 x d350 x h650 mm',1)
select * from dual;


commit;

select *
from habibi_product;




-- drop table habibi_cart;

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


-- 주문 테이블
drop table habibi_order;
create table habibi_order
(order_code number(7)
,fk_userid varchar2(50) not null    -- 아이디
,fk_prod_code varchar2(20) not null -- 상품코드
,fk_prod_name varchar2(30) not null -- 상품명
,fk_name varchar2(20)               -- 주문자명
,order_num number(5) not null       -- 주문수량
,order_address varchar2(100)        -- 주소
,order_ship number(1) default 0     -- 배송상태
,order_memo varchar2(200)           -- 배송메모
,order_refund number(1) default 0   -- 반품/환불/취소 요청
,order_date date default sysdate    -- 주문일자
,order_mobile varchar2(11)          -- 연락처
,order_price number(10)             -- 구매가격
,constraint PK_habibi_order primary key(order_code)
,constraint FK_habibi_order_userid foreign key(fk_userid) references habibi_member(userid)
,constraint FK_habibi_order_code foreign key(fk_prod_code) references habibi_product(prod_code)
,constraint FK_habibi_order_prod_name foreign key(fk_prod_name) references habibi_product(prod_name)
,constraint FK_habibi_order_name foreign key(fk_name) references habibi_member(name)
);

insert into habibi_order (order_code,fk_userid, fk_prod_code,fk_prod_name,fk_name,
order_num,order_address,order_memo,order_mobile,order_price)
values (1234567,'admin','H001SLP','침대1','관리자',1,'서울 중구 남대문로 120 대일빌딩3층','부재시 경비실에 보관해주세요','01012345678',500000);

commit;

select *
from habibi_order;


