-- **** HABIBI  DB ****

-- 테이블 삭제
drop table [테이블명] purge;

-- 전체 테이블 조회
select *
from tabs;

-- 시퀀스 삭제
drop sequence [시퀀스명];

-- 전체 시퀀스 조회
select *
from user_sequences;


------------------------------------------------------------------------------------------------------------------------------
----------------------------------                        Member             -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------


-->>  Member
--** 회원 테이블 생성
drop table habibi_member Cascade Constraints;
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
,mobile2            varchar2(100) -- 휴대폰번호2
,mobile3            varchar2(100) -- 휴대폰번호3
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

--** 하비비 회원 테이블 idx 시퀀스 생성
drop sequence seq_habibi_memno;
create sequence seq_habibi_memno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 관리자 정보 추가
insert into habibi_member(idx, userid, passwd, name, email, postcode, address1, address2, mobile1, mobile2, mobile3, is_sms, is_email)
values(seq_habibi_memno.nextval, 'admin','qwer1234$','관리자','kwonsk8@gmail.com','04540','서울 중구 남대문로 120','대일빌딩3층','010','2872','3091','1','1');

commit;

-- 조회
select *
from habibi_member;

-- 회원 정보 수정
update habibi_member set passwd='9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382' where userid = 'Shine';


------------------------------------------------------------------------------------------------------------------------------
----------------------------------                       product             -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

drop table habibi_product cascade constraint;
-->> Product
** 상품 테이블 생성
create table habibi_product
(prod_code          varchar2(20) not null
,prod_category      varchar2(20) not null
,prod_name         varchar2(30)  not null
-- ,prod_cost          number(10) not null
,prod_price         number(10) not null
,prod_stock         number(3) default 0 not null
,prod_color         varchar2(20) not null
,prod_mtl           varchar2(50) not null
,prod_size          varchar2(50) not null
,prod_status        number(1) default 1 not null
,prod_insert_date   date default sysdate not null
,constraint PK_habibi_product primary key(prod_code)
,constraint CK_habibi_product_status check(prod_status in (0,1))
);

select *
from habibi_product;


create or replace view view_habibi_product
as
( select prod_code, prod_category, prod_name, prod_price*0.7 as prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, prod_status ,prod_insert_date
    from habibi_product
);




-- insert 하기전에 해주세요 ( & 문자에 대한 대체변수 물어보지 않게 하는 거 )
set define off;

-- 상품 추가
insert all
into habibi_product
values ('H001SLP','sleeping','single standard bed',230000,14,'white','메이플(maple) 원목','w1166 x d2066 x h350 mm',1, sysdate-100)
into habibi_product
values ('H002SLP','sleeping','swedish bed',340000,8,'beige','체리(cherry) 원목','w1866 x d2066 x h350 mm',1, sysdate-99)
into habibi_product
values ('H003SLP','sleeping','premium bed',310000,5,'dark brown','오크(oak) 원목','w1566 x d2066 x h350 mm',1, sysdate-98)
into habibi_product
values ('H004SLP','sleeping','big head bed',450000,20,'brown','월넛(walnut) 원목','w1166 x d2066 x h350 mm',1, sysdate-97)
into habibi_product
values ('H005SLP','sleeping','vintage queen bed',270000,14,'vintage brown','체리(cherry) 원목','w1566 x d2066 x h750 mm',1, sysdate-96)
into habibi_product
values ('H006SLP','sleeping','european bed',320000,14,'oak brown','오크(oak) 원목','w1166 x d2088 x h750 mm',1, sysdate-95)
into habibi_product
values ('H007SLP','sleeping','over the wall bed',230000,14,'maple brown','월넛(walnut) 원목','w1166 x d2066 x h500 mm',1, sysdate-94)
into habibi_product
values ('H008SLP','sleeping','double standard bed',190000,3,'beige','체리(cherry) 원목','w1566 x d2066 x h350 mm',1, sysdate-93)
into habibi_product
values ('H009SLP','sleeping','simple flame bed',250000,20,'vintage brown','메이플(maple) 원목','w1866 x d2066 x h350 mm',1, sysdate-92)
into habibi_product
values ('H010SLP','sleeping','elegant bed',290000,2,'stone gray','월넛(walnut) 원목','w1566 x d2044 x h750 mm',1, sysdate-91)
into habibi_product
values ('H011SLP','sleeping','single standard bed',230000,14,'white','메이플(maple) 원목','w1166 x d2066 x h350 mm',1, sysdate-90)
into habibi_product
values ('H012SLP','sleeping','swedish bed',340000,8,'beige','체리(cherry) 원목','w1866 x d2066 x h350 mm',1, sysdate-89)
into habibi_product
values ('H013SLP','sleeping','premium bed',310000,5,'dark brown','오크(oak) 원목','w1566 x d2066 x h350 mm',1, sysdate-88)
into habibi_product
values ('H014SLP','sleeping','big head bed',450000,20,'brown','월넛(walnut) 원목','w1166 x d2066 x h350 mm',1, sysdate-87)
into habibi_product
values ('H015SLP','sleeping','vintage queen bed',270000,14,'vintage brown','체리(cherry) 원목','w1566 x d2066 x h750 mm',1, sysdate-86)
into habibi_product
values ('H016SLP','sleeping','european bed',320000,14,'oak brown','오크(oak) 원목','w1166 x d2088 x h750 mm',1, sysdate-85)
into habibi_product
values ('H017SLP','sleeping','over the wall bed',230000,14,'maple brown','월넛(walnut) 원목','w1166 x d2066 x h500 mm',1, sysdate-84)
into habibi_product
values ('H018SLP','sleeping','double standard bed',190000,3,'beige','체리(cherry) 원목','w1566 x d2066 x h350 mm',1, sysdate-83)
into habibi_product
values ('H019SLP','sleeping','simple flame bed',250000,20,'vintage brown','메이플(maple) 원목','w1866 x d2066 x h350 mm',1, sysdate-82)
into habibi_product
values ('H020SLP','sleeping','elegant bed',290000,2,'stone gray','월넛(walnut) 원목','w1566 x d2044 x h750 mm',1, sysdate-81)
select * from dual;


