<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
   
%>        
<jsp:include page="../../Main/header.jsp"/>
<jsp:include page="../../Main/sideBar.jsp"/>
<style type="text/css">
   
   div.myInfoWrap{
      overflow: hidden;
       padding: 10px 10px 10px 90px;
       border: 1px solid #d9d9d9;
       color: #353535;
   }
   
   a {
      text-decoration: none;
   }

   #myInfoMenu li a{
      color: #555;
       display: block;
       font-size: 10px;
       font-family: 'Open Sans','맑은 고딕';
       letter-spacing: 0.1em;
       text-transform: uppercase;
       font-weight: 600;
   }
   
   
   
</style>
<script type="text/javascript">
   $(document).ready(function(){ 
      
   });
   
   
</script>

<form name="myInfoFrm">
   <div id="myInfo_tittle">
      <h2 align="center">My PAGE</h2>
   </div>
   
      <div id="myInfoWrap" class="myInfoWrap">
         
         <p><span style="color: blue; font-weight: bold;">${(sessionScope.loginuser).name}</span> 고객님, 저희 쇼핑몰을 이용해 주셔서 감사합니다.</p>
         
      </div>   
         <span>아이디</span>
         <span style="color: blue; font-weight: bold;">${(sessionScope.loginuser).userid}</span>
         <br/><br/>
         <span>성명</span>
         <span style="color: green; font-weight: bold;">${(sessionScope.loginuser).name}</span>
         <br/><br/>
         <span>적립금</span>
         <span style="color: black; font-weight: 100;">${(sessionScope.loginuser).point}</span>
      
   
</form>

<div id="myInfoMenu">
   <ul>
      <li>
         <a href="memberRegister.html"><span>MyInfo</span><span class="hover">나의정보</span></a>
      </li>
      <li>
         <a href="Order.html"><span>CART</span><span class="hover">장바구니</span></a>
      </li>
      <li>
         <a href="point.html"><span>POINT</span><span class="hover">적립금</span></a>
      </li>
      <li>   
         <a href="ship.html"><span>SHIP</span><span class="hover">배송정보</span></a>
      </li>
   </ul>

</div>


<jsp:include page="../../Main/footer.jsp"/>