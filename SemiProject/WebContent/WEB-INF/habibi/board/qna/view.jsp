<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력</title>
<style type="text/css">

	#container {
		width: 780px;
        height: 650px;
        margin: 0 auto;
        font-size: 0.9em;
        font-family: Verdana, Dotum, AppleGothic, sans-serif;
        color: #4c4b4b;
        text-align: center;
	}
	
    #title {
    	font-size: 0.75em;
        text-align: center;
        color: gray;
        font-family: AppleGothic;
    }
	
	table {
		width: 680px;
		height: 500px;
		border-collapse: collapse;
		margin: 30px auto 0 auto;
		border-top: solid 2px #BDBDBD;
		border-bottom: solid 2px #BDBDBD;
		text-align: left;
	}
		
	td {
		font-size: 0.8em;
		color: #6E6E6E;
		height: 40px;
	}
	
	.info {
		border-bottom: solid 1px #BDBDBD;
	}
	
	.row1 {
		text-align: left;
		padding-left: 10px;
		width: 70px;
		font-weight: bold;
	}
	
	#content {
		height: 400px;
		padding-left: 10px;
		vertical-align: top;
	}
	
</style>
</head>

<body>
	<div id="title"><h2>Q&A</h2></div>
	<c:forEach items="${qnaPost}" var="post">
	<div id="container">
		<table>
			<tr class="info">
				<td class="row1">제목</td>
				<td class="row2">${post.qna_title}</td>
			</tr>
			<tr class="info">
				<td class="row1">작성자</td>
				<td class="row2" colspan="2">${post.qna_userid}</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right;">${post.qna_write_date}&nbsp;&nbsp;|&nbsp;&nbsp;조회&nbsp;${post.qna_count}&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" id="content">${post.qna_content}</td>
			</tr>
		</table>
		<a href="/SemiProject/board/list.hb?prodCode=${param.prodCode}">목록</a>
	</div>	
	</c:forEach>

</body>
</html>