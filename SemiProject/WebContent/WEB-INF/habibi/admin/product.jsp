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

    <link rel="stylesheet" href="/SemiProject/css/admin/admin9.css" type="text/css">
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
        
        body{
        	font-size: small;
        
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


        <div id="top">상품관리</div>
        <table>

            <tr>
                <td>품절임박</td>
                <td class="soldout-check"><span id="before-soldout-product"></span>개</td>
                <td>품절</td>
                <td class="soldout-check"><span id="soldout-product"></span>개</td>
                <td>총 상품</td>
                <td class="soldout-check"><span id="all-product"></span>개</td>
            </tr>
 
        </table>

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
                <td><input id="prodCode" class="register-product" name="prodCode" type="text" placeholder="상품코드" size="8px"></td>
                <td>
                    <select id="prodCategory" name="prodCategory">
                        <option value="seating"selected>seating</option>
                        <option value="sleeping">sleeping</option>
                        <option value="table" >table</option>
                        <option value="storage">storage</option>
                        <option value="lighting">lighting</option>
                    </select>
                </td>
                <td><input id="prodName" class="register-product" name="prodName" type="text" placeholder="상품명" size="15px"></td>
                <td><input id="prodCost" class="register-product number-check" name="prodCost" type="text" placeholder="원가" size="6px"></td>
                <td><input id="prodPrice" class="register-product number-check" name="prodPrice" type="text" placeholder="정가" size="6px"></td>
                <td><input id="prodColor" class="register-product" name="prodColor" type="text" placeholder="색상" size="6px"></td>
                <td><input id="prodMtl" class="register-product" name="prodMtl" type="text" placeholder="재료" size="5px"></td>
                <td>
                	<input id="prodSize1" class="register-product number-check" name="prodSize1" type="text" placeholder="가로" size="4px"><span>x</span>
	                <input id="prodSize2" class="register-product number-check" name="prodSize2" type="text" placeholder="세로" size="4px"><span>x</span>
	                <input id="prodSize3" class="register-product number-check" name="prodSize3" type="text" placeholder="높이" size="4px">
	                <span>mm</span>
                </td>
                <td>
                    <select id="prodStatus" name="prodStatus">
                        <option value="1" selected>판매중</option>
                        <option value="0">판매중지</option>
                    </select>
                </td>
                <td><input id="prodStock" name="prodStock" type="number" name="prodStock" size="10px" value="0" min="0" max="30"></td>
            </tr>



        </table>
        
</form><!-- <form name="registerProdcutFrm" action="" > -->
        
        <div class="product-button"><button id="registerButton" type="button">상품등록</button></div>


        <div class="menu">상품검색</div>
	
            <div class="search">
            	<select id="searchCategory">
            		<option value="" selected>전체</option>
                    <option value="seating">seating</option>
                    <option value="sleeping">sleeping</option>
                    <option value="table" >table</option>
                    <option value="storage">storage</option>
                    <option value="lighting">lighting</option>
            	</select>
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

// ---------------------------- <script> --------------------------------- <script> --------------------------------------- <script> ----------------------


$(document).ready(function(){ // 로드되면
			
	var smallStock = 5;
	func_soldoutCheck(smallStock); // 품절 임박 개수
	func_soldoutCheck(1); // 품절 개수
	
	func_prodAll("","",smallStock);	
	
	
	$("#searchAllButton").click(function(){ // 전체조회 버튼 누르면
		
		func_prodAll("","",smallStock);
		
	});
	
	

	
	
	// 상품 검색
	$("#searchButton").click(function(){ // 검색버튼 누르면
		
		var searchCategory = $("#searchCategory").val();
		var searchName = $("#searchName").val().trim();
		if(searchName == ""){
			
			alert("상품명을 입력하세요.");
			return;
		}
		
		func_prodAll(searchCategory,searchName,smallStock);		
	});
	
	// ---------------------------- 상품 등록 --------------------------------- 상품 등록 --------------------------------------- 상품 등록 ----------------------


	$("#registerButton").click(function(){
		
		
		var prodCode = $("#prodCode").val().trim();
		var prodCategory = $("#prodCategory").val();
		var prodName = $("#prodName").val().trim();
		var prodCost = $("#prodCost").val().trim();
		var prodPrice = $("#prodPrice").val().trim();
		var prodColor = $("#prodColor").val().trim();
		var prodMtl = $("#prodMtl").val().trim();
		var prodSize1 = $("#prodSize1").val().trim();
		var prodSize2 = $("#prodSize1").val().trim();
		var prodSize3 = $("#prodSize1").val().trim();
		var prodStatus = $("#prodStatus").val();
		var prodStock = $("#prodStock").val();
		var prodSize = "w"+prodSize1+" x d"+prodSize2+" x h"+prodSize3+" mm";
		
		if(prodStatus == 1){
			prodStatus = "판매중";
		}
		else{
			prodStatus = "판매중지";
		}
		
		
		// 유효성 검사
		if (prodCode == '' || prodName == '' || prodCost == '' || prodPrice == '' 
			|| prodColor == '' || prodMtl == '' || prodSize1 == '' || prodSize2 == '' || prodSize3 == ''){
			
			alert("모든 상품 정보를 입력하세요.");
			return;
		}
				
		var flag = false;
		$(".unique-check").each(function(){ // 상품 코드 유니크 검사
			
			if($(this).text() == prodCode){
				alert("이미 존재하는 상품코드입니다.");
				flag = true;
				return false;
			}
		
		});
		
		if(flag == true){
			return;
		}
		
		$(".number-check").each(function(){ // 원가, 정가, 사이즈 숫자 검사
			
			var column = ($(this).attr('placeholder'));
			var number = $(this).val().trim();
			result = func_numberCheck(number);
			if(result == -1){
				
				if(column == "가로" || column == "세로" || column == "높이"){
					column == "사이즈";
				}
				alert(column+"는 숫자만 입력가능합니다.");
				flag = true;
				return false;
			} 
		});
		
		if(flag == true){
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
					
					$(".register-product").each(function(){
						$(this).val('');
					});
					
					$("#prodCategory").val("seating");
					$("#prodStatus").val("1");
					$("#prodStock").val(0);
					
					func_soldoutCheck(smallStock); // 품절 임박 개수
					func_soldoutCheck(1); // 품절 개수
					
					var allProd = parseInt($("#all-product").text()); // 총 상품 개수
					$("#all-product").text(allProd + 1);
					
					
					if($("#searchName").val().trim() == ''){ // 검색어가 없을 때만 바로 보여준다.					
					
					$("#tbody").prepend("<tr>"
										+ "<td><input type='checkbox' value='"+prodCode+"'></td>"
										+ "<td class='unique-check'>"+prodCode+"</td>"
										+ "<td>"+prodCategory+"</td>"
										+ "<td>"+prodName+"</td>"
										+ "<td>"+prodCost+"</td>"
										+ "<td>"+prodPrice+"</td>"
										+ "<td>"+prodColor+"</td>"
										+ "<td>"+prodMtl+"</td>"
										+ "<td>"+prodSize+"</td>"
										+ "<td><span>"+prodStatus+"</span><button id='changeStatusButton' type='button' value='"+prodCode+"'>변경</button></td>"
										+ "<td><div id='reg-stock-check' class='stock-check'>"+prodStock+"</div><button id='changeStockButton' type='button' value='"+prodCode+"'>변경</button></td>"
										+ "</tr>");
					
					// 품절임박 빨간색
					var stock = $("#reg-stock-check");
					func_stockColor(stock, smallStock);
					
					}
						
				},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		});

	});
	
	
	
	// ---------------------------- 상품 삭제 --------------------------------- 상품 삭제 --------------------------------------- 상품 삭제 ----------------------
	
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
				
				var count = 0;
				$("input[type=checkbox]:checked").each(function(){
					
					count ++;
					var tr = $(this).parent().parent();
					tr.remove();
		
				});
				
				var allProd = parseInt($("#all-product").text()); // 총 상품 개수
				$("#all-product").text(allProd - count);
				
				func_soldoutCheck(smallStock); // 품절 임박 개수
				func_soldoutCheck(1); // 품절 개수
				
			
			},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		}); // ajax

		
	});

	
	
	// ---------------------------- 수량 변경 --------------------------------- 수량 변경 --------------------------------------- 수량 변경 ----------------------
	
	$(document).on('click','#changeStockButton',function(){
		
		var prodStock = $(this).prev();
		var stockValue = $(this).prev().text();
		var prodCode= $(this).val();
		
		alert(stockValue);
	
		var changeStock = prompt("변경할 수량을 적어주세요.", changeStock);
		
		if(changeStock == null){
			return;
		}
		
		// 유효성 검사
		var result = func_numberCheck(changeStock);
		if(result == -1){
			alert("재고 수량은 숫자만 입력가능합니다.");
			return;
		}
		
		var data = changeStock+","+prodCode;
		
		$.ajax({
			url:"/SemiProject/admin/changeStock.hb",
			type:"GET",
			data:{"data":data},
			success:function(){
				
				//품절임박 색깔 
				var stock = prodStock.text(changeStock);
				func_stockColor(stock, smallStock);
				alert(smallStock);

				
				alert("재고수량이 "+stockValue+"개 에서 "+changeStock+"개로 변경되었습니다.");
				
				func_soldoutCheck(smallStock); // 품절 임박 개수
				func_soldoutCheck(1); // 품절 개수
			},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		}); // ajax
		
		
	});
	
	
	// ---------------------------- 판매 상태 변경 --------------------------- 판매 상태 변경 ---------------------------------- 판매 상태 변경 ----------------------

	
	$(document).on('click','#changeStatusButton',function(){
		
		var prodStatus = $(this).prev();
		var statusValue = prodStatus.text();
		var prodCode= $(this).val();
				
		var newStatusValue = "";
		var changeStatus = true;
		if(statusValue == "판매중"){
			newStatusValue = "판매중지";
			changeStatus = confirm("상태를 "+newStatusValue+"로 변경하시겠습니까?");
			
		}else{
			newStatusValue = "판매중";
			changeStatus = confirm("상태를 "+newStatusValue+"으로 변경하시겠습니까?");
		}
		
		if(changeStatus == false){
			return;
		}
				
		var data = newStatusValue+","+prodCode;
		alert("data : "+ data);
		
		$.ajax({
			url:"/SemiProject/admin/changeStatus.hb",
			type:"GET",
			data:{"data":data},
			success:function(){
				
				prodStatus.text(newStatusValue);
				alert("변경되었습니다.");
				
				func_soldoutCheck(smallStock); // 품절 임박 개수
				func_soldoutCheck(1); // 품절 개수
				
				
			},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		}); // ajax
		

		
	});
	
	
	
	
