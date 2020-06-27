<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Q&A Page</title>
    <link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" /> 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
        #revPage {
            width: 780px;
            height: 700px;
            margin: 0 auto;
            font-size: 0.75em;
            font-family: Ver
        }

        #title {
            text-align: center;
            color: gray;
            font-family: AppleGothic;
        }

        table {
            margin: 30px auto 10px auto;
            border-collapse: collapse;
            border-bottom: solid 2px #acacac;
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
        
        #write {
        	margin: 20px 0 0 50px;
        }
        
        a, a:link, a:visited, a:active, a:hover {
        	text-decoration: none;
        	color: #4c4b4b; 
        }       
        
    </style>
</head>
<script type="text/javascript">

	$(document).ready(function() {
	    $("#inputSearch").keydown(function(key) {
	        if (key.keyCode == 13) {
	            func_search();
	        }
	    });
	});

	function func_search() {    		
		var val = $('#inputSearch').val();
		
		if(val == null || val == "") {
			alert("검색할 단어를 입력하여 주십시오.");
			return;
		}
		location.href='/SemiProject/board/REVsearch.hb?prodCode=${param.prodCode}&search=' + val;
	}
	
</script>
<body>
<div id="revPage">
    <div id="title"><h2>REVIEW</h2></div>
    <table>
        <tr align="center" id="tdTop">
            <td width="50px">no</td>
            <td width="400px">subject</td>
            <td width="70px">writer</td>
            <td width="100px">date</td>
            <td width="50px">view</td>
        </tr>
        
        <c:if test="${empty revList}">
        <tr align="center">
            <td colspan="5">아직 작성된 글이 없습니다.</td>
        </tr>
        </c:if>
		<c:forEach items="${revList}" var="list">
        <tr align="center">
            <td width="50px">${list.rev_seq}</td>
            <td width="400px"><a href='/SemiProject/board/REVview.hb?prodCode=${param.prodCode}&revNo=${list.rev_no}'>${list.rev_title}</a></td>
            <td width="70px">${list.fk_userid}</td>
            <td width="100px">${list.rev_write_date}</td>
            <td width="50px">${list.rev_count}</td>
        </tr>
		</c:forEach>	
    </table>
    
    <a id="write" href="/SemiProject/board/REVwrite.hb?prodCode=${param.prodCode}">글쓰기</a>

    <div id="search">
        <input id="inputSearch" name="search" type="text">
        <button id="btnSearch" onclick="func_search();">search</button>
    </div>
</div>

</body>
</html>