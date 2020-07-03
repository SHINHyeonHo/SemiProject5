<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String ctxPath = request.getContextPath();
%>        
<jsp:include page="../../Main/header.jsp"/>
<jsp:include page="../../Main/sideBar.jsp"/>

<style type="text/css">

 
</style>


<script type="text/javascript">
	$(document).ready(function(){ 
		
	});
</script>

<form name="memberOnePointFrm">
	
      <div class="title">
      	<span class="userid" ></span>
         <h2>POINT</h2>
         <p style="font-size:11px;">${sessionScope.loginuser.name}고객님의 사용가능 적립금 금액 입니다.</p>
      </div>
      <div>
         <div class="myshop">
            <ul>
               <li>
                  <strong class="title">총 적립금</strong>
                  <span class="data">
                     <span id="total_mileage">${pointSum}원</span>&nbsp;
                  </span>
               </li>
           </ul>
         </div>
      </div>
      <div class="myshop-list">
         <table border="1">
            <caption>적립금 내역</caption>
			<colgroup>
	            <col style="width:20%">
	            <col style="width:15%">
	            <col style="width:25%">
	            <col style="width:auto">
            </colgroup>
            <thead>
            	<tr>
            		<th scope="col">주문날짜</th>
                    <th scope="col">적립금</th>
                    <th scope="col">관련 주문</th>
                    <th scope="col">적립내용</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty pointList}">
					<c:forEach var="list" items="${pointList}">
	            	<tr class="record">
	            		<td>${list.orderDate}</td>
	                    <td class="right">${list.point}</td>
	                    <td>${list.comment}</td>
	                    <td class="left">${list.point}</td>
	           		</tr>
		            </c:forEach>          
	            </c:if>
	            <c:if test="${empty pointList}">
            	<tr>
            		<td colspan="4" class="noData">적립금 내역이 없습니다.</td>
               	</tr>
        	    </c:if>  
          	</tbody>
          </table>
       </div>
            	
	</form>
</div>
<jsp:include page="../../Main/footer.jsp"/>