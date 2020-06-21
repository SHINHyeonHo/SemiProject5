<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <th>판매상태</th>
            <th>재고수량</th>

            <tr>
                <td><input name="register-product" type="text" placeholder="상품코드" size="10px"></td>
                <td>
                    <select name="register-product">
                        <option value="seating"selected>seating</option>
                        <option value="sleeping">sleeping</option>
                        <option value="table" >table</option>
                        <option value="storage">storage</option>
                        <option value="lighting">lighting</option>
                    </select>
                </td>
                <td><input name="register-product" type="text" placeholder="상품명" size="15px"></td>
                <td><input name="register-product" type="text" placeholder="원가" size="10px"></td>
                <td><input name="register-product" type="text" placeholder="정가" size="10px"></td>
                <td><input name="register-product" type="text" placeholder="색상" size="10px"></td>
                <td>
                    <select name="register-product">
                        <option value="1" selected>판매중</option>
                        <option value="0">판매중지</option>
                    </select>
                </td>
                <td><input name="register-product" type="number" name="number" size="10px" value="0" min="0" max="30"></td>
            </tr>

        </table>
        <div id="register-product" class="product-button"><input type="submit" value="상품등록"></div>



        <div class="menu">상품검색</div>

        <form method="post" action=""> <!------------------------------ form tag ------------------------------>
            <div class="search">
                <input name="name" id="name" type="text" placeholder="상품명" value="${param.name}">
                <input name="searchButton" id="search" type="submit" value="검색">
                <input name="searchButton" id="searchAll" type="submit" value="전체조회">
            </div>
        </form>

        <div class="info">
<!--
        목록 들어가는 곳
-->

<!-- <template> -->
<c:if test="${method == 'POST'}">
    <table>

        <th>선택</th>
        <th>상품코드</th>
        <th>상품분류</th>
        <th>상품명</th>
        <th>원가</th>
        <th>정가</th>
        <th>색상</th>
        <th>판매상태</th>
        <th>재고수량</th>

        <!-- 반복문으로 이루어질 부분 -->
        <c:forEach var="list" items="${prodList}">

		        <tr>
		            <td><input type="checkbox"></td>
		            <td>${list.prod_code}</td>
		            <td>${list.prod_category}</td>
		            <td>${list.prod_name}</td>
		            <td>${list.prod_cost}</td>
		            <td>${list.prod_price}</td>
		            <td>${list.prod_color}</td>
		            <td>${list.prod_status}
		                <input type="submit" name="update" value="변경">
		            </td>
		            <td>
		                <input type="number" name="number" size="10px" value="${list.prod_stock}" min="0" max="30">
		                <input type="submit" name="update" value="변경">
		            </td>
		        </tr>
	   
        </c:forEach>

    </table>

    <div id="delete-product" class="product-button"><input type="submit" value="상품삭제"></div>
    
</c:if>
<!-- </template> -->

        </div>
    </div>
</div>


</body>

<script>


    window.addEventListener('load', function () {


        var search = document.querySelector("#search");
        search.onclick = function () {
        	
        	var name = document.querySelector("#name");
        	if(name.value == "" || name.value == null){
        		
        		alert("상품명을 입력하세요.");
        	}
        	/*
            var template = document.querySelector("template");
            var infoNode = document.importNode(template.content, true);
            var info = document.querySelector(".info");

            info.innerHTML = "";
            info.append(infoNode);*/
        }

         var searchAll = document.querySelector("#searchAll");
        searchAll.onclick = function () {
        	
        	var name = document.querySelector("#name");
        	name.value = "";

         /*   var template = document.querySelector("template");
            var infoNode = document.importNode(template.content, true);
            var info = document.querySelector(".info");

            info.innerHTML = "";
            info.append(infoNode); */
        }


    });


</script>
</html>