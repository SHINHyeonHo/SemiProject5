<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>주문목록(관리자)</title>
    <link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

    <style>

        body{
            margin: 20px;
        }

        .admin{
            color: dimgray;
            margin-top: 20px;
            text-align: left;
            font-style: italic;
        }

        .container{
            width: 1300px;
            display: grid;
            grid-template-columns: 200px 1fr;
        }

        .item{
            text-align: center;
        }

        #sidebar{
            background-color: dimgray;
            color: white;
            padding-right: 10px;
        }

        #main{
            margin-left: 60px;
        }

        ul{
            margin-top: 20px;
            list-style: none;
            font-size: large;
        }

        li{
            padding: 10px;
            margin: 30px 0;
        }

        li:hover{
            font-style: italic;
            text-decoration-line: underline;
        }

        a{
            text-decoration-line: none;
            color: white;
        }

        table, th, tr, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th{
            background-color: lightgray;
            color: dimgray;
        }

        th, td{
            padding: 10px;
            width: 250px;
        }

        td.order{
            text-decoration-line: underline;
        }

        td.order:hover{
            cursor: pointer;
        }

        .menu{
            text-align: left;
            font-style: italic;
            margin: 20px 10px 10px 10px;
            font-weight: bold;
        }

        div#top{
            text-align: center;
            font-size: large;
            color: dimgray;
            margin: 20px 10px;
        }

        td.confirm{
            margin-top: 10px;
            text-align: right;
            border-left: hidden;
            border-right: hidden;
            border-bottom: hidden;
        }

        span{
            padding-right: 30px;
            font-weight: bold;
            font-size: large;
        }

        td.number{
            text-align: right;
        }

		span.ordershopping{
			border:solid 2px gray;
			background-color: gray;
			color: white;						
		}
    </style>

</head>
<body>

<header></header>

<div class="admin">HABIBI 관리자 페이지</div>

<div class = "container">

    <ul class="item" id="sidebar">
        <li><a href="">상품관리</a></li>
        <li><a href="">주문관리</a></li>
        <li><a href="">회원관리</a></li>
        <li><a href="">정산관리</a></li>
        <li><a href="">문의/리뷰</a></li>
        <li><a href="/SemiProject/habibi.hb">메인으로</a></li>
    </ul>

    <div class="item" id="main">

        <div id="top">주문관리</div>
        <table>

            <tr>
                <td>배송준비중</td>
                <td class="number"><span>${n}</span>건</td>
               
                <td>배송완료</td>
                <td class="number"><span>${r}</span>건</td>
            </tr>

        </table>


        <div class="menu">주문현황</div>      
        
		        <table>
		            <th><input type="checkbox" id="allCheck">발주</th>
		            <th>주문번호</th>
		            <th>주문회원</th>
		            <th>주문일자</th>
		            <th>배송상태</th>
			
			<c:if test="${empty orderlist}">
		      <tr>
		           <td colspan="4" align="center">
		             <span style="color: red; font-weight: bold;">
		              	  주문된 상품이 없습니다.
		             </span>
		           </td>   
		      </tr>
   			</c:if>
   			
		    <!-- 반복문으로 이루어질 부분 -->
		    
		    <c:if test="${not empty orderlist}">
        		<c:forEach var="order" items="${orderlist}">	
		            <tr>
		                <td><input type="checkbox" name="order_code" value="${order.order_code}"></td>
		                <td class="order">${order.order_code}</td>
		                <td>${order.fk_userid}</td>
		                <td>${order.order_date}</td>
		                <td>배송준비중</td>
		            </tr>
		        </c:forEach>   
			</c:if>    
		             		                         
		            <tr>
		                <td class="confirm" colspan="5">
		                	<span class="ordershopping" style="cursor: pointer;" onClick="goShipment()">배송처리</span>
		                	<form name="goShipmentFrm">
		                		<input type="hidden" name="ordercodejoin" />
		                	</form>
		                </td>             
		            </tr>
		            	
				
		        </table>
		        
			<div style="color: black;">
    		${pageBar}
    		</div>
			
			
		
        <div class="menu">배송완료</div>
        <table>

            <th>주문번호</th>
            <th>주문회원</th>
            <th>배송일자</th>
            <th>배송상태</th>

			<c:if test="${empty orderCompletelist}">
		      <tr>
		           <td colspan="3" align="center">
		             <span style="color: red; font-weight: bold;">
		              	  배송완료 된 상품이 없습니다.
		             </span>
		           </td>   
		      </tr>
   			</c:if>	
			
     
            <!-- 반복문으로 이루어질 부분 -->
            <c:if test="${not empty orderCompletelist}">
        		<c:forEach var="complete" items="${orderCompletelist}">	
		            <tr>		               
		                <td class="order">${complete.order_code}</td>
		                <td>${complete.fk_userid}</td>
		             	<td>${complete.order_date}</td>
		                <td>배송완료</td>
		            </tr>
		        </c:forEach>   
			</c:if>
            
        </table>

		<div style="color: black;">
    		${pageBar2}
    	</div>



    </div>

