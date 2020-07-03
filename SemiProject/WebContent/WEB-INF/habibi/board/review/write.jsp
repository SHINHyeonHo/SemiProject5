<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
    
<style type="text/css">

	#container {
		width: 780px;
        height: 700px;
        margin: 0 auto;
        font-size: 1em;
        font-family: Verdana, Dotum, AppleGothic, sans-serif;
        color: #4c4b4b;
        text-align: center;
	}
	
    #title {
        text-align: center;
        color: gray;
        font-family: AppleGothic;
    }
	
	table {
		width: 680px;
		height: 400px;
		border-collapse: collapse;
		margin: 0 auto;
		border-top: solid 2px #BDBDBD;
		border-bottom: solid 2px #BDBDBD;
	}
		
	td {
		font-size: 0.8em;
		color: #6E6E6E;
		height: 40px;
		border-top : solid 1px #BDBDBD;
	}
	
	#tdSel {
		width: 100px;
	}
	
	select {
        font-size: 1em;
        font-family: Verdana, Dotum, AppleGothic, sans-serif;
	}
	
	input {
		width: 98%;
		border-radius: 0;
		border: solid 1px #6e6e6e;
        font-size: 1em;
        font-family: Verdana, Dotum, AppleGothic, sans-serif;
        border: solid 1px #A4A4A4;
		outline: none;
    }
	
	.row1 {
		text-align: left;
		padding-left: 10px;
		width: 75px;
	}
	
	textarea {
		align: center;
		width: 98%;
		height: 400px;
		resize: none;
		margin: 10px auto;
		border: none;
		outline: none;
	}
	
	#txtArea {
		padding-left: 15px;
	}
	
	#btn {
		margin-top: 30px;
	}
	
	.btn {
		width: 40px;
		height: 20px;
		cursor: pointer;
		color: gray;
		background-color: #F2F2F2;
		border: solid 1px gray;
		outline: 0;
		font-size: 0.8em;
	}
	
	a, a:link, a:visited, a:active, a:hover {
        	text-decoration: none;
        	color: #4c4b4b; 
        } 
	
</style>
</head>

<body>
	<form action="/SemiProject/board/REVinsert.hb?prodCode=${param.prodCode}" method="post" onsubmit="return formCheck();">
	<div id="title"><h2>REVIEW</h2></div>
		<div id="container">
		<table>
			<tr>
				<td class="row1">제목</td>
				<td colspan="2"><input type="text" name="rev_title" size=70></td>
			</tr>
			<tr>
				<td class="row1">작성자</td>
				<td colspan="2"><input type="text" name="fk_userid" value="${sessionScope.loginuser.userid}" style="border: none; background-color: white;" readonly></td>
			</tr>
			<tr>
				<td colspan="3" id="txtArea"><textarea name="rev_content"></textarea></td>
			</tr>
			<tr style="display:none;">
				<td class="row1">제품코드</td>
				<td colspan="2"><input type="text" name="fk_prod_code" value=${param.prodCode}></td>
			</tr>
		</table>
		<div id="btn" align="center">
			<input type="submit" value="확인" class="btn" onclick="func_write();"> 
			<input type="button" value="취소" class="btn"> 
		</div>
	</div>
	</form>
	
	<script type="text/javascript">
	
		function formCheck() {
			var dc = document.forms[0];
			
			var title = dc.rev_title.value;
			var content = dc.rev_content.value;
			
			if(title == null || title == "") {
				alert("제목을 입력하세요.");
				dc.rev_title.focus();
				return false;
			}
			
			if(content == null || content == "") {
				alert("글 내용을 입력하세요.");
				dc.rev_content.focus();
				return false;
			}
		}
		
		
	</script>
</body>
</html>