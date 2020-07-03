<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>주문상세정보(관리자)</title>
    <link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

    <style>

        .menu{
            margin: 20px 10px 10px 10px;
            font-weight: bold;
        }

        table{
            width: 700px;
        }

        table, tr, td{
            border-collapse: collapse;
            border: 1px solid black;
        }

        td.title{
            width: 120px;
            background-color: darkgray;
            color: white;
        }

        td.description{
            width: 280px;
        }

        td{
            padding: 10px;           
        }


    </style>
</head>
<body>

    <div class="menu">주문상세정보</div>

    <table>
        <tr>
            <td class="title">상품주문번호</td>
            <td colspan="3">${orderlist.order_code}</td>
        </tr>
        
        
        <c:forEach var="order" items="${orderDetailList}" varStatus="status">
	        <tr>
	            <td class="title" >상품명</td>
	            <td colspan="">${order.fk_prod_name}</td>
	            <td class="title" >주문수량</td>
	            <td colspan="">${order.order_oqty}</td>             
	        </tr>
        </c:forEach>
          
              
        <tr>
            <td class="title" style="border-top: 1px solid red">상품주문상태</td>
            <td colspan="3">
            	<c:if test="${orderlist.order_ship eq '0'}">
            		배송준비중
            	</c:if>
            	
            	<c:if test="${orderlist.order_ship eq '1'}">
            		배송완료
            	</c:if>
            </td>
        </tr>
        
        <tr>
            <td class="title">구매자ID</td>
            <td colspan="3">${orderlist.fk_userid}</td>
        </tr>
        
        <tr>
            <td class="title">총상품금액</td>            
            <td class="description"><fmt:formatNumber value="${orderlist.order_price}" pattern="###,###"/>원</td>
            <td class="title">사용적립금</td>            
            <td><fmt:formatNumber value="${orderlist.order_point}" pattern="###,###"/>원</td>
        </tr>

    </table>

    <div class="menu">배송지정보</div>

    <table>
        <tr>
            <td class="title">수취인명</td>
            <td colspan="3">${orderlist.order_name}</td>
        </tr>
        <tr>
            <td class="title">연락처</td>
            <td class="description" colspan="3">${orderlist.order_mobile}</td>
 
        </tr>
        <tr>
            <td class="title">배송지</td>
            <td colspan="3">${orderlist.order_address}</td>
        </tr>
        <tr>
            <td class="title">배송메모</td>
            <td colspan="3">${orderlist.order_memo}</td>
        </tr>

    </table>

</body>
</html>