insert all
into habibi_product
values ('H001LTG','lighting','led smart lighting',33000,14,'gray', '니켈 도금 스틸','w110 x d110 x h35 mm',1, sysdate-80)
into habibi_product
values ('H002LTG','lighting','modern track lighting',40000,8,'black','도색 플라스틱','w180 x d180 x h35 mm',1, sysdate-79)
into habibi_product
values ('H003LTG','lighting','premium side lighting',35000,5,'rose gold','도금 황동','w150 x d150 x h350 mm',1, sysdate-78)
into habibi_product
values ('H004LTG','lighting','simple white lighting',45000,20,'white','스틸 & 실리콘','w310 x d310 x h550 mm',1, sysdate-77)
into habibi_product
values ('H005LTG','lighting','vintage ceil lighting',29000,14,'beige','스틸 & 페브릭','w360 x d360 x h750 mm',1, sysdate-76)
into habibi_product
values ('H006LTG','lighting','european lighting',32000,14,'gray','스틸 & 알루미늄','w210 x d210 x h660 mm',1, sysdate-75)
into habibi_product
values ('H007LTG','lighting','led basic lighting',23000,14,'light gray','도색 플라스틱','w360 x d360 x h500 mm',1, sysdate-74)
into habibi_product
values ('H008LTG','lighting','string lighting',19000,3,'random','니켈 도금 스틸','w350 x d350 x h450 mm',1, sysdate-73)
into habibi_product
values ('H009LTG','lighting','vintage lighting',120000,20,'vintage gold','스틸 & 알루미늄','w480 x d480 x h750 mm',1, sysdate-72)
into habibi_product
values ('H010LTG','lighting','tall floor lighting',29000,2,'golden yellow','도금 황동','w250 x d250 x h750 mm',1, sysdate-71)
into habibi_product
values ('H011LTG','lighting','golden ceil lighting',23000,14,'gold','니켈 도금 스틸','w300 x d300 x h450 mm',1, sysdate-70)
into habibi_product
values ('H012LTG','lighting','mood lighting',34000,8,'white','도색 플라스틱','w480 x d480 x h750 mm',1, sysdate-69)
into habibi_product
values ('H013LTG','lighting','pineapple lighting',31000,5,'beige','도금 황동','w350 x d350 x h850 mm',1, sysdate-68)
into habibi_product
values ('H014LTG','lighting','tall floor lighting',45000,20,'orange','스틸 & 실리콘','w300 x d300 x h1250 mm',1, sysdate-67)
into habibi_product
values ('H015LTG','lighting','modern ceil lighting',90000,14,'white','스틸 & 페브릭','w170 x d170 x h720 mm',1, sysdate-66)
into habibi_product
values ('H016LTG','lighting','european lighting',32000,14,'yellow','스틸 & 알루미늄','w710 x d710 x h790 mm',1, sysdate-65)
into habibi_product
values ('H017LTG','lighting','simple basic lighting',23000,14,'dark gray','도색 플라스틱','w490 x d490 x h500 mm',1, sysdate-64)
into habibi_product
values ('H018LTG','lighting','designed lighting',19000,3,'gray','니켈 도금 스틸','w580 x d580 x h350 mm',1, sysdate-63)
into habibi_product
values ('H019LTG','lighting','bended tall lighting',25000,20,'silver','스틸 & 알루미늄','w410 x d410 x h1700 mm',1, sysdate-62)
into habibi_product
values ('H020LTG','lighting','elegant lighting',65000,2,'beige','도금 황동','w350 x d350 x h750 mm',1, sysdate-61)
select * from dual;


