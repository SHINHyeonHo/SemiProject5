<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" /> 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="http://code.highcharts.com/highcharts.js"></script>
	
    <link rel="stylesheet" href="/SemiProject/css/admin/admin.css" type="text/css">
    <style>

        .search{
            text-align: center;
            margin: 20px 0px;
        }

        #search{
            margin: 0px 10px;
        }

        div#sum{
            margin: 20px;
        }

        span#sumNumber{
            padding-left: 20px;
        }
        
        body{
        	font-size: small;
        }
        
        #chart{
        	width: 550px; 
        	height: 400px; 
        	margin: 0 auto;
        }
        
        #top-bar{
        	margin-bottom: 30px;
        }

    </style>

</head>
<body>

<header></header>

<div class="admin">HABIBI 관리자 페이지</div>

<div class = "container">

    <ul class="item" id="sidebar">
        <li><a href="/SemiProject/admin/product.hb">상품관리</a></li>
        <li><a href="/SemiProject/admin/order.hb">주문관리</a></li>
        <li><a href="/SemiProject/admin/member.hb">회원관리</a></li>
        <li><a href="/SemiProject/admin/profit.hb">정산관리</a></li>
        <li><a href="/SemiProject/admin/review.hb">문의/리뷰</a></li>
    </ul>

    <div class="item" id="main">

        <div id="top">정산관리</div>
        <table id="top-bar">

            <tr>
                <td>이번달 매출</td>
                <td class="number">
                	<span>
                		<fmt:formatNumber type="number" pattern="###,###" value="${thisMonthMap['revenue']}"/>
               		</span>&nbsp;원
            	</td>
                <td>이번달 비용</td>
                <td class="number">
                	<span>
                		<fmt:formatNumber type="number" pattern="###,###" value="${thisMonthMap['expense']}"/>
               		</span>&nbsp;원
              	</td>
                <td>총 수익</td>
                <td>
                	<span id="total-profit">
                	</span>&nbsp;원
               	</td>
            </tr>

        </table>


	<!------------------------------------------------------------------------------------------------------------------>  

	
	<table id="chart-table">
		<c:forEach var="list" items="${monthProfitList}" varStatus="st" begin="0" end="3">
			<tr>
				<td class="month">${list.month}</td>
				<td class="revenue">${list.revenue}</td>
				<td class="expense">${list.expense}</td>
				<td class="profit">${list.profit}</td>
			</tr>
		</c:forEach>
	</table>

	<div id="chart"></div>


	<!------------------------------------------------------------------------------------------------------------------>  

	<div class="menu">정산 내역</div>
    <table>

        <th>주문번호</th>
        <th>주문자명</th>
        <th>결제금액</th>
        <th>결제일자</th>
        <th>정산(예정)일자</th>
        <th>수수료</th>
        <th>정산금액</th>
        <th>정산여부</th>
        <th>수익</th>

        <!-- 반복문으로 이루어질 부분 -->
       
       <c:forEach var="list" items="${profitList}" varStatus="st">
			
			<tr>
				<td><span class="order_code">${list.fk_order_code}</span></td>
				<td>${list.fk_name}</td>
				<td><fmt:formatNumber type="number" pattern="###,###" value="${list.fk_order_price}"/>&nbsp;원</td>
				<td>
					<span class="order_date">${list.fk_order_date}</span>
				</td>
				<td>
					<span class="cal_date">${list.cal_date}</span>
				</td>
				<td><fmt:formatNumber type="number" pattern="###,###" value="${list.commission}"/>&nbsp;원</td>
				<td><fmt:formatNumber type="number" pattern="###,###" value="${list.cal_price}"/>&nbsp;원</td>
				<td>
					<span class="is_complete">
						<c:if test="${list.is_complete == 1}">
							<span>정산 완료</span>
						</c:if>
						<c:if test="${list.is_complete == 0}">
							<span>-</span>
						</c:if>
					</span>
				</td>
				<td >
					<fmt:formatNumber type="number" pattern="###,###" value="${list.profit}"/>&nbsp;원
					<input class="profit" type="hidden" value="${list.profit}">
				</td>
			</tr>			
		
		</c:forEach>
       
       
    </table>


    </div>
