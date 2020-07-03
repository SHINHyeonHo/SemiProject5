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
        #qnaPage {
            width: 780px;
            height: 1000px;
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
        
        .write {
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
	}
</script>
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
        
        <c:if test="${empty qnaList}">
        <tr align="center">
            <td colspan="5">아직 작성된 글이 없습니다.</td>
        </tr>
        </c:if>        
    <c:set var="page" value="${(empty param.p)?1:param.p}" />
    <c:set var="loginuser" value="${sessionScope.loginuser.userid}" />
		<c:forEach items="${qnaList}" var="list">
        <tr align="center">
            <td width="50px">${list.qna_seq}</td>
            <td width="400px" align="left">
            	
           		<c:if test="${list.re_lev > 0}">
           			<c:forEach begin="1" end="${list.re_lev}">
           				&nbsp;&nbsp;           			
           			</c:forEach>
           			RE : 
           		</c:if>  
           		<c:if test="${list.qna_secret == 0}">
           			<a href='/SemiProject/board/QNAview.hb?prodCode=${param.prodCode}&qnaNo=${list.qna_no}&p=${page}'>${list.qna_title}</a>
           		</c:if>   
           		<c:if test="${list.qna_secret == 1}"> 
           			<c:if test="${not empty loginuser && (loginuser eq list.fk_userid || loginuser eq 'admin')}">
           				<img src="../images/ProdDetail/lock.png" style="width: 10px; height: 10px;">&nbsp;<a href='/SemiProject/board/QNAview.hb?prodCode=${param.prodCode}&qnaNo=${list.qna_no}&p=${page}'>${list.qna_title}</a>
           			</c:if>
           			<c:if test="${empty loginuser}">
           				<img src="../images/ProdDetail/lock.png" style="width: 10px; height: 10px;">&nbsp;<a onclick="alert('비밀글은 작성자와 운영자만 볼 수 있습니다.');">${list.qna_title}</a>
           			</c:if>
           			<c:if test="${not empty loginuser && (loginuser ne list.fk_userid && loginuser ne 'admin')}">
           				<img src="../images/ProdDetail/lock.png" style="width: 10px; height: 10px;">&nbsp;<a onclick="alert('비밀글은 작성자와 운영자만 볼 수 있습니다.');">${list.qna_title}</a>
           			</c:if>
           		</c:if>  		            	
           	</td>
            <td width="70px">${list.fk_userid}</td>
            <td width="100px">${list.qna_write_date}</td>
            <td width="50px">${list.qna_count}</td>
        </tr>
		</c:forEach>	
    </table>
    
    <c:if test="${empty loginuser}">
    <a class="write" onclick="alert('로그인한 회원만 글을 쓸 수 있습니다.')">글쓰기</a>
    </c:if>
    <c:if test="${not empty loginuser}">
    <a class="write" href="/SemiProject/board/QNAwrite.hb?prodCode=${param.prodCode}">글쓰기</a>
    </c:if>  
    
    <c:set var="startNum" value="${page-(page-1)%5}" />    
    <c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/15), '.')}" /> 
    <div>
    	<div><span>${(empty param.p)?1:param.p}</span> / ${lastNum} page</div>
    </div>
      
    <div> 
    	<c:if test="${startNum>1}">
    	<a href="?prodCode=${param.prodCode}&p=${startNum-1}&f=${param.f}&q=${param.q}" >이전 페이지</a>
    	</c:if>
    	<c:if test="${startNum<=1}">
    	<span onclick="alert('이전 페이지가 없습니다.');">이전 페이지</span>
    	</c:if>
   	</div>
   	
    <ul>
    	<c:forEach var="i" begin="0" end="4">   
    	<c:if test="${(startNum+i) <= lastNum}">		
    		<li><a style="color:${page==(startNum+i)?'orange':''}" href="?prodCode=${param.prodCode}&p=${startNum+i}&f=${param.f}&q=${param.q}">${startNum+i}</a></li>
    	</c:if> 
    	</c:forEach>
    </ul>
    
    <div>
    	<c:if test="${startNum+4<lastNum}">
    		<a href="?prodCode=${param.prodCode}&p=${startNum+5}&f=${param.f}&q=${param.q}" >다음 페이지</a>
    	</c:if>
    	<c:if test="${startNum+4>=lastNum}">
    		<span onclick="alert('다음 페이지가 없습니다.');">다음 페이지</span>
    	</c:if>
   	</div>

    <form id="search">
    	<select name="f" id="searchType">
    		<option ${(param.f == "qna_title")?"selected":""} value="qna_title" selected>글 제목</option>
    		<option ${(param.f == "qna_content")?"selected":""} value="qna_content">글 내용</option>    		
    	</select>
    	<input type="hidden" name="prodCode" value="${param.prodCode}">
        <input id="inputSearch" name="q" id="search" type="text" value="${param.q}">
        <input id="btnSearch" type="submit" value="search" onclick="func_search();">        
    </form>
</div>

</body>
</html>