insert all
into habibi_product
values ('H001STG','seating','simple leather sofa',195000,14,'white','가죽','w1120 x d425 x h550 mm',1, sysdate-60)
into habibi_product
values ('H002STG','seating','vintage chair',80000,8,'navy','체리(cherry) 원목','w400 x d400 x h550 mm',1, sysdate-59)
into habibi_product
values ('H003STG','seating','swing chair',94000,5,'light brown','메이플(maple) 원목','w1345 x d750 x h545 mm',1, sysdate-58)
into habibi_product
values ('H004STG','seating','elegant mini chair',45000,20,'white','가죽','w400 x d400 x h550 mm',1, sysdate-57)
into habibi_product
values ('H005STG','seating','single design chair',57000,14,'baby pink','가죽','w400 x d400 x h550 mm',1, sysdate-56)
into habibi_product
values ('H006STG','seating','basic chair',92000,14,'light gray','스틸 & 알루미늄','w400 x d400 x h550 mm',1, sysdate-55)
into habibi_product
values ('H007STG','seating','comfy round sofa',73000,14,'white','페브릭','w1345 x d950 x h545 mm',1, sysdate-54)
into habibi_product
values ('H008STG','seating','modern sofa',210000,3,'red orange','페브릭','w1120 x d425 x h550 mm',1, sysdate-53)
into habibi_product
values ('H009STG','seating','simple chair',90000,20,'deep yellow','스틸 & 알루미늄','w400 x d400 x h550 mm',1, sysdate-52)
into habibi_product
values ('H010STG','seating','vintage chair',84000,2,'muddy pink','페브릭','w400 x d400 x h550 mm',1, sysdate-51)
into habibi_product
values ('H011STG','seating','swedish chair',73000,14,'white','스틸 & 알루미늄','w400 x d400 x h550 mm',1, sysdate-50)
into habibi_product
values ('H012STG','seating','premium chair',90000,8,'black','가죽','w400 x d400 x h550 mm',1, sysdate-49)
into habibi_product
values ('H013STG','seating','european chair',130000,5,'white','오크(oak) 원목','w400 x d400 x h550 mm',1, sysdate-48)
into habibi_product
values ('H014STG','seating','basic sofa',125000,20,'gray','페브릭','w1120 x d425 x h550mm',1, sysdate-47)
into habibi_product
values ('H015STG','seating','modern outdoor bench',95000,14,'dark gray','스틸 & 알루미늄','w1120 x d425 x h550 mm',1, sysdate-46)
into habibi_product
values ('H016STG','seating','simple design chair',45000,14,'orange','플라스틱 & 알루미늄','w400 x d400 x h550 mm',1, sysdate-45)
into habibi_product
values ('H017STG','seating','garden bench',73000,14,'maple brown','월넛(walnut) 원목','w1120 x d425 x h550 mm',1, sysdate-44)
into habibi_product
values ('H018STG','seating','standard chair',65000,3,'white','플라스틱 & 알루미늄','w400 x d400 x h550 mm',1, sysdate-43)
into habibi_product
values ('H019STG','seating','vintage bench',160000,20,'light pink','메이플(maple) 원목','w1120 x d425 x h450 mm',1, sysdate-42)
into habibi_product
values ('H020STG','seating','unique design chair',95000,2,'red','플라스틱 & 알루미늄','w412 x d400 x h580 mm',1, sysdate-41)
select * from dual;



