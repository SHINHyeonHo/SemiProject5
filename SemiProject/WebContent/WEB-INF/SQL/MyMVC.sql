------ *** JSP & Sevlet MyMVC 에서 작업한 것 *** -------

show user;
-- USER이(가) "MYORAUSER"입니다.

-- /memberRegister.do 을 했을때 회원가입을 위한 테이블 생성한다. --
create table mymvc_member
(userid         varchar2(20)    not null
,passwd         varchar2(20)    not null
,name           varchar2(20)    not null
,email          varchar2(50)    not null
,gender         varchar2(1)     not null
,interest       varchar2(80)
,registerday    date            default sysdate
,constraint PK_mymvc_member primary key(userid)
,constraint UQ_mymvc_member_email unique(email)
);

select *
from mymvc_member;


select userid, name, email, gender, interest
     , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
from mymvc_member
where userid = 'Leess';

select userid, name, email, gender, interest
     , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
from mymvc_member
order by registerday desc;


-- mymvc_member 테이블에 가입인사(introduce) 컬럼을 추가한다.
alter table mymvc_member
add introduce varchar2(500);


select userid, name, email, gender, interest
     , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
     , introduce
from mymvc_member
order by registerday desc;


delete mymvc_member 
where userid = 'Parkby';

commit;

update mymvc_member
set introduce = '<script>window.onload=function(){var arrBody = document.getElementsByTagName("body"); arrBody[0].style.backgroundColor="red"; arrBody[0].style.fontSize="20pt";}</script>'
where userid='Iyou007';


-------------------------- 쇼핑몰 -------------------------

create table mymvc_main_image
(imgno           number not null
,imgfilename     varchar2(100) not null
,constraint PK_mymvc_main_image primary key(imgno)
);

create sequence seq_main_image
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into mymvc_main_image(imgno, imgfilename) values(seq_main_image.nextval, '미샤.png');  
insert into mymvc_main_image(imgno, imgfilename) values(seq_main_image.nextval, '원더플레이스.png'); 
insert into mymvc_main_image(imgno, imgfilename) values(seq_main_image.nextval, '레노보.png'); 
insert into mymvc_main_image(imgno, imgfilename) values(seq_main_image.nextval, '동원.png'); 

commit;

select imgno, imgfilename 
from mymvc_main_image
order by imgno asc;



create table tbl_quiztest
(userid         varchar2(20)    not null
,name           varchar2(20)    not null
,gender         varchar2(1)     not null
,constraint PK_tbl_quiztest primary key(userid)
);

select *
from tbl_quiztest;

select userid, name, gender
from tbl_quiztest;


create table ncstest_member
(userId varchar2(20) not null
,userName varchar2(20) not null
,birthday varchar2(10) not null
,gender number(1) not null
,registerDay date default sysdate
,constraint PK_ncstest_member_userid primary key(userId)
,constraint CK_ncstest_member_gender check( gender in(1,2) )
);


select ceil(89.0), ceil(89.1), ceil(90)
from dual;


---------------------------- **** ajax **** -------------------------------------

create table test_ajaxnews
(seqtitleno   number not null
,title        varchar2(200) not null
,registerday  date default sysdate not null
,constraint PK_test_ajaxnews_seqtitleno primary key(seqtitleno)
);

