<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
   
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

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

a {
	text-decoration: none;
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

div#container {
	min-height: 1500px;
}

</style>

<div id="container">

<div id="left_sidebar" class="left_sidebar middle">
	<div class="searchBar">
		<form id="searchBarForm" action="" method="get">
			<input id="search_action" name="search_action" type="hidden" /> <!-- 검색 변수 저장용 -->
			<div class="search-container">
				<input type="text" placeholder="Search.." name="search" size="20">
				<button type="submit" class="search"> <i class="fa fa-search"></i>
				</button>
			</div>
		</form>
	</div>

	<div>
		<ul id="side" class="side_menu middle">
	  <!--  <li class="side_menu1"><a href="">Brand</a></li>
			<li class="side_menu1"><a href="">NEW ARRIVALS</a></li>
			<li class="side_menu1"><a href="">CART</a>-->
<!--				<ul>
					<li><a href="">SOFA</a></li>
					<li><a href="">RECLINER</a></li>
					<li><a href="">LOUNGE CHAIR</a></li>
					<li><a href="">DINING CHAIR</a></li>
					<li><a href="">BAR CHAIR</a></li>
					<li><a href="">BENCH</a></li>
					<li><a href="">OFFICE CHAIR</a></li>
					<li><a href="">STOOL</a></li>
				</ul>-->
			</li>
<!--			<li class="side_menu1"><a href="/SemiProject/prod/cartAdd.up">CART</a>
				<ul>
					<li><a href="">BED</a></li>
					<li><a href="">MATTRESS</a></li>
					<li><a href="">ETC</a></li>
				</ul>
			</li>-->
			<li class="side_menu1"><a href="<%= request.getContextPath() %>/member/myInfo.hb?idx=${sessionScope.loginuser.idx}">MYPAGE</a>
<!--				<ul>
					<li><a href="">DINING TABLE</a></li>
					<li><a href="">DESK</a></li>
					<li><a href="">SOFA TABLE</a></li>
					<li><a href="">SIDE TABLE</a></li>
				</ul>-->
			</li>
			
			<li class="side_menu1"><a href="/SemiProject/member/memberEdit.hb?idx=${sessionScope.loginuser.idx}">MYINFO</a>
<!--				<ul>
					<li><a href="">TV BOARD</a></li>
					<li><a href="">SHELF</a></li>
					<li><a href="">CABINET</a></li>
					<li><a href="">DRESSER</a></li>
				</ul>-->
			</li>
			<li class="side_menu1"><a href="/SemiProject/prod/cartEdit.hb?idx=${sessionScope.loginuser.idx}">CART</a></li>
			<li class="side_menu1"><a href="/SemiProject/member/point.hb?idx=${sessionScope.loginuser.idx}">POINT</a>
<!-- 				<ul>
					<li><a href="">TABLE LAMP</a></li>
					<li><a href="">FLOOR LAMP</a></li>
					<li><a href="">WALL LAMP</a></li>
					<li><a href="">PENDANT</a></li>
					<li><a href="">ETC</a></li>
				</ul>  -->
			</li> 
<!--			<li class="side_menu1"><a href="">ACCESSORIES</a>
				<ul>
					<li><a href="">AV</a></li>
					<li><a href="">CLOCK</a></li>
					<li><a href="">COAT RACK</a></li>
					<li><a href="">CUSHION</a></li>
					<li><a href="">CERAMICS</a></li>
					<li><a href="">FRAGRANCE</a></li>
					<li><a href="">MIRROR</a></li>
					<li><a href="">PARTS</a></li>
					<li><a href="">POSTER</a></li>
					<li><a href="">RUG</a></li>
					<li><a href="">ETC</a></li>
				</ul>
			</li> -->
		</ul>

	</div>
</div>