insert all
into habibi_product
values ('H001TBL','table','modern side table',52000,14,'white','스틸 & 알루미늄','w350 x d350 x h650 mm',1, sysdate-40)
into habibi_product
values ('H002TBL','table','simple side table',80000,8,'white','체리(cherry) 원목','w350 x d350 x h650 mm',1, sysdate-39)
into habibi_product
values ('H003TBL','table','vintage side table',75000,5,'gray','콘크리트','w350 x d350 x h650 mm',1, sysdate-38)
into habibi_product
values ('H004TBL','table','elegant side table',65000,20,'maple brown','오크(oak) 원목','w350 x d350 x h650 mm',1, sysdate-37)
into habibi_product
values ('H005TBL','table','simple basic table',50000,14,'white','플라스틱 & 알루미늄','w1150 x d480 x h770 mm',1, sysdate-36)
into habibi_product
values ('H006TBL','table','modern glass table',92000,14,'black','유리 & 알루미늄','w1150 x d480 x h325 mm',1, sysdate-35)
into habibi_product
values ('H007TBL','table','wooden table',170000,14,'light brown','메이플(maple) 원목','w1345 x d950 x h845 mm',1, sysdate-34)
into habibi_product
values ('H008TBL','table','design side table',85000,3,'gold brown','스틸 & 알루미늄','w350 x d350 x h650 mm',1, sysdate-33)
into habibi_product
values ('H009TBL','table','simple mini table',105000,20,'light brown','메이플(maple) 원목','w400 x d400 x h550 mm',1, sysdate-32)
into habibi_product
values ('H010TBL','table','premium table',84000,2,'oak brown','월넛(walnut) 원목','w1150 x d480 x h325 mm',1, sysdate-31)
into habibi_product
values ('H011TBL','table','swedish table',73000,14,'maple brown','메이플(maple) 원목','w1150 x d480 x h650 mm',1, sysdate-30)
into habibi_product
values ('H012TBL','table','mini round table',40000,8,'light brown','메이플(maple) 원목','w400 x d400 x h550 mm',1, sysdate-29)
into habibi_product
values ('H013TBL','table','simple round table',130000,5,'light brown','오크(oak) 원목','w650 x d650 x h750 mm',1, sysdate-28)
into habibi_product
values ('H014TBL','table','standard table',165000,20,'white','플라스틱 & 알루미늄','w550 x d400 x h600 mm',1, sysdate-27)
into habibi_product
values ('H015TBL','table','modern table',144000,14,'white','스틸 & 알루미늄','w1420 x d525 x h750 mm',1, sysdate-26)
into habibi_product
values ('H016TBL','table','basic round table',55000,14,'white','플라스틱 & 알루미늄','w400 x d400 x h550 mm',1, sysdate-25)
into habibi_product
values ('H017TBL','table','european table',93000,14,'maple brown','월넛(walnut) 원목','w1120 x d425 x h750 mm',1, sysdate-24)
into habibi_product
values ('H018TBL','table','wooden design table',65000,3,'light brown','월넛(walnut) 원목','w400 x d400 x h250 mm',1, sysdate-23)
into habibi_product
values ('H019TBL','table','vintage mini table',80000,20,'oak brown','오크(oak) 원목','w550 x d550 x h750 mm',1, sysdate-22)
into habibi_product
values ('H020TBL','table','premium design table',230000,2,'oak brown','오크(oak) 원목','w1300 x d600 x h750 mm',1, sysdate-21)
select * from dual;


insert all
into habibi_product
values ('H001STR','storage','modern wall shelf',45000,14,'cherry brown','체리(cherry) 원목','w280 x d65 x h250 mm',1, sysdate-20)
into habibi_product
values ('H002STR','storage','vintage storage',95000,8,'light gray','스틸 & 체리(cherry) 원목','w750 x d350 x h650 mm',1, sysdate-19)
into habibi_product
values ('H003STR','storage','simple black shelf',75000,5,'black','스틸 & 알루미늄','w550 x d250 x h1250 mm',1, sysdate-18)
into habibi_product
values ('H004STR','storage','basic white storage',120000,20,'white','파티클보드 & 아크릴 페인트','w750 x d350 x h650 mm',1, sysdate-17)
into habibi_product
values ('H005STR','storage','wooden wall shelf',55000,14,'oak brown','오크(oak) 원목','w280 x d65 x h250 mm',1, sysdate-16)
into habibi_product
values ('H006STR','storage','modern storage',92000,14,'walnut brown','월넛(walnut) 원목','w750 x d350 x h650 mm',1, sysdate-15)
into habibi_product
values ('H007STR','storage','wooden mini storage',80000,14,'maple brown','메이플(maple) 원목','w1345 x d950 x h845 mm',1, sysdate-14)
into habibi_product
values ('H008STR','storage','simple white storage',75000,3,'white','파티클보드 & 아크릴 페인트','w350 x d350 x h700 mm',1, sysdate-13)
into habibi_product
values ('H009STR','storage','standard steel storage',105000,20,'gray','스틸 & 알루미늄','w420 x d400 x h1550 mm',1, sysdate-12)
into habibi_product
values ('H010STR','storage','premium storage',170000,2,'dark brown','월넛(walnut) 원목','w750 x d350 x h650 mm',1, sysdate-11)
into habibi_product
values ('H011STR','storage','swedish storage',133000,14,'cherry brown','체리(cherry) 원목','w750 x d350 x h650 mm',1, sysdate-10)
into habibi_product
values ('H012STR','storage','glass door storage',90000,8,'white','파티클보드 & 아크릴 페인트','w520 x d400 x h1550 mm',1, sysdate-9)
into habibi_product
values ('H013STR','storage','vintage storage',180000,5,'dark brown','오크(oak) 원목','w520 x d400 x h1550 mm',1, sysdate-8)
into habibi_product
values ('H014STR','storage','european storage',115000,20,'white','파티클보드 & 오크(oak) 원목','w750 x d350 x h650 mm',1, sysdate-7)
into habibi_product
values ('H015STR','storage','simple wall shelf',44000,14,'maple brown','메이플(maple) 원목','w280 x d65 x h250 mm',1, sysdate-6)
into habibi_product
values ('H016STR','storage','string design shelf',85000,14,'oak brown','월넛(walnut) 원목','w550 x d250 x h1250 mm',1, sysdate-5)
into habibi_product
values ('H017STR','storage','modern steel storage',93000,14,'gray','스틸 & 알루미늄','w1345 x d950 x h845 mm',1, sysdate-4)
into habibi_product
values ('H018STR','storage','unique glass storage',145000,3,'beige','파티클보드 & 알루미늄','w325 x d325 x h500 mm',1, sysdate-3)
into habibi_product
values ('H019STR','storage','standard wall shelf',210000,20,'maple brown','메이플(maple) 원목','w1560 x d350 x h1780 mm',1, sysdate-2)
into habibi_product
values ('H020STR','storage','premium basic storage',160000,2,'oak brown','오크(oak) 원목','w750 x d350 x h650 mm',1, sysdate-1)
select * from dual;

