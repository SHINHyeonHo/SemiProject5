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

        <div id="top">문의/리뷰</div>
        <table>

            <tr>
                <td>신규 문의</td>
                <td class="number"><span>1</span>건</td>
                <td>신규 리뷰</td>
                <td class="number"><span>1</span>건</td>
                <td>총 리뷰</td>
                <td class="number"><span>17</span>건</td>
            </tr>

        </table>


        <div class="menu">Q&A 검색</div>
        <div class="search">
            <input id="search" type="button" value="미처리 문의">
            <input id="searchAll" type="button" value="전체 문의">
        </div>

        <div class="info"></div>

        <!-- 리뷰도 따라 조회가능하게 할 것인지...! -->

    </div>
</div>

<template>
    <table>

        <th>글번호</th>
        <th>분류</th>
        <th>제목</th>
        <th>내용</th>
        <th>회원명</th>
        <th>등록날짜</th>
        <th>처리</th>

        <!-- 반복문으로 이루어질 부분 -->
        <tr>
            <td>1</td>
            <td>배송</td>
            <td>배송언제오나</td>
            <td>제곧내</td>
            <td>최유영</td>
            <td>2020-05-23</td>
            <td>완료</td>
        </tr>
        <tr>
            <td>2</td>
            <td>배송</td>
            <td>배송언제오나</td>
            <td>제곧내</td>
            <td>이지아</td>
            <td>2020-05-28</td>
            <td>미완료</td>
        </tr>

    </table>
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
