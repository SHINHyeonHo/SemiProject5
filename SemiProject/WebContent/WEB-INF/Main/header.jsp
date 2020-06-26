<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<% String ctxPath = request.getContextPath(); %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">

body {
	margin: 0px;
}

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
	padding: 22px 0 0;
}

div.header_menu {
	text-align: right;
   	float: right;
   	padding-top: 25px;
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

</style>

<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function goLogOut(){ 
	alert("로그아웃 되었습니다.");
	location.href="<%= request.getContextPath()%>/member/logout.hb";
};

</script>

</head>
<body class="main">
   <div id="wrap">
   
	<header id="header">
		<div id="logo" >
			<a href="<%= request.getContextPath()%>/habibi.hb"><!-- 메인페이지 -->
				<img src="/SemiProject/images/Main/HABIBILOGO.png" width="175">
			</a>
		</div>

		<c:if test="${empty sessionScope.loginuser}">
			<div class="header_menu">
				<ul id="header_menu">
					<!--<li class="header_menu">NEWS</li>
					<li class="header_menu">COMPANY</li>
					<li class="header_menu">PHOTO</li>-->
					<li class="header_menu">BOARD</li>
					<li class="header_menu"><span data-toggle="modal" data-target="#myModal">LOGIN</span></li>
					<li class="header_menu"><a href="<%= request.getContextPath()%>/member/myInfo.hb" style="color:black; text-decoration:none;">MYINFO</a></li>
					<li class="header_menu"><a href="<%= ctxPath %>/prod/cartmain.hb" style="color:black; text-decoration:none;">CART</a></li>
				</ul>
			</div>
		</c:if>
		
	<c:if test="${not empty sessionScope.loginuser}">
		
			<div class="header_menu">
				<ul id="header_menu">
				    <c:if test="${sessionScope.loginuser.userid eq 'admin' }">
						<li class="header menu">ADMIN</li>
					</c:if>
					<!--<li class="header_menu">NEWS</li>
					<li class="header_menu">COMPANY</li>
					<li class="header_menu">PHOTO</li>-->
					<li class="header_menu">MEMBER</li>
					<li class="header_menu">PRODUCT</li>
					<li class="header_menu">BOARD</li>
					<li class="header_menu"><span onclick="goLogOut()">LOGOUT</span></li>
					<li class="header_menu"><a href="<%= request.getContextPath()%>/member/myInfo.hb?idx=${sessionScope.loginuser.idx}" style="color:black; text-decoration:none;">MYINFO</a></li>
					<li class="header_menu"><a href="<%= ctxPath %>/prod/cartmain.hb" style="color:black; text-decoration:none;">CART</a></li>
				</ul>
			</div>
	</c:if>	

	</header>