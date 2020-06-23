<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" /> 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="/SemiProject/css/admin/admin.css" type="text/css">
    <style>
        .search{
            text-align: center;
            margin: 20px 0px;
        }

        #search{
            margin: 0px 10px;
        }

        .product-button {
            text-align: right;
            margin: 20px;
        }
        
        #searchTable{
        	margin : 0 auto;
        	border : solid 0px white;
        
        }


    </style>

</head>
<body>

<header></header>

<div class="admin">HABIBI 관리자 페이지</div>

<div class = "container">

    <ul class="item" id="sidebar">
        <li><a href="adminProduct.html">상품관리</a></li>
        <li><a href="adminOrder.html">주문관리</a></li>
        <li><a href="adminMember.html">회원관리</a></li>
        <li><a href="adminProfit.html">정산관리</a></li>
        <li><a href="adminReview.html">문의/리뷰</a></li>
    </ul>

    <div class="item" id="main">

<!--
        <div id="top">상품관리</div>
        <table>

            <tr>
                <td>품절임박</td>
                <td class="number"><span>3</span>개</td>
                <td>품절</td>
                <td class="number"><span>2</span>개</td>
                <td>총 상품</td>
                <td class="number"><span>17</span>개</td>
            </tr>
 
        </table>
-->
        <div class="menu">상품등록</div>
        
        
<form name="registerProductFrm">
        <table>

            <th>상품코드</th>
            <th>상품분류</th>
            <th>상품명</th>
            <th>원가</th>
            <th>정가</th>
            <th>색상</th>
            <th>재료</th>
        	<th>사이즈</th>
            <th>판매상태</th>
            <th>재고수량</th>

            <tr>
                <td><input id="prodCode" name="prodCode" type="text" placeholder="상품코드" size="10px"></td>
                <td>
                    <select name="prodCategory">
                        <option value="seating"selected>seating</option>
                        <option value="sleeping">sleeping</option>
                        <option value="table" >table</option>
                        <option value="storage">storage</option>
                        <option value="lighting">lighting</option>
                    </select>
                </td>
                <td><input id="prodName" name="prodName" type="text" placeholder="상품명" size="15px"></td>
                <td><input id="prodCost" name="prodCost" type="text" placeholder="원가" size="10px"></td>
                <td><input id="prodPrice" name="prodPrice" type="text" placeholder="정가" size="10px"></td>
                <td><input id="prodColor" name="prodColor" type="text" placeholder="색상" size="10px"></td>
                <td><input id="prodMtl" name="prodMtl" type="text" placeholder="재료" size="10px"></td>
                <td><input id="prodSize" name="prodSize" type="text" placeholder="사이즈" size="10px"></td>
                <td>
                    <select name="prodStatus">
                        <option value="1" selected>판매중</option>
                        <option value="0">판매중지</option>
                    </select>
                </td>
                <td><input name="prodStock" type="number" name="prodStock" size="10px" value="0" min="0" max="30"></td>
            </tr>



        </table>
        
</form><!-- <form name="registerProdcutFrm" action="" > -->
        
        <div class="product-button"><button id="registerButton" type="button">상품등록</button></div>


        <div class="menu">상품검색</div>
	
            <div class="search">
                <input name="searchName" id="searchName" type="text" placeholder="상품명" value="">
                <button id="searchButton" type="button">검색</button>
                <button id="searchAllButton" type="button">전체조회</button>
            </div>
  		
  		<!-- 검색한 값이 들어오는 곳 -->
  		
  		<div id="searchTable"></div>
 
  		
  		
   
        </div>
    </div>
<!-- </div>  -->


</body>

<script>

