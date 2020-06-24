<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Q&A Page</title>
    <link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

    <style>
        #qnaPage {
            width: 780px;
            height: 500px;
            margin: 0 auto;
            font-size: 0.75em;
            font-family: Verdana, Dotum, AppleGothic, sans-serif;
            color: #4c4b4b;
        }

        #title {
            text-align: center;
            color: gray;
            font-family: AppleGothic;
        }

        table {
            margin: 30px auto 10px auto;
            border-collapse: collapse;
        }

        td {
            border-top: solid 1px #acacac;
            border-bottom: solid 1px #acacac;
            height: 30px;
        }
        
        #tdTop {
       		border-top: solid 2px #acacac;
            border-bottom: solid 2px #acacac;
        }

        #search {
            float: right;
        }

        #btnSearch {
            cursor: pointer;
            margin-right: 50px;
            font-size: 1em;
            font-family: Verdana, Dotum, AppleGothic, sans-serif;
            background-color: #aaa;
            color: #fff;
            border: solid 1px #aaa;
            outline: 0;
        }
        
        input {
        	outline: none;
        }
        
    </style>
</head>
<body>
<div id="qnaPage">
    <div id="title"><h2>Q&A</h2></div>
    <table>
        <tr align="center" id="tdTop">
            <td width="50px">no</td>
            <td width="400px">subject</td>
            <td width="70px">writer</td>
            <td width="100px">date</td>
            <td width="50px">view</td>
        </tr>
        
		<c:forEach items="${qnaList}" var="list">
        <tr align="center">
            <td width="50px">${list.qna_no}</td>
            <td width="400px"><a href='/SemiProject/board/view.hb?prodCode=${param.prodCode}&qna_no=${list.qna_no}'>${list.qna_title}</a></td>
            <td width="70px">${list.qna_userid}</td>
            <td width="100px">${list.qna_write_date}</td>
            <td width="50px">${list.qna_count}</td>
        </tr>
		</c:forEach>	
    </table>
    
    <a href="/SemiProject/board/write.hb?prodCode=${param.prodCode}">글쓰기</a>

    <div id="search">
        <input id="inputSearch" name="search" type="text">
        <button id="btnSearch">search</button>
    </div>
</div>

</body>
</html>