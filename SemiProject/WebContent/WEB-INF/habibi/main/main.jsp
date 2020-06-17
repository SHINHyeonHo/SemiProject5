<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../../Main/header.jsp"/>

<style type="text/css">

 /* 
   
   
div#container {
	border: solid 1px blue;
   	width: 95%;
   	height: 600px;
}

div.middle {
   	display: inline-block;
   	width: 80%;
}

div#left_sidebar {
   	border: solid 1px blue;
   	width: 15%;
   	height: 600px;
}

div#main_banner {
   	height:600px;
}

div#main_banner_top {
  	display: block;
   	border: solid 1px blue;
   	width: 100%;
   	height: 250px;
   	margin-top: 5px;
}

div#main_banner_bottom {
   	display: block;
   	border: solid 1px blue;
   	width: 100%;
   	height: 250px;
   	margin-top: 5px;
}

div.inner {
	border: solid 1px red;
   width: 95%;
   height: 100px;
   font-size: 8pt;
}

div.address {
   border: solid 1px black;
   width: 95%;
   height: 100px;
   font-size: 7pt;
}

div.address > p {
   margin: 0 auto;
}


 */

</style>

<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>

</head>

	<div id="container">
		<div id="left_sidebar" class="middle">
        	<form id="searchBarForm" action="" method="get">
				<input id="search_action" name="search_action" type="hidden" />  <!-- 검색 변수 저장용 -->
				<div>
					<fieldset id="searchbar">
						<input type="text" id="keyword" name="keyword" />
						<input type="image" src="/SemiProject/images/Main/search.png"/> <!-- 돋보기 이미지 -->
					</fieldset>					
				</div>
			</form>
			
			<ul class="side_menu1">
				<li class="side_menu"><a href="">Brand</a></li>
				<li class="side_menu"><a href="">NEW ARRIVALS</a></li>
				<li class="side_menu"><a href="">SEATING</a>
					<ul>
						<li><a href="">SOFA</a></li>
						<li><a href="">RECLINER</a></li>
						<li><a href="">LOUNGE CHAIR</a></li>
						<li><a href="">DINING CHAIR</a></li>
						<li><a href="">BAR CHAIR</a></li>
						<li><a href="">BENCH</a></li>
						<li><a href="">OFFICE CHAIR</a></li>
						<li><a href="">STOOL</a></li>
					</ul>
				</li>
				<li class="side_menu"><a href="">SLEEPING</a>
					<ul>
						<li><a href="">BED</a></li>
						<li><a href="">MATTRESS</a></li>
						<li><a href="">ETC</a></li>
					</ul>
				</li>
				<li class="side_menu"><a href="">TABLES</a>
					<ul>
						<li><a href="">DINING TABLE</a></li>
						<li><a href="">DESK</a></li>
						<li><a href="">SOFA TABLE</a></li>
						<li><a href="">SIDE TABLE</a></li>
					</ul>
				</li>
				<li class="side_menu"><a href="">STORAGE</a>
					<ul>
						<li><a href="">TV BOARD</a></li>
						<li><a href="">SHELF</a></li>
						<li><a href="">CABINET</a></li>
						<li><a href="">DRESSER</a></li>
					</ul>
				</li>
				<li class="side_menu"><a href="">LIGHTINGS</a>
					<ul>
						<li><a href="">TABLE LAMP</a></li>
						<li><a href="">FLOOR LAMP</a></li>
						<li><a href="">WALL LAMP</a></li>
						<li><a href="">PENDANT</a></li>
						<li><a href="">ETC</a></li>
					</ul>
				</li>
				<li class="side_menu"><a href="">ACCESSORIES</a>
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
				</li>
			</ul>
		</div>
         
         <div id="main_banner" class="middle">
            <div id="main_banner_top">
            </div>
            
            <div id="main_banner_bottom">
            </div>
         </div>
      </div>
      
      
<jsp:include page="../../Main/footer.jsp"/>