select *
from view_habibi_product;
commit;

select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, prod_new_date, order_sum from ( 
                  select rownum NUM, P.* 
                  from ( 
                      select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, sysdate - prod_insert_date as prod_new_date, nvl(order_sum,0) as order_sum 
                      from (select * from view_habibi_product 
                      where prod_status = 1 and prod_code like '%%' and prod_category like '%%' 
                      )
                        left outer join view_order_sum 
                            on fk_prod_code = prod_code 
                      order by prod_stock desc, prod_insert_date desc 
                      ) P 
              )
where NUM between 1 and 16;

------------------------------------------------------------------------------------------------------------------------------
----------------------------------                        Cart               -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------



-->> Cart
--** 장바구니 테이블 생성
create table habibi_cart
(cart_num          number(10) not null     -- 장바구니 번호
,fk_userid    varchar2(50) not null        -- 회원 아이디
,fk_prod_code      varchar2(20) not null   -- 상품/이미지 코드
,cart_stock        number(3) default 0     -- 주문수량
,constraint FK_habibi_cart_userid foreign key(fk_userid)
                                references habibi_member(userid)
,constraint FK_habibi_cart_code foreign key(fk_prod_code)
                                references habibi_product(prod_code)
);

--** 장바구니 번호 시퀀스 생성
create sequence seq_habibi_cart_cartnum
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;

-- 장바구니 추가
insert into habibi_cart (cart_num,fk_userid,fk_prod_code,cart_stock )
values (seq_habibi_cart_cartnum.nextval,'admin','H001SLP',1);

-- 상품의 수량과 가격을 곱해 총 가격을 구한다.
select nvl(sum(cart_stock * prod_price), 0) AS SUMTOTALPRICE -- 장바구니에 상품이 없으면 0으로 nvl처리
from habibi_cart A join habibi_product B
on A.fk_prod_code = B.prod_code
where fk_userid = 'admin';


------------------------------------------------------------------------------------------------------------------------------
----------------------------------                        Order              -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------


-->> Order
-- 주문테이블 생성
create table habibi_order
(order_code number(7) not null      -- 주문번호
,fk_userid varchar2(50) not null    -- 아이디
,order_name varchar2(20)            -- 받으시는분
,order_address varchar2(100)        -- 주소
,order_ship number(1) default 0     -- 배송상태
,order_memo varchar2(200)           -- 배송메모
,order_refund number(1) default 0   -- 반품/환불/취소 요청
,order_date date default sysdate    -- 주문일자
,order_mobile varchar2(11)          -- 연락처
,order_price number(10)             -- 구매가격
,order_point number(10) default 0   -- 적립금사용
,constraint PK_habibi_order primary key(order_code)
,constraint FK_habibi_order_userid foreign key(fk_userid) references habibi_member(userid)
);
select *
from habibi_order;
-- 주문번호 시퀀스 생성
create sequence seq_habibi_order_code
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;
 
select nvl(sum(cart_stock * prod_price), 0) AS SUMTOTALPRICE -- 장바구니에 상품이 없으면 0으로 nvl처리
from habibi_cart A join habibi_product B
on A.fk_prod_code = B.prod_code
where fk_userid = 'admin';