</div>
	
	<script type="text/javascript">
	
	$(document).ready(function() {  
		
		$("#chart-table").hide();
		
		var monthArr = [];
		$(".month").each(function(){
			
			monthArr.push($(this).text());
		});
		
		var revenueArr = [];
		$(".revenue").each(function(){
			
			revenueArr.push($(this).text());
		});
		
		var expenseArr = [];
		$(".expense").each(function(){
			
			expenseArr.push($(this).text());
		});
		
		var profitArr = [];
		$(".profit").each(function(){
			
			profitArr.push($(this).text());
		});

	   var chart = {
	      type: 'bar'
	   };
	   var title = {
	      text: '월별 매출지표 '   
	   };
	   var subtitle = {
	      text: '매출 & 비용 & 수익'  
	   };
	   var xAxis = {
	      categories: [Number(monthArr[0])+"월", Number(monthArr[1])+"월", Number(monthArr[2])+"월", Number(monthArr[3])+"월"],
	      title: {
	         text: null
	      }
	   };
	   var yAxis = {
	      min: 0,
	      title: {
	         text: '매출지표 (단위 : 천원)',
	         align: 'high'
	      },
	      labels: {
	         overflow: 'justify'
	      }
	   };
	   var tooltip = {
			enabled: true,
	      	valueSuffix: ' '
	   };
	   var plotOptions = {
	      bar: {
	         dataLabels: {
	            enabled: true
	         }
	      }
	   };
	   var legend = {
	      layout: 'vertical',
	      align: 'right',
	      verticalAlign: 'top',
	      x: -5,
	      y: 280,
	      floating: true,
	      borderWidth: 1,
	      backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
	      shadow: true
	   };
	   var credits = {
	      enabled: false
	   };
	   
	   var series= [{
	         name: '매출',
	            data: [Number(revenueArr[0]), Number(revenueArr[1]), Number(revenueArr[2]), Number(revenueArr[3])]
	        }, {
	            name: '비용',
	            data: [Number(expenseArr[0]), Number(expenseArr[1]), Number(expenseArr[2]), Number(expenseArr[3])]
	        }, {
	            name: '수익',
	            data: [Number(profitArr[0]), Number(profitArr[1]), Number(profitArr[2]), Number(profitArr[3])]      
		    }
	   ];     
	      
	   var json = {};   
	   json.chart = chart; 
	   json.title = title;   
	   json.subtitle = subtitle; 
	   json.tooltip = tooltip;
	   json.xAxis = xAxis;
	   json.yAxis = yAxis;  
	   json.series = series;
	   json.plotOptions = plotOptions;
	   json.legend = legend;
	   json.credits = credits;
	   $('#chart').highcharts(json);
	  
	});
	</script>

	<script type="text/javascript">
	
	$(document).ready(function(){ // 로드되면
		
		func_profit_date_check();
		
		
		var totalProfit = 0;
		$(".profit").each(function(){
			
			var isComplete = $(this).parent().parent().find(".is_complete").text();
			if(isComplete == "정산완료"){
				
				totalProfit += Number($(this).val());	
			}
		});	
		
		$("#total-profit").text((totalProfit).toLocaleString('en'));

	
	});
	
	
	function func_profit_date_check(){
		
		var date = new Date();
		var today = getFormatDate(date);
	
		
		var orderCodeArr = [];
		$(".cal_date").each(function(){
			
			var yearMonthDay = $(this).text().split("-");
			var profitDate = new Date(yearMonthDay[0],yearMonthDay[1],yearMonthDay[2]);
			
			var dateGap = today.getTime() - profitDate.getTime();
			var orderCode = $(this).parent().parent().find(".order_code").text();
			
			if(dateGap > 0){
				
				$(this).parent().parent().find(".is_complete").text("정산완료"); // jsp에서 정산여부 바꾸기
				orderCodeArr.push("'"+orderCode+"'"); // Action으로 보낼 주문번호
			}
			
		});
		
		var orderCodes = orderCodeArr.join(",");
		// alert(orderCodes); //확인
		
		$.ajax({
			url:"/SemiProject/admin/profitDateCheck.hb",
			type:"GET",
			data:{"orderCodes": orderCodes},
			success:function(){

			},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}

		}); // ajax
		
		

		
	};
	
	
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    var today = new Date(year, month, day);
	    return today;
	}
	
	
	</script>

</body>

</html>