<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
<style type="text/css">

div.main_banner {
	width: 85%;
}
.category{
	color: gray;
    text-align: left;
    font-style: italic;
    margin-left: 20px;
}

table{
	display:table-cell;
	border-collapse: separate;
	border-spacing: 50px;
}

tr{
	height: 300px;
	border: solid 1px red;
}


.image{
    height: 195px;
    width: 195px;
   /* background-color: gray; */
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

	<div id="main_banner" class="main_banner middle">
	
	<div class="category">${param.category}</div>

		<table class="product">
				
		<c:forEach var="list" items="${prodList}" varStatus="st">
			
			<c:if test="${(st.index+1) % 4 == 1}"><tr></c:if>
			
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
				

			<c:if test="${(st.index+1) % 4 == 0 || st.last}"></tr></c:if>			
		
		</c:forEach>
		
	
		</table>
		
		<div class="page-group">
			<span class="btn-prev"> << &nbsp;</span>
			<ul class="page-list">
			
				<c:set var="lastPage" value="${fn:substringBefore(Math.ceil(count/16),'.')}"></c:set>		
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