- 주문
insert into habibi_order (order_code, fk_userid, order_name, order_address, order_ship, order_memo, order_refund, order_date, order_mobile, order_price, order_point)
values (seq_habibi_order_code.nextval,'admin','신현호','서울 중구 남대문로 120 대일빌딩3층','0','택배만 잘 오면 살려는 드릴게','0',sysdate-1,'01012345678','500000','0');
insert into habibi_order (order_code, fk_userid, order_name, order_address, order_ship, order_memo, order_refund, order_date, order_mobile, order_price, order_point)
values (seq_habibi_order_code.nextval,'admin','신현호','서울 중구 남대문로 120 대일빌딩3층','1','택배만 잘 오면 살려는 드릴게','1',sysdate-1,'01012345678','500000','3000');
commit;


desc habibi_product;


select order_code,to_char(order_date,'yyyy-mm-dd') as order_date
,fk_prod_name,order_oqty,order_ship,B.order_price
from habibi_order A join habibi_orderinfo B
on a.order_code = b.fk_order_code
where fk_userid = 'admin';


-- 주문상세 테이블
create table habibi_orderinfo
(orderinfo_code number(7) not null   -- 주문상세 시퀀스
,fk_order_code number(7) not null    -- 주문번호
,fk_prod_code varchar2(20) not null  -- 상품코드
,fk_prod_name varchar2(30)  -- 상품이름
,order_oqty number(5) not null       -- 주문수량
,order_price number(20) not null     -- 개별가격
,constraint FK_habibi_orderinfo_ordercode foreign key(fk_order_code) references habibi_order(order_code)
,constraint FK_habibi_orderinfo_prod_code foreign key(fk_prod_code) references habibi_product(prod_code)
);

-- 주문상세시퀀스 생성
create sequence seq_habibi_orderinfo_code
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;
 
 select * from habibi_orderinfo;
 
create or replace view view_order_sum
as(
select fk_prod_code, sum(order_oqty) as order_sum
from habibi_orderinfo
group by fk_prod_code
);
 
 
insert into habibi_orderinfo (orderinfo_code, fk_order_code, fk_prod_code, fk_prod_name, order_oqty, order_price)
values (seq_habibi_orderinfo_code.nextval,'1','H001SLP','single standard bed','1','500000');
insert into habibi_orderinfo (orderinfo_code, fk_order_code, fk_prod_code, fk_prod_name, order_oqty, order_price)
values (seq_habibi_orderinfo_code.nextval,'1','H001SLP','single standard bed','2','500000');


-- drop table habibi_calculate;
create table habibi_calculate
(
     fk_order_code number(7) not null -- 주문번호
    ,fk_name varchar2(20) not null -- 주문자명
    ,fk_order_price number(10) -- 주문 가격 합
    ,fk_cost_sum number(10) -- 원가 합
    ,fk_order_date date default sysdate -- 주문일자(결제일자)
--  ,cal_date as (last_day(add_months(fk_order_date,1))) -- 정산(예정)일자 (주문날짜 다음달 마지막 날)
--  ,commission as (fk_order_price*0.01) -- 수수료 (결제금액의 1%)
--  ,cal_price as (fk_order_price - commission) -- 정산금액(주문 가격 합 - 수수료)
    ,is_complete number(1) default 0 -- 정산 여부 (정산 1, 예정 0)
--  ,profit as (cal_price - fk_cost_sum) -- 이익 (정산금액  - 원가 합)
);

insert into habibi_calculate
values (1, '이지아', 138000, 85000, sysdate-100, 1);
insert into habibi_calculate
values (2, '최유영', 182000, 135000, sysdate-3, 0);
insert into habibi_calculate
values (3, '이호연', 138000, 85000, sysdate-90, 1);
insert into habibi_calculate
values (4, '이호연', 138000, 85000, sysdate-3, 1);
insert into habibi_calculate
values (5, '신현호', 2854100, 85000, sysdate-47, 0);
insert into habibi_calculate
values (6, '대충', 256000, 85000, sysdate-150, 0);
insert into habibi_calculate
values (7, '이지아', 317500, 85000, sysdate-70, 0);
insert into habibi_calculate
values (8, '이호연', 300000, 85000, sysdate-56, 0);
insert into habibi_calculate
values (9, '이호연', 600000, 85000, sysdate-13, 0);
insert into habibi_calculate
values (10, '이호연', 500000, 85000, sysdate-89, 0);
insert into habibi_calculate
values (11, '이호연', 15486000, 85000, sysdate-82, 0);

delete habibi_calculate where fk_order_code = 4;

select *
from view_habibi_calculate;

update habibi_calculate set is_complete = 0
where fk_order_code in (4);

commit;

create or replace view view_habibi_calculate
as
    select fk_order_code,
       fk_name,
       fk_order_price,
       fk_cost_sum,
       fk_order_date,
       cal_date,
       commission,
       cal_price,
       is_complete,
       cal_price - fk_cost_sum as profit
     from
    (
        select fk_order_code,
           fk_name,
           fk_order_price,
           fk_cost_sum,
           fk_order_date,
           cal_date,
           commission,
           fk_order_price - commission as cal_price,
           is_complete
        from (
                select fk_order_code,
                     fk_name,
                     fk_order_price,
                     fk_cost_sum,
                     fk_order_date,
                     last_day(add_months(fk_order_date, 1)) as cal_date,
                     fk_order_price * 0.01                  as commission,
                     is_complete

               from habibi_calculate) V
    )T
