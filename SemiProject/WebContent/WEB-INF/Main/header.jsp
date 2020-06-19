<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<script type="text/javascript"></script>

</head>
<body class="main">
   <div id="wrap">
   
	<header id="header">
		<div id="logo" >
			<a href="<%= request.getContextPath()%>/habibi.hb"><!-- 메인페이지 -->
				<img src="/SemiProject/images/Main/HABIBILOGO.png" width="175">
			</a>
		</div>

		<div class="header_menu">
			<ul id="header_menu">
				<li class="header_menu">NEWS</li>
				<li class="header_menu">COMPANY</li>
				<li class="header_menu">PHOTO</li>
				<li class="header_menu"><span data-toggle="modal" data-target="#myModal">LOGIN</span></li>
				<li class="header_menu"><a href="<%= request.getContextPath()%>/prod/cartmain.hb">CART</a></li>
			</ul>
		</div>
	</header>