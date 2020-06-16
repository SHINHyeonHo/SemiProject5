<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/SemiProject/images/Main/titleImage.png">

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
	padding: 70px 0 30px;
	overflow: hidden;
}

div#logo {
	display: block;
	margin: 0;
	float: left;
}

div.main_menu {
	float: right;
	padding: 22px 0 0;
}

a {
	text-decoration: none;
	font-weight: bold;
}

ul {
	list-style-type: none;
	margin: 0;
}

ul#menu>li {
	margin-left: 5px;
	margin-right: 5px;
	display: inline;
}



/*  */





/*  */


#footer {
	width: 1200px;
	margin: 80px auto 0;
}

div.inner {
	border: solid 1px blue;
}

div.address {
	border: solid 1px red;
}

.address p {
	padding-left: 70px;
	font-size: 11px;
}


</style>

<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"></script>

</head>
<body>
<body class="main">
	<div id="wrap">

		<header id="header">
			<div id="logo">
				<a href="">
					<!-- 메인페이지 --> <img src="/SemiProject/images/Main/HABIBILOGO.png" width="175">
				</a>
			</div>

			<div class="main_menu">
				<ul id="menu">
					<li><a href="">NEWS</a></li>
					<li><a href="">COMPANY</a></li>
					<li><a href="">PHOTO</a></li>
					<li><a href="">LOGIN</a></li>
					<li><a href="">CART</a></li>
				</ul>
			</div>
		</header>

		<div id="container">
			<div id="left_sidebar" class="middle"></div>

			<div id="main_banner" class="middle">
				<div id="main_banner_top"></div>

				<div id="main_banner_bottom"></div>
			</div>
		</div>

		<div id="footer">
			<div class="inner">
			</div>
	
	
			<div class="address">
				<p>하비비 가구몰. 대표 권순근 / 120-10-70245 / 제2020-서울종각-02195호[사업자정보확인] /
					개인정보관리 권순근 / HAVIVI@HAVIVI.CO.KR / COPYRIGHT &copy; 2020 하비비 ALL
					RIGHTS RESERVED</p>
			</div>
		</div>
	</div>
</body>
</html>