;
-- 첫번째 fk_order_price 월별 합 (매출)
-- 두번째 fk_cost_sum + commission 월별 합 (비용)
-- 세번째 첫번째 - 두번째 (수익)


select premonth, sum(fk_order_price)
from
(
select fk_order_code,
       fk_name,
       fk_order_price,
       fk_cost_sum,
       fk_order_date,
       cal_date,
       commission,
       cal_price,
       is_complete,
       profit,
       to_char(add_months(fk_order_date, -1), 'mm') AS premonth
from view_habibi_calculate;
) V
group by premonth;

------------------------------------------------------------------------------------------------------------------------------
----------------------------------                        Board              -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------



// qna 게시판 테이블
create table HABIBI_QNA
(
    FK_USERID      VARCHAR2(20)         not null
        constraint FK_HABIBI_QNAUSERID
            references HABIBI_MEMBER,
    FK_PROD_CODE   VARCHAR2(20)         not null
        constraint FK_HABIBI_QNAPRODCODE
            references HABIBI_PRODUCT,
    QNA_CATEGORY   VARCHAR2(20),
    QNA_NO         NUMBER(10) default 0 not null
        constraint PK_HABIBI_QNA
            primary key,
    QNA_TITLE      VARCHAR2(100)        not null,
    QNA_CONTENT    VARCHAR2(4000)       not null,
    QNA_WRITE_DATE DATE       default sysdate,
    QNA_COUNT      NUMBER(10) default 0,
    QNA_IS_DONE    NUMBER(1)  default 0
        constraint CK_HABIBI_QNAISDONE
            check (qna_is_done in (0, 1)),
    QNA_STATUS     NUMBER(1)  default 1
        constraint CK_HABIBI_QNASTATUS
            check (qna_status in (0, 1)),
    RE_REF         NUMBER(10) default null,
    RE_SEQ         NUMBER(10) default 0,
    RE_LEV         NUMBER(10) default 0,
    QNA_SECRET     NUMBER(1)  default 0
        constraint CK_HABIBI_QNA_SECRET
            check (qna_secret in (0, 1))
);


-- 리뷰 게시판 테이블
create table HABIBI_REVIEW
(
    FK_USERID      VARCHAR2(20)   not null
        constraint FK_HABIBI_REVUSERID
            references HABIBI_MEMBER,
    FK_PROD_CODE   VARCHAR2(20)   not null
        constraint FK_HABIBI_REVPRODCODE
            references HABIBI_PRODUCT,
    REV_NO         NUMBER         not null
        constraint PK_HABIBI_REV
            primary key,
    REV_TITLE      VARCHAR2(100)  not null,
    REV_CONTENT    VARCHAR2(4000) not null,
    REV_WRITE_DATE DATE       default sysdate,
    REV_COUNT      NUMBER(10) default 0,
    REV_STATUS     NUMBER(1)  default 1
        constraint CK_HABIBI_REV_STATUS
            check (rev_status in (0, 1))
);

-- 리뷰 댓글 테이블
create table HABIBI_COMMENT
(
    FK_CMT_USERID  VARCHAR2(20)
        constraint FK_HABIBI_COMUSERID
            references HABIBI_MEMBER,
    CMT_CONTENT    VARCHAR2(2000),
    CMT_WRITE_DATE DATE default sysdate,
    FK_REV_NO      NUMBER(10)
        constraint FK_HABIBI_REVIEW_NO
            references HABIBI_REVIEW,
    CMT_NO         NUMBER not null
        constraint PK_HABIBI_CMT
            primary key
);

-- qna view
create view QNA_RANK_VIEW as
select fk_userid, fk_prod_code, qna_category, qna_no, qna_title, qna_content, qna_secret,
       to_char(qna_write_date, 'YYYY-MM-DD') AS qna_write_date, qna_count, qna_is_done, qna_status,
       rank() over (partition by fk_prod_code order by qna_write_date) AS qna_seq, re_ref, re_seq, re_lev
from habibi_qna
order by rank() over (partition by fk_prod_code order by qna_write_date) desc;


-- rev view1
create view REV_RANK_VIEW as
select fk_userid, fk_prod_code, rev_no, rev_title, rev_content,
       to_char(rev_write_date, 'YYYY-MM-DD') AS rev_write_date, rev_count, rev_status,
       rank() over (partition by fk_prod_code order by rev_write_date) AS rev_seq
from habibi_review;