$(document).ready(function(){ // 로드되면
			
	func_prodAll("");	
	
	$("#searchAllButton").click(function(){
		
		func_prodAll("");
		
	});
	
	// 상품 검색
	$("#searchButton").click(function(){ // 검색버튼 누르면
		
		var searchName = $("#searchName").val().trim();
		if(searchName == ""){
			
			alert("상품명을 입력하세요.");
			return;
		}
		
		func_prodAll(searchName);		
	});
	
	
	// 상품 등록
	$("#registerButton").click(function(){
		
		
		// 유효성 검사
		if ($("#prodCode").val().trim() == '' || $("#prodName").val().trim() == '' || $("#prodCost").val().trim() == '' || $("#prodPrice").val().trim() == '' 
			|| $("#prodCode").val().trim() == '' || $("#prodColor").val().trim() == '' || $("#prodMtl").val().trim() == '' || $("#prodSize").val().trim() == '' ){
			
			alert("모든 상품 정보를 입력하세요.");
			return;
		}
		
		var prodCost = $("#prodCost").val().trim();
		var prodPrice = $("#prodPrice").val().trim();
		var result = func_numberCheck(prodCost, prodPrice);
		
		if(result == -1){
			return;
		}
	
		var queryString  = $("form[name=registerProductFrm]").serialize();
		
		alert(queryString);
		
		$.ajax({
				url:"/SemiProject/admin/registerProduct.hb",
				type:"POST",
				data:queryString,
				success:function(){
					
					alert("상품이 등록되었습니다.");	
					func_prodAll(""); // 전체 상품 조회		
				
				},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		});

	});
	
	
	
	//상품 삭제
	
	$(document).on('click','#deleteButton',function(){
		
		var checkedValue = [];
		
		$("input[type=checkbox]:checked").each(function(){
			
			checkedValue.push($(this).val());
		});
		
		// 유효성 검사
		if(checkedValue.length == 0){
			alert("선택된 상품이 없습니다.");
			return;
		}
					
		var prodCodeString = "'";
	    for(var i=0; i<checkedValue.length; i++){ // array to string
	    	
	    	prodCodeString += checkedValue[i]+"','"; 	
	    }
	    prodCodeString = prodCodeString.substring(0, prodCodeString.length-2);
		
		$.ajax({
			url:"/SemiProject/admin/deleteProduct.hb",
			type:"GET",
			data:{"prodCodeString":prodCodeString},
			success:function(){
				
				alert("총 "+checkedValue.length+"개의 상품이 삭제되었습니다.");	
				func_prodAll(""); // 전체 상품 조회		
			
			},
		
		error: function(request, status, error){
			alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
		}	
	}); // ajax

		
	});

	
	
	
//end of document ready	
});
	
	
function func_prodAll(searchName) {
	
	$.ajax({
		url:"/SemiProject/admin/searchProduct.hb", // json 들어 있는 controller 주소
		type:"GET",
		data:{"searchName":searchName},
		dataType:"json",
		success:function(json){
			
			$("#searchName").val(searchName); // 입력한 검색어 그대로 두기

			var html =  "";
			if(json.length  > 0){
				
				html += "<table><thead><th>선택</th>"
	       		+ "<th>상품코드</th>"
		        + "<th>상품분류</th>"
		        + "<th>상품명</th>"
		        + "<th>원가</th>"
		        + "<th>정가</th>"
		        + "<th>색상</th>"
		        + "<th>재료</th>"
		        + "<th>사이즈</th>"
		        + "<th>판매상태</th>"
		        + "<th>재고수량</th></thead><tbody>";
				
				$.each(json, function(index, item){
					
					html +=  
		 					 "<tr>"
							+ "<td><input type='checkbox' value='"+item.prod_code+"'></td>"
							+ "<td>"+item.prod_code+"</td>"
							+ "<td>"+item.prod_category+"</td>"
							+ "<td>"+item.prod_name+"</td>"
							+ "<td>"+item.prod_cost+"</td>"
							+ "<td>"+item.prod_price+"</td>"
							+ "<td>"+item.prod_color+"</td>"
							+ "<td>"+item.prod_mtl+"</td>"
							+ "<td>"+item.prod_size+"</td>"
							+ "<td>"+item.prod_status+"</td>"
							+ "<td>"+item.prod_stock+"</td>"
							+ "</tr>";
				});
				
				html += "</tbody></table><div class='product-button'><button id='deleteButton' type='button'>상품삭제</button></div>";
				$("#searchTable").html(html);
				
			}
			else{
				
				$("#searchTable").html("일치하는 상품명이 없습니다.");
			}
		},
		error: function(request, status, error){
			alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
		}

	});
	
};// end of func_prodAll(searchName)---------------
	
	
function func_numberCheck(prodCode, prodPrice){
	
	if(!Number.isInteger(parseInt(prodCost)) || !Number.isInteger(parseInt(prodPrice))){
    	alert("상품 원가, 정가는 숫자만 입력가능합니다.");
    	return -1;
    }
	
};

</script>
</html>