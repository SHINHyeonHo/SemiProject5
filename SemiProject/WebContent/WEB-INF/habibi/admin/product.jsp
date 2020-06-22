<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

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

<form method="post" action=""> <!------------------------------ form tag ------------------------------>

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

        <div class="menu">상품등록</div>

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
        <div class="product-button"><input name="submitButton" id="register-product" type="submit" value="상품등록" onclick="return func_checkProdValue(this.value)"></div>



        <div class="menu">상품검색</div>

        
            <div class="search">
                <input name="name" id="name" type="text" placeholder="상품명" value="${param.name}">
                <input name="submitButton" id="search" type="submit" value="검색" onclick="return func_checkSearchValue(this.value)">
                <input name="submitButton" id="searchAll" type="submit" value="전체조회">
            </div>
   
   
<!-------------------------- 임시로 옮긴 폼 태그 ------------------------------ -->
   
        
<c:if test="${method == 'POST'}">
    <table>
    
        <c:if test="${fn:length(prodList) == 0}">
        	<div>일치하는 상품이 없습니다.</div>
        </c:if>
        
        <c:if test="${fn:length(prodList) != 0}">
	        <th>선택</th>
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
        </c:if>
        
        <!-- 반복문으로 이루어질 부분 -->
        <c:forEach var="list" items="${prodList}">



		        <tr>
		            <td><input class="checkbox" type="checkbox" name="deleteCheck" value="${list.prod_code}"></td>
		            <td>${list.prod_code}</td>
		            <td>${list.prod_category}</td>
		            <td>${list.prod_name}</td>
		            <td>${list.prod_cost}</td>
		            <td>${list.prod_price}</td>
		            <td>${list.prod_color}</td>
		            <td>${list.prod_mtl}</td>
		            <td>${list.prod_size}</td>
		            
		            
		            
		            <td>
		            	<input type="number" name="number" size="10px" value="${list.prod_status}" min="0" max="30">
		                <button type="submit" name="submitButton" value="판매상태변경">변경</button>
		            </td>
		            <td>
		                <input type="number" name="number" size="10px" value="${list.prod_stock}" min="0" max="30">
		                <button type="submit" id="changeProdStock" name="submitButton" value="판매수량변경">변경</button>
		            </td>
		            
		       
		        </tr>
		        
	   
        </c:forEach>
		       		     

    </table>

    <c:if test="${fn:length(prodList) != 0}">
    	<div class="product-button"><input name="submitButton" id="delete-product" type="submit" value="상품삭제" onclick="return func_checkDeleteValue(this.value)"></div>
    </c:if>
    
</c:if>

   </form> <!----------------------------------- 원래 form tag----------------------------------------------->

        </div>
    </div>
<!-- </div>  -->


</body>

<script>

function func_checkSearchValue(){ // 상품 검색 유효성 검사
	
	 
	var name = document.querySelector("#name");
	if(name.value == '' || name.value == null){
		alert("상품명을 입력하세요.");
		
		return false;
	} 
	
};

function func_checkProdValue(){ // 상품등록 유효성 검사
		
	var prodCode = document.querySelector("#prodCode").value;
	var prodName = document.querySelector("#prodName").value;
	var prodCost = document.querySelector("#prodCost").value;
	var prodPrice = document.querySelector("#prodPrice").value;
	var prodColor = document.querySelector("#prodColor").value;
	var prodMtl = document.querySelector("#prodMtl").value;
	var prodSize = document.querySelector("#prodSize").value;
	
	if(prodCode.trim() == '' || prodName.trim() == '' || prodCost.trim() == '' || prodPrice.trim() == '' || 
			prodColor.trim() == '' || prodMtl.trim() == '' || prodSize.trim() == ''){
				
				alert("모든 상품 정보를 입력하세요.");
				return false;
				
			}

	
    if(!Number.isInteger(parseInt(prodCost))){
    	alert("상품 원가는 숫자만 입력가능합니다.");
    	return false;
    }
    
    if(!Number.isInteger(parseInt(prodPrice))){
    	alert("상품 정가는 숫자만 입력가능합니다.");
    	return false;
    }
    
    alert("상품이 등록되었습니다.");
    
};


function func_checkDeleteValue(){ // 상품 삭제 유효성 검사
	
	var arrCheckbox = document.querySelectorAll(".checkbox");
	
	var cnt = 0;
    var deleteProdCode = '';
	for(var i=0; i<arrCheckbox.length; i++){
		
		if(arrCheckbox[i].checked){
			cnt++;
			deleteProdCode += (arrCheckbox[i].value + ', ');
		}
	}
	
	if(cnt == 0) {
		alert("선택된 상품이 없습니다.");
		return false;
	}
	
	// 삭제된 상품 마지막 콤마 없애기
	deleteProdCode = deleteProdCode.substring(0, deleteProdCode.length-2);
	
	alert("상품코드 "+deleteProdCode+" 가 삭제되었습니다.");
	
}


// ***** 상품 수량 변경 ajax *****




    window.addEventListener('load', function () {
    	
         var searchAll = document.querySelector("#searchAll");
        searchAll.onclick = function () {
        	
        	var name = document.querySelector("#name");
        	name.value = "";

        }
      
        
/*
      	var changeProdStock = document.querySelector("#changeProdStock");
      	chanageProdStock.onclick = function(){
      		
      		var 
      		
      		
      	};
        	
 */       	
        	
 
   
    });


</script>
</html>