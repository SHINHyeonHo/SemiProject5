<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String ctxPath = request.getContextPath();
   
%>        
<jsp:include page="../../Main/header.jsp"/>
<jsp:include page="../../Main/sideBarMypage.jsp"/>

<style type="text/css">
div#wrap {
    position: relative;
    margin: 0 auto 0;
    width: 1200px;
}

header#header {
   width: 1200px;
    padding: 90px 0 33px;
    overflow: hidden;
}

div#logo {
   display: block;
   margin: 0;
   float: left;
}

div.main_menu {
   float:right;
   
}

div.header_menu {
   text-align: right;
      float: right;
      
      height: 30px;
}

ul#header_menu {
   list-style-type: none;
   margin: 0;
}

li.header_menu {
   display: inline;
   margin-left: 5px;
   margin-right: 5px;
   font-size: 8pt;
   text-decoration: none;
   cursor: pointer;
}
    
    
    div   {
         
         font-family: "맑은고딕";
         color: #555;
         
         
   }
    div.myInfoWrap{
      overflow: hidden;
       
       border: 1px solid #d9d9d9;
       color: #353535;
       width:80%;
       display: inline-block;
       float: right;
       margin-top: 2%;
   }
   
   div#main_menu{
         background-color: #E6E6E6;
        text-align: left;
       width: 80%;
       margin-right: 6%; 
       line-height: 30px;   
       height: 200px; 
       padding-top: 20px;
         margin-left: 0;
         margin-top: 3%;
         float: right;
   }
   
   a {
      text-decoration: none;
   }

   #myInfoMenu li a{
      color: #555;
       display: inlien-block;
       font-size: 10px;
       font-family: 'Open Sans','맑은 고딕';
       letter-spacing: 0.1em;
       text-transform: uppercase;
       font-weight: 600;
       width:80%;
       
   }
    
    
    div#mypage   {
         border: solid 2px black;
         
         width: 80%;
         height: 80%;
         display: inline-block;
         
   }
   
  
   
  
   
   div#myinfo_title   {
         border: none;
         text-align: center;
         
         color: black;
         
         
   }
   
   div.button_line > ul >li {
         border: solid 1px gray;
         display:inline-block;
         text-align: center;
         
   
   }
   div.button_line > ul {
         
         width: 45%;
         margin: 0 auto;
         padding: 0 ;
         
   }
   
  div.button_line   {
        text-align: center;
        margin-top: 20px;
        
        
  
  }
  
  div.button_line > ul >li > a   {
        width: 100px;
        height: 70px;
        display: inline-block;
        
  }
   
  div.button_line > ul >li > a > span {
        line-height: 70px;
        
        
  }
  
  
   
  div.main_menu > ul > li > a   {
     border: solid 1px black;
     background-color: white;
     text-align: right;
     margin-right: 40px;
     float:right;
     line-height: 20px;
     font-size: 13px;
  }
  
  div.main_menu > ul > li > strong   {
        margin-top: 200px;
  }
  
  li.etc {
        margin-top: 20px;
  }
  
  div.main_menu   {
        background-color: #E6E6E6;
        text-align: left;
       width: 50%; 
       line-height: 30px;   
       height: 200px; 
       padding-top: 20px;
       
  }
  
    li#button_line1{
        border: solid 1px black;
        display:inline-block;
         text-align: center;
         
         
         
  }
  
  ul#button   {
         list-style: none;
         margin-top: 20%;
         display: inline-block;
         padding: 0 ;
   }
   div#button_line > ul {
         
         width: 45%;
         margin: 0 auto;
         padding: 0 ;
         
         
   }
  
  ul#button >li {
      line-height: 70px;
     
  }
    ul#button >li > a   {
        width: 100px;
        height: 20px;
        display: inline-block;
        
  }
  
  div#myInfoMenu{
     margin-left: 110px;
  }
   
  a   {
     text-decoration: none;
  } 
  
  .hover {
     display: none;
  }
  .search-container {
  float: left;
}

input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 10px;
  border: solid 0.5px gray;
}

button.search {
  width: 25px;
  height: 25px;
  float: right;
  padding: 0;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 19px;
  border: none;
  cursor: pointer;
}

div.searchBar {
   width: 284px;
   height: 42px;
}

ul#side {
   list-style-type: none;
   padding: 0;
}


li > ul#side {
   padding-left: 20px;
}


div.left_sidebar {
   width: 22%;
   float: left;
}

div.middle {
   display: inline-block;
}

.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  text-align: left;
  border: none;
  outline: none;
  transition: 0.4s;
}

div#main_menu > span
{
    margin-left: 30px;
}

div#container {
   min-height: 500px;
}
  
#footer {
   width: 1200px;
   margin: 80px auto 0;
}

.inner {
   padding-bottom: 60px;
}

.address {
   padding-top: 20px;
}

.address p {
   padding-left: 70px;
   font-size: 11px;
}

div.cominfo {
   display: inline-block;
   padding: 0 50px 0 35px;
}

.sns_menu {
   padding-bottom: 143px;
}

p.sns {
   padding: 0 0 0 12px;
}

   
   
   
</style>
<script type="text/javascript">
   $(document).ready(function(){ 
      
   });
   
   
</script>

<div style="float: right; margin-right: 200px;">
<form name="myInfoFrm">
   <div id="myInfo_tittle">
      <h2 align="center">My PAGE</h2>
   </div>
   
      <div id="myInfoWrap" class="myInfoWrap" style="margin-right: 40px;">
         <p style="text-align: center; margin: 0;"><span style="color: blue; font-weight: bold;">${(sessionScope.loginuser).name}</span> 고객님, 저희 쇼핑몰을 이용해 주셔서 감사합니다.</p>
      </div>
      <div id="main_menu">   
         <span>아이디</span>
         <span style="color: blue; font-weight: bold;">${(sessionScope.loginuser).userid}</span>
         <br/><br/>
         <span>성명</span>
         <span style="color: green; font-weight: bold;">${(sessionScope.loginuser).name}</span>
         <br/><br/>
         <span>적립금</span>
         <span style="color: black; font-weight: 100;">${(sessionScope.loginuser).point}</span>
          <span>원</span>
      </div>
   
   
   <div id="myInfoMenu">
      <ul id="button" class="button_line">
         <li id="button_line1">
            <a href="<%= request.getContextPath() %>/member/memberEdit.hb?idx=${sessionScope.loginuser.idx}">
               <span>MyInfo</span>
               <span class="hover">나의정보</span>
            </a>
         </li>
         <li id="button_line1">
            <a href="<%= request.getContextPath() %>/prod/cartmain.hb?idx=${sessionScope.loginuser.idx}">
               <span>CART</span>
               <span class="hover">장바구니</span>
            </a>
         </li>
         <li id="button_line1">
             <a href="<%= request.getContextPath() %>/member/memberOnePoint.hb?idx=${sessionScope.loginuser.idx}">
               <span>POINT</span>
               <span class="hover">적립금</span>
            </a>
         </li>
         <li id="button_line1">
             <a href="<%= request.getContextPath() %>/member/memberOrderList.hb?idx=${sessionScope.loginuser.idx}">
               <span>ORDER</span>
               <span class="hover">주문내역</span>
            </a>
         </li>
      </ul>
   </div>
</form>
</div>
</div>


<jsp:include page="../../Main/footer.jsp"/>