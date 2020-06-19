<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
<style type="text/css">

div.main_banner {
	border: solid 1px blue;
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

}

td{
	position: relative;
	width: 25%;
	border: 1px solid red;
}


.image{
	position: absolute;
	top: 0px;
    height: 70%;
    width: 100%;
    background-color: gray;
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
</style>


<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>

</head>

<div id="container">

<jsp:include page="../../Main/sideBar.jsp"/>
<jsp:include page="../member/login.jsp" />

	<div id="main_banner" class="main_banner middle">
	
	<div class="category">SLEEPING</div>

		<table class="product">
		<c:forEach var="list" items="${prodList}" varStatus="st">
			
			<c:if test="${(st.index+1) % 4 == 1}">
				<c:out value="${(st.index+1) % 4 == 1}"/>
				<c:out value="<tr>"/>
			</c:if>
			
				<td>
					<div class="image">
						<img src="../../images/${list.prod_code}.png"/>
						<c:out value="../../images/${list.prod_code}.png"/>
					</div>
					<div class="description">
						<div class="prod_name">${list.prod_name}</div>
						<div class="prod_color">${list.prod_color}</div>
						<div class="prod_price">${list.prod_price}원</div>
					</div>
				</td>
			
			
			<c:if test="${(st.index+1) % 4 == 0}">
				<c:out value="${(st.index+1) % 4 == 0}"/>
				<c:out value="</tr>"/>
			</c:if>
			
		
		</c:forEach>
		
		<!-- 
			<tr>
				<td>
					<div class="image">
						<img src=""/>
					</div>
					<div class="description">
						<div class="prod_name">VINTAGE QUEEN BED</div>
						<div class="prod_color">brown</div>
						<div class="prod_price">3,567,000원</div>
					</div>
				</td>				
				<td>
					<div class="image">
						<img src=""/>
					</div>
					<div class="description">
						<div class="prod_name">CASTOR FABRIC BED</div>
						<div class="prod_color">brown</div>
						<div class="prod_price">3,567,000원</div>
					</div>
				</td>				
				<td>
					<div class="image">
						<img src=""/>
					</div>
					<div class="description">
						<div class="prod_name">STANDARD BED</div>
						<div class="prod_color">brown</div>
						<div class="prod_price">3,567,000원</div>
					</div>
				</td>		
			</tr>
			
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			 -->
			 
			 
		</table>
		
	</div>
	
</div>

	</div>
      
<jsp:include page="../../Main/footer.jsp"/>









