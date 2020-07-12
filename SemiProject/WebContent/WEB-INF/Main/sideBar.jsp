<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

.search-container {
  float: left;
  margin-bottom: 10px;
}

input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 10px;
  border: solid 0.5px gray;
}

button.search {
  width: 28px;
  height: 28px;
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

ul {
	list-style-type: none;
	padding: 0;
}


li > ul {
	padding-left: 20px;
}

div.left_sidebar {
	width: 15%;
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
	overflow:hidden;
	height:auto;
	min-height: 800px;
}

li.side_menu1 {
	margin: 10px 0 10px 0;
}

</style>

<script type="text/javascript">

	$(document).ready(function() {
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13){   
				goSearch(); 
			}
		});
	});
	function goSearch() {
		if($("#searchWord").val().trim() == "") {
			alert("검색어를 입력해주세요.");
			return;
		}
		else{
			var frm = document.searchBarForm;
			frm.method = "get";
			frm.action = "<%= request.getContextPath()%>/prod/searchProduct.hb";
			frm.submit();
		}
	}
	
</script>

<div id="container">

<div id="left_sidebar" class="left_sidebar middle">
	<div class="searchBar">
		<form name="searchBarForm">
			<div class="search-container">
				<div>
					<select name="sel" id="sel">
	                        <option value="ALL" selected>ALL</option>
	                        <option value="prod_name">NAME</option>
	                        <option value="prod_category">CATEGORY</option>
	                        <option value="prod_color" >COLOR</option>
	                        <option value="prod_code">CODE</option>
	                        <option value="prod_mtl">MATERIAL</option>
	                </select>
                </div>
				<input type="text" placeholder="Search.." id="searchWord" name="searchWord" size="20">
				<button type="button" id="searchProduct" class="search" onclick="goSearch();"><i class="fa fa-search"></i></button>
			</div>
		</form>
	</div>

	<div>
		<ul class="side_menu middle">
			<li class="side_menu1"><a href="" style="color:black;">Brand</a></li>
			<li class="side_menu1"><a href="" style="color:black;">NEW ARRIVALS</a></li>
			<li class="side_menu1"><a href="/SemiProject/prod/category.hb?category=seating" style="color:black;">SEATING</a>
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
			<li class="side_menu1"><a href="/SemiProject/prod/category.hb?category=sleeping" style="color:black;">SLEEPING</a>
<!--				<ul>
					<li><a href="">BED</a></li>
					<li><a href="">MATTRESS</a></li>
					<li><a href="">ETC</a></li>
				</ul>-->
			</li>
			<li class="side_menu1"><a href="/SemiProject/prod/category.hb?category=table" style="color:black;">TABLE</a>
<!--				<ul>
					<li><a href="">DINING TABLE</a></li>
					<li><a href="">DESK</a></li>
					<li><a href="">SOFA TABLE</a></li>
					<li><a href="">SIDE TABLE</a></li>
				</ul>-->
			</li>
			<li class="side_menu1"><a href="/SemiProject/prod/category.hb?category=storage" style="color:black;">STORAGE</a>
<!--				<ul>
					<li><a href="">TV BOARD</a></li>
					<li><a href="">SHELF</a></li>
					<li><a href="">CABINET</a></li>
					<li><a href="">DRESSER</a></li>
				</ul>-->
			</li>
			<li class="side_menu1"><a href="/SemiProject/prod/category.hb?category=lighting" style="color:black;">LIGHTING</a>
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