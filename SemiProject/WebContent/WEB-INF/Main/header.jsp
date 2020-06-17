<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

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
}
	

</style>

<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"></script>

</head>
<body>
<body class="main">
   <div id="wrap">
   
	<header id="header">
		<div id="logo" >
			<a href=""><!-- 메인페이지 -->
				<img src="/SemiProject/images/Main/HABIBILOGO.png" width="175">
			</a>
		</div>

		<div class="header_menu">
			<ul id="header_menu">
				<li class="header_menu">NEWS</li>
				<li class="header_menu">COMPANY</li>
				<li class="header_menu">PHOTO</li>
				<li class="header_menu">LOGIN</li>
				<li class="header_menu">CART</li>
			</ul>
		</div>
	</header>