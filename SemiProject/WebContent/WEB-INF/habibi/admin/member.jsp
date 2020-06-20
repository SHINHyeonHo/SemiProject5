<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="/SemiProject/css/admin/admin.css" type="text/css">
    <style>
        td.confirm{
            margin-top: 10px;
            text-align: right;
            border-left: hidden;
            border-right: hidden;
            border-bottom: hidden;
        }
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

        <div id="top">회원관리</div>
        <table>

            <tr>
                <td>일반 회원</td>
                <td class="number"><span>16</span>명</td>
                <td>탈퇴( or vip?) 회원</td>
                <td class="number"><span>1</span>명</td>
                <td>총 회원</td>
                <td class="number"><span>17</span>명</td>
            </tr>

        </table>


        <div class="menu">회원검색</div>
        <div class="search">
            <input type="text" placeholder="회원명">
            <input id="search" type="button" value="검색">
            <input id="searchAll" type="button" value="전체조회">
        </div>

        <div class="info">

        </div>
    </div>
</div>

<template>
    <table>

        <th>수정</th>
        <th>회원번호</th>
        <th>회원명</th>
        <th>분류</th>

        <!-- 반복문으로 이루어질 부분 -->
        <tr>
            <td><input type="checkbox"></td>
            <td>123</td>
            <td class="order">최유영</td>
            <td>일반</td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>128</td>
            <td class="order">이지아</td>
            <td>일반</td>
        </tr>
        <tr>
            <td class="confirm" colspan="4"><input type="submit" value="수정"></td>
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