create sequence seq_test_ajaxnews_seqtitleno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '''남달라'' 박성현 LPGA 투어 텍사스 클래식 우승, 시즌 첫 승' );
insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '뼈아픈 연패-전패, 아직 한번도 못 이겼다고?' );
insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '전설들과 어깨 나란히 한 김해림 "4연패도 노려봐야죠"');
insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '삼성·현대차 들쑤신 엘리엇, 이번엔 伊 최대통신사 삼켰다');
insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '"야구장, 어떤 음악으로 채우나" 응원단장들도 괴롭다');
insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '"공부 후 10분의 휴식, 기억력 높인다"');
insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '현대차, 쏘나타 ''익스트림 셀렉션'' 트림 출시… 사양과 가격은?');
insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '날씨무더위 계속…곳곳 강한 소나기');

commit;

select *
from test_ajaxnews;

select seqtitleno 
     , case when length(title) > 22 then substr(title, 1, 20)||'..'
       else title end AS title
     , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
from test_ajaxnews
order by seqtitleno desc;


create table test_ajaxnews_contents
(fK_seqtitleno   number         not null
,newscontents    varchar2(4000) not null     
,constraint PK_test_ajaxnews_contents primary key(fK_seqtitleno)
,constraint FK_test_ajaxnews_contents foreign key(fK_seqtitleno) 
                                      references test_ajaxnews(seqtitleno) on delete cascade

);


insert into test_ajaxnews_contents(fK_seqtitleno, newscontents)
values(1, '박정현 LPGA 기사 내용입니다.');

insert into test_ajaxnews_contents(fK_seqtitleno, newscontents)
values(2, '연패-전패 관련 기사 내용입니다.');

insert into test_ajaxnews_contents(fK_seqtitleno, newscontents)
values(3, '김해림이 전설과 나란히? 싸발적');

insert into test_ajaxnews_contents(fK_seqtitleno, newscontents)
values(4, '삼성, 현대차 싸발적입니다.');

insert into test_ajaxnews_contents(fK_seqtitleno, newscontents)
values(5, '프로야구 응원단 너무 싸발적~');

insert into test_ajaxnews_contents(fK_seqtitleno, newscontents)
values(6, '공부후 10분간 휴식은 필수입니다.');

insert into test_ajaxnews_contents(fK_seqtitleno, newscontents)
values(7, '쏘나타 급발진 싸발적~');

insert into test_ajaxnews_contents(fK_seqtitleno, newscontents)
values(8, '날씨 무더위 계속 소나기 올 수 도');

commit;

select fK_seqtitleno, newscontents
from test_ajaxnews_contents
order by fK_seqtitleno desc;


select fK_seqtitleno, newscontents
from test_ajaxnews_contents
where fK_seqtitleno = 8;



select seq_test_ajaxnews_seqtitleno.nextval
from dual;


-------------------- GSON 관련 -----------------------------
create table test_ajaxemp
(ename varchar2(20)
,jik   varchar2(10)
,tel   varchar2(20)
,email varchar2(30) unique not null
,birthday varchar2(20)
);

select ename, jik, tel, email, birthday 
from test_ajaxemp
order by ename;

select email
from test_ajaxemp
where email = 'guzi9510@gmail.com';


commit;
------------------------ exam 관련 ---------------------------
create table exam_ajaxmember
(name   varchar2(10)
, email varchar2(20) not null
, constraint PK_exam_ajaxmember primary key(email)
);

insert into exam_ajaxmember values('김진영', 'guzi9510@gmail.com');

select *
from exam_ajaxmember;






--- *** 회원 테이블 생성 *** ---  

-- drop table mymvc_shopping_member purge;

create table mymvc_shopping_member
(idx                number(10)     not null       -- 회원번호(시퀀스로 데이터가 들어온다)
,userid             varchar2(20)   not null       -- 회원아이디
,name               varchar2(30)   not null       -- 회원명
,pwd                varchar2(200)  not null       -- 비밀번호 (SHA-256 암호화 대상)
,email              varchar2(200)  not null       -- 이메일   (AES-256 암호화/복호화 대상)
,hp1                varchar2(3)                   -- 연락처
,hp2                varchar2(200)                 --         (AES-256 암호화/복호화 대상) 
,hp3                varchar2(200)                 --         (AES-256 암호화/복호화 대상)
,postcode           varchar2(5)                   -- 우편번호
,address            varchar2(200)                 -- 주소
,detailaddress      varchar2(200)                 -- 상세주소
,extraaddress       varchar2(200)                 -- 참고항목
,gender             varchar2(1)                   -- 성별     남자 : 1 / 여자 : 2
,birthday           varchar2(8)                   -- 생년월일 
,coin               number default 0              -- 코인액
,point              number default 0              -- 포인트 
,registerday        date default sysdate          -- 가입일자
,status             number(1) default 1           -- 회원탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
,lastLoginDate      date default sysdate          -- 마지막으로 로그인 한 날짜시간 기록용
,lastPwdChangeDate  date default sysdate          -- 마지막으로 암호를 변경한 날짜시간 기록용
,clientip           varchar2(20)                  -- 클라이언트의 IP 주소
,constraint   PK_mymvc_shopping_member primary key(idx)
,constraint   UQ_mymvc_shopping_member unique(userid)
,constraint   CK_mymvc_shopping_member_gen check( gender in('1','2') ) 
,constraint   CK_mymvc_shopping_member_sta check( status in(0,1) ) 
);

-- drop sequence seq_shopping_member;

create sequence seq_shopping_member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



select *
from mymvc_shopping_member
order by idx desc;


select *
from mymvc_shopping_member
where userid = 'chaew' and
      pwd = 'qwer1234$' ;
      
select *
from mymvc_shopping_member
where userid = 'chaew' and
      pwd = '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382' ;      



select idx, userid, name, email, hp1, hp2, hp3, postcode, address, detailaddress, extraAddress, gender   
     , substr(birthday,1,4) AS birthyyyy, substr(birthday,5,2) AS birthmm, substr(birthday, 7) AS birthdd  
     , coin, point, to_char(registerday,'yyyy-mm-dd') AS registerday  
     , trunc( months_between(sysdate, lastPwdChangeDate) ) AS pwdchangegap  
     , trunc( months_between(sysdate, lastLoginDate) ) AS lastlogindategap 
from mymvc_shopping_member 
order by idx asc;

select idx, userid, name, email, hp1, hp2, hp3, postcode, address, detailaddress, extraAddress, gender   
     , substr(birthday,1,4) AS birthyyyy, substr(birthday,5,2) AS birthmm, substr(birthday, 7) AS birthdd  
     , coin, point, to_char(registerday,'yyyy-mm-dd') AS registerday  
     , trunc( months_between(sysdate, lastPwdChangeDate) ) AS pwdchangegap  
     , trunc( months_between(sysdate, lastLoginDate) ) AS lastlogindategap 
from mymvc_shopping_member
where status = 1 and userid= 'leess' and pwd = '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382';


select userid, to_char(lastlogindate, 'yyyy-mm-dd hh24:mi:ss') as "마지막로그인한시각"
from mymvc_shopping_member
where userid = 'leess';


update mymvc_shopping_member set lastlogindate = add_months(lastlogindate, -13)
where userid = 'leess';


commit;

update mymvc_shopping_member set lastlogindate = sysdate
where userid = 'leess';


select userid, to_char(lastlogindate, 'yyyy-mm-dd hh24:mi:ss') as "마지막로그인한시각"
from mymvc_shopping_member
where userid = 'youks';


update mymvc_shopping_member set lastpwdchangedate = add_months(lastpwdchangedate, -4)
where userid = 'youks';


select userid, to_char(lastpwdchangedate, 'yyyy-mm-dd hh24:mi:ss') as "마지막암호변경시각"
from mymvc_shopping_member
where userid = 'youks';


select userid
from mymvc_shopping_member
where status = 1 and 
      name = '이순신' and 
      trim(hp1) || trim(hp2) || trim(hp3) = '01023454444';

select userid
from mymvc_shopping_member
where status = 1 and 
      name = '김진영' and 
      email = 'dRXFMqV6F2rIgLGXZWyQdj7CP1j52TQE7L5tNtqQqQQ=';


update mymvc_shopping_member set pwd = ?
where userid = ? ;