-- rev view2
create view REV_VIEW as
select R.fk_userid, R.fk_prod_code, R.rev_no, R.rev_title, R.rev_content, to_char(R.rev_write_date, 'YYYY-MM-DD') as rev_write_date,
       R.rev_count, R.rev_status, rank() over (partition by R.fk_prod_code order by R.rev_write_date) AS rev_seq, count(C.fk_rev_no) cmt_count
from habibi_review R left join habibi_comment C on R.rev_no = C.fk_rev_no
group by R.fk_userid, R.fk_prod_code, R.rev_no, R.rev_title, R.rev_content, R.rev_write_date, R.rev_count, R.rev_status;

-- cmt view
create view REV_CMT_VIEW as
select r.fk_userid, r.fk_prod_code, r.rev_no, r.rev_title, r.rev_content, r.rev_write_date, r.rev_count, r.rev_status, r.rev_seq, count(c.fk_rev_no) cmt_count
from rev_rank_view R
         left join habibi_comment C on R.rev_no = C.fk_rev_no
group by r.fk_userid, r.fk_prod_code, r.rev_no, r.rev_title, r.rev_content, r.rev_write_Date, r.rev_count, r.rev_status, r.rev_seq;

-- 시퀀스
create sequence habibi_qna_seq
    increment by 1
    start with 1;

create sequence habibi_review_seq
    increment by 1
    start with 1;

create sequence habibi_comment_seq
    increment by 1
    start with 1;

create sequence habibi_qna_seq_re
    increment by 1
    start with 1;

------------------------------------------------------------------------------------------------------------------------------
----------------------------------                        Map                -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-------- **** 매장찾기(카카오지도) 테이블 생성하기 **** ----------
create table shopping_map 
(storeID       varchar2(20) not null   --  매장id
,storeName     varchar2(100) not null  --  매장명
,storeUrl      varchar2(200)            -- 매장 홈페이지(URL)주소
,storeImg      varchar2(200) not null   -- 매장소개 이미지파일명  
,storeAddress  varchar2(200) not null   -- 매장주소 및 매장전화번호
,lat           number not null          -- 위도
,lng           number not null          -- 경도 
,zindex        number not null          -- zindex 
,constraint PK_shopping_map primary key(storeID)
,constraint UQ_shopping_map_zindex unique(zindex)
);

create sequence seq_shopping_map_zindex
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


------------------------------------------------------------------------------------------------------------------------------
----------------------------------                        Point              -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------


------------ **** 적립금 **** ------------ 
-- 적립금 테이블 생성
create table habibi_point
(order_date date default sysdate
,point number(20) not null
,fk_order_code number(10) not null
,point_comment varchar2(100) not null
,fk_userid varchar2(50) not null
,constraint FK_habibi_point_ordercode foreign key(fk_order_code) references habibi_order(order_code)
,constraint FK_habibi_point_userid foreign key(fk_userid) references habibi_member(userid)
);

select order_date, point, fk_order_code, point_comment, fk_userid
from habibi_point
where fk_userid = 'admin';

truncate table habibi_point;

insert into habibi_point(point, fk_order_code, point_comment, fk_userid)
values(10000, 1, '첫 회원가입 +10000', 'admin');
insert into habibi_point(point, fk_order_code, point_comment, fk_userid)
values(-5000, 1, '상품구매 -5000', 'admin');
insert into habibi_point(point, fk_order_code, point_comment, fk_userid)
values(500, 1, '상품구매 +500', 'admin');
commit;


------------------------------------------------------------------------------------------------------------------------------
----------------------------------               news                        -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

drop table habibi_news;
drop sequence seq_news_no;

drop table habibi_news;
create table habibi_news
( news_no  varchar2(100) not null
  ,news_title varchar2(100)
  ,news_writer varchar2(50)
  ,news_content clob
  ,regdate date default sysdate
  ,hit number(10) default 0
  ,files varchar2(100)
  ,is_post varchar(1) default 1 -- 게시물 존재여부('1':존재,'0':삭제)
  ,constraint PK_habibi_news primary key(news_no)
  ,constraint CK_habibi_news_post check(is_post in ('0','1'))
  );


create sequence seq_news_no
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



select *
from habibi_news;

select news_no,news_title,news_writer
from habibi_news
where news_title like '%본사%';
     
     
select RNO, news_no, news_title, news_writer, regdate, hit
from 	
(  
  select rownum AS RNO, news_no, news_title, news_writer, regdate, hit  
  from 
  (
    select news_no, news_title, news_writer, to_char(regdate,'yyyy-MM-dd') as regdate, hit 
    from habibi_news
    where news_title like '%'||'크리스마스'||'%'
    order by news_no desc 
  ) V 
) T 
where RNO between 1 and 4;



delete from habibi_news
where news_no='1';