//end of document ready	
});
	
	
function func_prodAll(searchCategory, searchName, smallStock) {
		
	$.ajax({
		url:"/SemiProject/admin/searchProduct.hb", // json 들어 있는 controller 주소
		type:"GET",
		data:{"searchCategory":searchCategory,"searchName":searchName},
		dataType:"json",
		success:function(json){
			
			$("#searchCategory").val(searchCategory);
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
		        + "<th>재고수량</th></thead><tbody id='tbody'>";
				
				$.each(json, function(index, item){
					
					var prod_status = "";
					if(item.prod_status == 1){
						prod_status = "판매중";
					}
					else{
						prod_status = "판매중지";
					}
					
					html +=  
		 					 "<tr>"
							+ "<td><input type='checkbox' value='"+item.prod_code+"'></td>"
							+ "<td><span class='unique-check'>"+item.prod_code+"</span></td>"
							+ "<td>"+item.prod_category+"</td>"
							+ "<td>"+item.prod_name+"</td>"
							+ "<td>"+item.prod_cost+"</td>"
							+ "<td>"+item.prod_price+"</td>"
							+ "<td>"+item.prod_color+"</td>"
							+ "<td>"+item.prod_mtl+"</td>"
							+ "<td>"+item.prod_size+"</td>"
							+ "<td><span>"+prod_status+"</span><button id='changeStatusButton' type='button' value='"+item.prod_code+"'>변경</button></td>"
							+ "<td><div class='stock-check'>"+item.prod_stock+"</div><button id='changeStockButton' type='button' value='"+item.prod_code+"'>변경</button></td>"
							+ "</tr>";
				});
				
				html += "</tbody></table><div class='product-button'><button id='deleteButton' type='button'>상품삭제</button></div>";
				$("#searchTable").html(html);
				
					
				// 품절임박 수량 색깔 변경
				var count = 0;
				
				$(".stock-check").each(function(){
				
					count++;
					var stock = $(this);
					func_stockColor(stock, smallStock);
				});
				
				if(searchName == ""){
					$("#all-product").text(count); // 총 상품 개수
				}
		
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



function func_soldoutCheck(number){ // 품절 개수 관리
	
	var count = 0;
	
	$.ajax({
		url:"/SemiProject/admin/getStock.hb",
		type:"GET",
		data:{"soldoutNum":number},
		dataType:"json",
		success:function(json){
					
			if(json.length  > 0){
				
				$.each(json, function(index, item){
					// 상품정보도 들어있음..
					count = item.count;
				});
			}
	     
			if(number == 1){ // 품절 개수
				$("#soldout-product").text(count);	
			}
			else{ // 품절 임박 개수
				$("#before-soldout-product").text(count);	
			}
	
		},
		
		error: function(request, status, error){
			alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
		}

	}); // ajax

};


	
function func_stockColor(stock, smallStock){ // stock은 node
	if(stock.text() < smallStock)
		stock.css('color','red');
	else
		stock.css('color','black');
};

	
	
function func_numberCheck(number){ // 숫자 유효성 검사
	
	var regexp = /^[0-9]*$/
	if( !regexp.test(number) ) {
			return -1;
		}
};


</script>
</html>