</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    window.onload = function () {

        var infoArr = document.getElementsByClassName("order");

        // 주문정보조회 팝업창
        for(var i=0; i<infoArr.length; i++){
            infoArr[i].addEventListener('click', function () {

            	var orderCode = $(this).text();          	
            //	alert(ordercode);
            	
                window.open('/SemiProject/admin/adminOrderInfo.hb?orderCode='+orderCode,'주문정보조회','width=750, height=700, scrollbars= 1, toolbar=1');
                
            });
        }      

    };

    
    $(document).ready(function(){
    	
    	// 체크박스 전체선택/ 전체해제
    	$("input:checkbox[id=allCheck]").click(function(){
			
			$("input:checkbox[name=order_code]").prop("checked",true);
			
			if(this.checked == false){
				$("input:checkbox[name=order_code]").prop("checked",false);	
			}
		});
    	
    	
    	// 하위체크박스가 모두 체크되었을때/해제 되었을때 전체체크박스도 체크/해제
    	$("input:checkbox[name=order_code]").click(function(){
			
			var bFlag = false;
			
			$("input:checkbox[name=order_code]").each(function(){
				var bool = $(this).prop("checked");
				if(!bool){
					$("input:checkbox[id=allCheck]").prop("checked",false);
					bFlag = true;
					return false;
				}		
			});
			
			if(!bFlag)
				$("input:checkbox[id=allCheck]").prop("checked",true);
		});
        		
    });
    	
    
    function goShipment(){
		
    	///// == 체크박스의 체크된 갯수(checked 속성이용) == /////
 	       var checkCnt = $("input:checkbox[name=order_code]:checked").length;
    	//	alert(checkCnt);
    		
    		if(checkCnt < 1) {
 	           alert("배송하실 주문을 선택하세요");
 	           return;
 	        }
    		
    		else{
 	    	   var allCnt = $("input:checkbox[name=order_code]").length;
 	    	   
 	    	   console.log(allCnt);
 	    	   	    	   
 	           var ordercodeArr = new Array();
 	           
 	           for(var i=0; i<allCnt; i++) {
 	                if( $("input:checkbox[name=order_code]").eq(i).is(":checked") ) {                                  
 	                  ordercodeArr.push($("input:checkbox[name=order_code]").eq(i).val());
 	               }
 	            }
 	           	           
 	           
 	           var ordercodejoin = ordercodeArr.join();
 	           
         		alert(ordercodejoin);	
 	            
         		$("input:hidden[name=ordercodejoin]").val(ordercodejoin);
         		
 	            var frm = document.goShipmentFrm;
 	            frm.method = "POST";
 	            frm.action = "/SemiProject/admin/goShipment.hb";
 	            frm.submit(); 
 	       }
    		
    	}

</script>
</html>