<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../../Main/header.jsp"/>

<jsp:include page="../../Main/sideBar.jsp"/>

<script type="text/javascript">

   $(document).ready(function() {
	   
	   var d = new Date();
	   
	   var year = d.getFullYear()
	   var month = d.getMonth()
	   var day = d.getDate()
	   $(".today").text(year+" 년 "+(month+1)+" 월 "+day+" 일 ");
   });
   

</script>


<title>결제 완료</title>

   <div style="float: right; width: 75%;">
      <h2>결제정보</h2>
        <p>주문 감사합니다. ${(sessionScope.loginuser).name} 님의 결제 내용은 다음과 같습니다.</p>  
        <nav class="navbar navbar-default" style="margin-bottom: 0;">
           <div class="container-fluid">
             <div class="navbar-header">
                  <a class="navbar-brand" href="#">결제완료</a>
             </div>
             <ul class="nav navbar-nav">
                  <li class="active" id="payInfo"><a href="/SemiProject/admin/payEnd.hb">결제정보</a></li>
                  <li id="sinpInfo"><a href="/SemiProject/admin/payEnd.hb">배송정보</a></li>
             </ul>
           </div>
      </nav>
        <table class="table" >
           <tbody>
               
               <tr>
                 <td>아이디</td>
                 <td>${(sessionScope.loginuser).userid}</td>
               </tr>
               <tr>
                 <td>주문자명</td>
                 <td>${(sessionScope.loginuser).name}</td>
               </tr>
               <tr>
                 <td>주소</td>
                 <td>${orderAddress}</td>
               </tr>
               <tr>
                 <td>배송상태</td>
                 <td>배송준비중</td>
               </tr>
               <tr>
                 <td>배송메모</td>
                 <td>${orderMemo}</td>
               </tr>
               <tr>
                 <td>반품/환불/취소 요청</td>
                 <td>없음</td>
               </tr>
               <tr>
                 <td>주문일자</td>
                 <td class="today"></td>
               </tr>
               
               <tr>
                 <td>연락처</td>
                 <td>${orderMobile}</td>
               </tr>
               
               <tr>
                 <td>금액</td>
                 <td><fmt:formatNumber value="${ordersumtotalPrice}" pattern="###,###" /> 원</td>
               </tr>
               
               <tr>
                 <td>적립금</td>
                 <td><fmt:formatNumber value="${point}" pattern="###,###" /> 원</td>
               </tr>
            </tbody>
        </table>
   </div>

</div>

<jsp:include page="../../Main/footer.jsp"/>