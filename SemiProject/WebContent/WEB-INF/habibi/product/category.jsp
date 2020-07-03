<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">

div.main_banner {
	/*border: 1px solid black;*/
	width: 85%;
}
.category{
	color: gray;
    text-align: left;
    font-style: italic;
    margin-left: 20px;
}

table{
	/*border: 1px solid black;*/
	display:table-cell;
	border-collapse: separate;
	border-spacing: 80px;
}


tr{
	height: 300px;
}

.image{
    height: 195px;
    width: 195px;
}


.prod_name, .prod_price, .prod_color, .order-sum {
	text-align: center;
	font-size: small;
}

.notice{
	text-align:center;
	margin-top: 10px;
	width: 100%;
	height: 20px;
}

span.best{
	text-align:center;
	padding: 0px 3px;
	color: white;
	background-color: #0404B4;
	font-size: xx-small;
}

span.new{
	text-align:center;
	padding: 0px 3px;
	color: white;
	background-color: orange;
	font-size: xx-small;
}

span.soldout{
	text-align:center;
	padding: 0px 3px;
	color: white;
	background-color: red;
	font-size: xx-small;
}

#left_sidebar, content {
	display: inline-block;
}

.page-group{
	text-align: center;
}

.page-list{
	display: inline-block;
}

.carousel-control.left, .carousel-control.right {
    background-image: none;
}


.carousel-indicators li{
    display:inline-block;
    width:10px;
    height:10px;
    margin:1px;
    text-indent:-999px;
    cursor:pointer;
    background-color: white !important;
    border:1px solid gray;
    border-radius:10px;
}

#top-best{
	margin-top: 20px;
	text-align: center;
	font-size: medium;
	font-weight: normal;
}


</style>


<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	var select = "${select}";
	
	if( select != "") {
		$("#sel").val(select).prop("selected", true);
	}
	
	$("#searchWord").val("${searchWord}");
});

</script>

</head>

<div>

<jsp:include page="../../Main/sideBar.jsp"/>

	<div id="main_banner" class="main_banner middle">
	
	<div class="category">${param.category}</div>


<!--  Carousel start -->
<c:if test="${empty param.searchWord}">

	<div id="top-best">BEST</div>

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
						<table class="product best-table">
							<tr class="best-table-tr">
								  <c:forEach var="list" items="${prodBestList}" begin="0" end="3" varStatus="st">
									<td class="td">
											<a href="/SemiProject/prod/page.hb?category=${list.prod_category}&prodCode=${list.prod_code}">
												<img class="image" src="/SemiProject/images/Product/${list.prod_code}.png"/>
											</a>
											<div class="description">
											
												<div class="notice">
													<c:if test="${list.prod_new_date < 50}">
														<span class="new">NEW</span> 
													</c:if>
													<c:if test="${list.order_sum != 0}">
														<span class="best">BEST</span> 
													</c:if>
												</div> 
												<div class="prod_name" onclick="location.href ='/SemiProject/prod/page.hb?category=${list.prod_category}&prodCode=${list.prod_code}'" style="cursor:pointer;">${list.prod_name}</div>
												<div class="prod_color">${list.prod_color}</div>
												<div class="prod_price"><fmt:formatNumber type="number" pattern="###,###" value="${list.prod_price}"/>&nbsp;원</div>
											</div>
									</td>
								</c:forEach>
							</tr>
						</table>

				</div>

				<div class="item">
						<table class="product best-table">
							<tr class="best-table-tr">
								  <c:forEach var="list" items="${prodBestList}" begin="4" end="7" varStatus="st">
									<td class="td">
											<a href="/SemiProject/prod/page.hb?category=${list.prod_category}&prodCode=${list.prod_code}">
												<img class="image" src="/SemiProject/images/Product/${list.prod_code}.png"/>
											</a>
											<div class="description">
											
												<div class="notice">
													<c:if test="${list.prod_new_date < 50}">
														<span class="new">NEW</span> 
													</c:if>
													<c:if test="${list.order_sum != 0}">
														<span class="best">BEST</span> 
													</c:if>
												</div> 
												<div class="prod_name" onclick="location.href ='/SemiProject/prod/page.hb?category=${list.prod_category}&prodCode=${list.prod_code}'" style="cursor:pointer;">${list.prod_name}</div>
												<div class="prod_color">${list.prod_color}</div>
												<div class="prod_price"><fmt:formatNumber type="number" pattern="###,###" value="${list.prod_price}"/>&nbsp;원</div>
											</div>
									</td>
								</c:forEach>
							</tr>
						</table>				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
</c:if>
<!-- Carousel end -->	

		

		<table class="product">
				
		  <c:forEach var="list" items="${prodList}" varStatus="st">
			
			<c:if test="${(st.index+1) % 4 == 1}"><tr></c:if>
			
				<td class="td">
						<a href="/SemiProject/prod/page.hb?category=${list.prod_category}&prodCode=${list.prod_code}">
							<img class="image" src="/SemiProject/images/Product/${list.prod_code}.png"/>
						</a>
						<div class="description">
						
							<div class="notice">
								<c:if test="${list.prod_new_date < 50 && list.prod_stock != 0}">
									<span class="new">NEW</span> 
								</c:if>
								<c:if test="${list.order_sum != 0 && list.prod_stock != 0}">
									<span class="best">BEST</span> 
								</c:if>
								<c:if test="${list.prod_stock == 0}">
									<span class="soldout">Sold out</span>
								</c:if>
							</div> 
							<div class="prod_name" onclick="location.href ='/SemiProject/prod/page.hb?category=${list.prod_category}&prodCode=${list.prod_code}'" style="cursor:pointer;">${list.prod_name}</div>
							<div class="prod_color">${list.prod_color}</div>
							<div class="prod_price"><fmt:formatNumber type="number" pattern="###,###" value="${list.prod_price}"/>&nbsp;원</div>
						</div>
					
				</td>
					

			<c:if test="${(st.index+1) % 4 == 0 || st.last}"></tr></c:if>			
		
		</c:forEach>
		
	
		</table>
		
		<div class="page-group">
			<span class="btn-prev"> << &nbsp;</span>
			<ul class="page-list">
			
		
				<c:set var="lastPage" value="${fn:substringBefore(Math.ceil(count/16),'.')}"></c:set>		
				<c:if test="${lastPage > 0}">
				
					<c:forEach var="i" begin="0" end="${lastPage-1}">
				
						<li class="page-list"><a href="?category=${param.category}&page=${i+1}">${i+1}</a></li>
					
					</c:forEach>
				
				</c:if>
				
			</ul>
			<span class="btn-next"> &nbsp; >> </span>
		</div>
		
		
	</div>
	
 </div>

</div>
      
<jsp:include page="../../Main/footer.jsp"/>