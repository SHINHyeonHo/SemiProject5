<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
   
%>        
<jsp:include page="../../Main/header.jsp"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
    div#mypage	{
   		border: solid 2px black;
   		margin: 0px auto;
      	width: 80%;
      	height: 80%;
      	display: inline-block;
   }
   
   div	{
   		
   		font-family: "맑은고딕";
   		color: #555;
   		margin: 0 auto;
   		width: 100%;
   }
   
  div#balance {
      border: solid 1px red;
      width: 95%;
      height: 600px;
      display: inline-block;
   }
   
   div#left_sidebar {
      border: solid 1px blue;
      width: 15%;
      height: 400px;
      display: inline-block;
      margin-top: 90px;
      float: left;
   }
   
   div#title	{
   		border: none;
   		text-align: center;
   		margin-top : 40px;
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
   
  div.button_line	{
  		text-align: center;
  		margin-top: 50px;
  		
  		
  
  }
  
  div.button_line > ul >li > a	{
  		width: 100px;
  		height: 70px;
  		display: inline-block;
  		
  }
   
  div.button_line > ul >li > a > span {
  		line-height: 70px;
  		
  		
  }
  
  
   
  div.main_menu > ul > li > a	{
  	border: solid 1px black;
  	background-color: white;
  	text-align: right;
  	margin-right: 40px;
  	float:right;
  	line-height: 20px;
  	font-size: 13px;
  }
  
  div.main_menu > ul > li > strong	{
  		margin-top: 200px;
  }
  
  li.etc {
  		margin-top: 20px;
  }
  
  div.main_menu	{
  		background-color: #E6E6E6;
  		text-align: left;
 		width: 50%; 
 		line-height: 30px;	
 		height: 200px; 
 		padding-top: 20px;
 		
  }
  
  ul	{
   		list-style: none;
   		margin-top: 30px;
   }
   
   ul#button_line1{
   		margin-top: 5px;
   		margin-bottom: 200px;
   }
   
  a	{
  	text-decoration: none;
  } 
  
  .hover {
  	display: none;
  }
  
</style>



	<div id= "balance">
			<div id="mypage">
				<div id="contain">
					<div id="title">
						<h2>MY PAGE</h2>
					</div>
					
					<div class="main_menu">
						<ul>
						
					        <li class="">
					            <strong class="title">총적립금액</strong>
					            <strong class="data">0 포인트</strong>
					        </li> 
					        <li class="etc">
					            <strong class="title">총주문</strong>
					            <strong class="data">0 회</strong>
					        </li>
					    
					    </ul>
					</div>
				</div>
				<div class="button_line">
				    <ul id="button_line1">
						<li>
					      <a href="Mem_Cart.html">
					      	<span class="height">ORDER</span><br>
					      	<span class="hover">주문내역</span>
					      </a>
					    </li>
					    <li>
					      <a href="Mem_InfoUpdate.html"><span class="height">MY INFO</span><br>
					      <span class="hover">나의 정보</span>
					      </a>
					    </li>
					   <!-- <li>
					      <a href=""><span class="height">WISH LIST</span><br>
					      <span class="hover">관심상품</span>
					      </a>
					   </li> -->
					   
					   
					</ul>
					
					<!--  <ul id="button_line2">
						<li>
					       <a href="Mem_point.html"><span class="height">POINT</span><br>
					       <span class="hover">적립금</span>
					       </a>
					    </li>
					    
					    <li>
					       <a href=""><span>ADDRESS</span><span class="hover">주소록</span></a>
					    </li>
					</ul>	-->
				</div>
			</div>
			<div id="left_sidebar" class="middle">
		    </div>
	    </div>

<jsp:include page="../../Main/footer.jsp"/>