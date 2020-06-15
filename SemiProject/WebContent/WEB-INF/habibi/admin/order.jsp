<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="/style/admin/admin.css" type="text/css">
    <style>
        td.order{
            text-decoration-line: underline;
        }
        td.order:hover{
            cursor: pointer;
        }
        td.confirm{
            margin-top: 10px;
            text-align: right;
            border-left: hidden;
            border-right: hidden;
            border-bottom: hidden;
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

        <div id="top">주문관리</div>
        <table>

            <tr>
                <td>신규주문</td>
                <td class="number"><span>2</span>건</td>
                <td>취소요청</td>
                <td class="number"><span>1</span>건</td>
                <td>반품/환불요청</td>
                <td class="number"><span>1</span>건</td>
            </tr>

        </table>


        <div class="menu">주문현황</div>
        <table>

            <th>발주</th>
            <th>주문번호</th>
            <th>상품번호</th>
            <th>배송상태</th>

            <!-- 반복문으로 이루어질 부분 -->
            <tr>
                <td><input type="checkbox"></td>
                <td class="order">1239942-7374</td>
                <td>basic-9867</td>
                <td>상품준비중</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td class="order">1233382-2345</td>
                <td>basic-2345</td>
                <td>배송완료</td>
            </tr>
            <tr>
                <td class="confirm" colspan="4"><input type="submit" value="발주"></td>
            </tr>

        </table>


        <div class="menu">취소요청</div>
        <table>

            <th>발주</th>
            <th>주문번호</th>
            <th>상품번호</th>
            <th>배송상태</th>

            <!-- 반복문으로 이루어질 부분 -->
            <tr>
                <td><input type="checkbox"></td>
                <td class="order">1239942-7374</td>
                <td>basic-9867</td>
                <td>상품준비중</td>
            </tr>
            <tr>
                <td class="confirm" colspan="4"><input type="submit" value="승인"></td>
            </tr>

        </table>

        <div class="menu">반품/환불요청</div>
        <table>

            <th>발주</th>
            <th>주문번호</th>
            <th>상품번호</th>
            <th>배송상태</th>

            <!-- 반복문으로 이루어질 부분 -->
            <tr>
                <td><input type="checkbox"></td>
                <td class="order">1233382-2345</td>
                <td>basic-2345</td>
                <td>배송완료</td>
            </tr>
            <tr>
                <td class="confirm" colspan="4"><input type="submit" value="승인"></td>
            </tr>

        </table>





    </div>

</div>

</body>

<script>

    window.onload = function () {

        var infoArr = document.getElementsByClassName("order");

        // 주문정보조회 팝업창
        for(var i=0; i<infoArr.length; i++){
            infoArr[i].addEventListener('click', function () {

                window.open('orderInfo.jsp','주문정보조회','width=750, height=700, scrollbars= 1, toolbar=1');

            });
        }


    };


</script>
</html>
