<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
<style type="text/css">

div.main_banner {
	/*border: solid 1px blue;*/
	width: 74%;
}
.category{
	color: gray;
    text-align: left;
    font-style: italic;
    margin-left: 20px;
}

table{
	border-collapse: separate;
	border-spacing: 20px;
	width: 100%;
}

tr{
	height: 300px;
	border: solid 1px red;
}

td{
	/*border: solid 1px black;*/
	position: relative;
	width: 25%;
}


.image{
	position: absolute;
	top: 0px;
	left: 0px;
    height: 195px;
    width: 195px;
   /* background-color: gray; */
}

.description{
	position: absolute;
	bottom: 0px;
    height: 30%;
    width: 100%;
}

.prod_name{
	margin-top: 10px;
}

.prod_name, .prod_price, .prod_color {
	text-align: center;
	font-size: small;
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

</style>


<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>

</head>

<div id="container">

<jsp:include page="../../Main/sideBar.jsp"/>
<jsp:include page="../member/login.jsp" />

	<div id="main_banner" class="main_banner middle">
	
	<div class="category">${param.category}</div>

		<table class="product">
		
		<c:set var="lastPage" value="${fn:substringBefore(Math.ceil(count/16),'.')}"></c:set>		
		
		<c:forEach var="list" items="${prodList}" varStatus="st">
						<!--<c:out value="${fn:length(prodList)}"></c:out>-->
			
			<c:if test="${(st.index+1) % 4 == 1}"><tr></c:if>
			
				<td>
						<a href="/SemiProject/prod/page.hb?category=${list.prod_category}&prodCode=${list.prod_code}">
							<img class="image" src="/SemiProject/images/Product/${list.prod_code}.png"/>
						</a>
						<div class="description">
							<div class="prod_name" onclick="location.href ='/SemiProject/prod/page.hb?category=${list.prod_category}&prodCode=${list.prod_code}'" style="cursor:pointer;">${list.prod_name}</div>
							<div class="prod_color">${list.prod_color}</div>
							<div class="prod_price">${list.prod_price}원</div>
						</div>
					
				</td>
				
			<c:if test="${(st.index+1) % 4 == 0 || fn:length(prodList) < 16}"></tr></c:if>	
			<!--<c:if test="${(st.index+1) == fn:substringBefore(Math.ceil(count/16),'.')}"></tr></c:if>-->
			
		
		</c:forEach>
		
	
		</table>
		
		<div class="page-group">
			<span class="btn-prev"> << &nbsp;</span>
			<ul class="page-list">
			
				<c:forEach var="i" begin="0" end="${lastPage-1}">
			
					<li class="page-list"><a href="?category=${param.category}&page=${i+1}">${i+1}</a></li>
				
				</c:forEach>
				
			</ul>
			<span class="btn-next"> &nbsp; >> </span>
		</div>
		
		
	</div>
	
</div>

	</div>
      
<jsp:include page="../../Main/footer.jsp"/>









