<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String ctxPath = request.getContextPath();
   
%>        
<jsp:include page="../../Main/header.jsp"/>


<style type="text/css">

	div#ListTittle{
	/*	border: solid 1px blue; */
		float: right;
		width: 78%;
		
	}
	div#ListContext{
	/*	border: solid 1px green; */
		float: right;
		width: 78%;
		text-align: center;
		
	}
	div#tittle{
	/*	border: solid 1px green; */
		width: 100%;
		
		
	}
</style>
<jsp:include page="../../Main/sideBar.jsp"/>

<form name="orderFrm">
	<div id="OrderList" class="OrderList">
	
	<div id="ListTittle" class="ListTittle">
	<table>
		<thead>
			<tr>
				<th>
				<div class="tittle" id="tittle">
					<h2>ORDER LIST</h2>
					<p>주문내역조회</p>
				</div>
				</th>
			</tr>	
			<tr>
				<th>
					<p><span style="color: blue; font-weight: bold;">${(sessionScope.loginuser).name}</span> 고객님, 저희 쇼핑몰을 이용해 주셔서 감사합니다.</p>
					<p>ORDER PRODUCT INFO</p>
				</th>
			</tr>
			
		</thead>
	</table>
	</div>
	
	<div id="ListContext" class="ListContext">
	
	<table>
		<tbody>
			<tr style="border-top: 1px solid #dddddd;">
				<th>주문번호 &nbsp;&nbsp;</th>
				<th>주문일자&nbsp;&nbsp;</th>
				<th>상품명&nbsp;&nbsp;</th>
				<th>수량&nbsp;&nbsp;</th>
				<th>상품구매금액&nbsp;&nbsp;</th>
				<th style="border-bottom: 1px solid #dddddd;">주문처리상태&nbsp;&nbsp;</th>
				<th style="border-bottom: 1px solid #dddddd;">취소/교환/반품&nbsp;&nbsp;</th>
				
			</tr>			
			
			<c:if test="${memberOrderList == null || empty memberOrderList}">
			<tr style="border-bottom: 1px solid #dddddd;">
				<td colspan="6" align="center">
					<span style="color: red; font-weight: bold;">
	   	    			주문하신 내역이 없습니다.
	   	   			 </span>
				</td>
			</c:if>
			
			<c:if test="${not empty memberOrderList}">
				<c:forEach var="list" items="${memberOrderList}" varStatus="status">
					<td>
						<span class="order_code">${list.order_code}&nbsp;&nbsp;</span>
						
					</td>
					<td>
						<span class="order_date">${list.order_date}&nbsp;&nbsp;</span>
					
					</td>
					<td>
						<span class="prod_name">${list.prod_name}&nbsp;&nbsp;</span>
					
					</td>
					<td>
						<span class="order_oqty">${list.order_oqty}&nbsp;&nbsp;</span>
					
					</td>
					<td>
						<fmt:formatNumber value="${list.order_price}" pattern="###,###" /> 원&nbsp;&nbsp;
					
					</td>
					<td>
						 <c:if test="${list.order_ship == 0}">
						 	<span>입금확인&nbsp;&nbsp;</span>	
					
						 </c:if>
						 <c:if test="${list.order_ship == 1}">
						 	<span>주문완료&nbsp;&nbsp;</span>	
					
						 </c:if>
					</td>
					<td>
						 <c:if test="${list.order_refund == 0}">
						 	<span>배송전&nbsp;&nbsp;</span>	
					
						 </c:if>
						 <c:if test="${list.order_refund == 1}">
						 	<span>배송완료&nbsp;&nbsp;</span>	
					
						 </c:if>
					</td>
				</c:forEach>
				
			</c:if>
			
		</tbody>
	</table>
	</div>
	
	</div>
	
</form>

<jsp:include page="../../Main/footer.jsp"/>