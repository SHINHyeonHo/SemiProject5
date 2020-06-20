<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
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

        #deleteProduct {
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
        <li><a href="product.jsp">상품관리</a></li>
        <li><a href="order.jsp">주문관리</a></li>
        <li><a href="member.jsp">회원관리</a></li>
        <li><a href="profit.jsp">정산관리</a></li>
        <li><a href="review.jsp">문의/리뷰</a></li>
    </ul>

    <div class="item" id="main">

        <div id="top">상품관리</div>
        <table>

            <tr>
                <td>품절임박</td>
                <td class="number"><span>3</span></td>
                <td>품절</td>
                <td class="number"><span>2</span>개</td>
                <td>총 상품</td>
                <td class="number"><span>17</span>개</td>
            </tr>

        </table>


        <div class="menu">상품검색</div>
        <div class="search">
            <input type="text" placeholder="상품명">
            <input id="search" type="button" value="검색">
            <input id="searchAll" type="button" value="전체조회">
        </div>

        <div class="info">
            <!--
                    목록 들어가는 곳
            -->
        </div>
    </div>
</div>

<template>
    <table>

        <th>비고</th>
        <th>상품코드</th>
        <th>상품분류</th>
        <th>상품명</th>
        <th>원산지</th>
        <th>원가</th>
        <th>정가</th>
        <th>재고수량</th>
        <th>수정</th>

        <tr>
            <td></td>
            <td><input name="register_product" type="text" placeholder="상품코드" size="10px"></td>
            <td>
                <select name="register_product" style="width: 70px">
                    <option value="bed">bed</option>
                    <option value="chair">chair</option>
                    <option value="table" selected>table</option>
                </select>
            </td>
            <td><input name="register_product" type="text" placeholder="상품명" size="15px"></td>
            <td><input name="register_product" type="text" placeholder="원산지" size="10px"></td>
            <td><input name="register_product" type="text" placeholder="원가" size="10px"></td>
            <td><input name="register_product" type="text" placeholder="정가" size="10px"></td>
            <td><input name="register_product" type="number" name="number" size="10px" value="0" min="0" max="30"></td>
            <td>
                <input type="submit" name="update" value="상품등록">
            </td>
        </tr>

        <!-- 반복문으로 이루어질 부분 -->
        <tr>
            <td><input type="checkbox"></td>
            <td>27347</td>
            <td>table</td>
            <td>table-basic12</td>
            <td>japan</td>
            <td>340,000</td>
            <td>695,000</td>
            <td><input type="number" name="number" size="10px" value="14" min="0" max="30"></td>
            <td><input type="submit" name="update" value="수량변경"></td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>27348</td>
            <td>chair</td>
            <td>chair-basic12</td>
            <td>japan</td>
            <td>120,000</td>
            <td>485,000</td>
            <td><input type="number" name="number" size="10px" value="5" min="0" max="30"></td>
            <td><input type="submit" name="update" value="수량변경"></td>
        </tr>
        <!--      <tr>
                  <td class="confirm" colspan="4"><input type="submit" value="상품등록"></td>
                  <td class="confirm" colspan="4"><input type="submit" value="상품삭제"></td>
              </tr>-->

    </table>
    <div id="deleteProduct"><input type="submit" value="상품삭제"></div>
</template>

</body>

<script>

    window.addEventListener('load', function () {


        var search = document.querySelector("#search");
        search.onclick = function () {

            var template = document.querySelector("template");
            var infoNode = document.importNode(template.content, true);
            var info = document.querySelector(".info");

            info.innerHTML = "";
            info.append(infoNode);
        }

        var searchAll = document.querySelector("#searchAll");
        searchAll.onclick = function () {

            var template = document.querySelector("template");
            var infoNode = document.importNode(template.content, true);
            var info = document.querySelector(".info");

            info.innerHTML = "";
            info.append(infoNode);
        }


    });


</script>
</html>
