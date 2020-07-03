<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" /> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   
<style type="text/css">

	#container {
		width: 780px;
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
	<form action="/SemiProject/board/QNAinsert.hb?prodCode=${param.prodCode}" 
		  method="post" 
		  onsubmit="return formCheck();">
	<div id="title"><h2>Q&A</h2></div>
		<div id="container">
		<table>
			<tr>
				<td class="row1">제목</td>
				<td id="tdSel">
					<select name="qna_category">
						<option selected value="product">상품 문의</option>
						<option value="delivery">배송 문의</option>
						<option value="etc">기타 문의</option>
					</select>
				</td>
				<td><input type="text" name="qna_title" size=70></td>
			</tr>
			<tr>
				<td class="row1">작성자</td>
				<td colspan="2"><input type="text" name="fk_userid" value="${sessionScope.loginuser.userid}" style="border: none; background-color: white;" readonly></td>
			</tr>
			<tr>
				<td colspan="3" id="txtArea"><textarea name="qna_content"></textarea></td>
			</tr>
			<tr>
				<td class="row1">비밀글</td>
				<td align="left"><input type="checkbox" name="qna_secret" id="qna_secret" value="1"></td>
				<td></td>
			</tr>
			<tr style="display:none;">
				<td class="row1">제품코드</td>
				<td colspan="2"><input type="text" name="fk_prod_code" value=${param.prodCode}></td>
			</tr>
		</table>
		<div id="btn" align="center">
			<input type="submit" value="확인" class="btn" id="check"> 
			<input type="button" value="취소" class="btn" onClick="location.href='/SemiProject/board/QNAinsert.hb?prodCode=${param.prodCode}'">
		</div>
	</div>
	</form>
	
	<script type="text/javascript">
			
		$("#check").click(function() {
			
			if(confirm("글을 등록하시겠습니까?") == false) {
				return false;
			}			
		});
		
		function formCheck() {
			var dc = document.forms[0];
			
			var title = dc.qna_title.value;
			var content = dc.qna_content.value;
			
			if(title == null || title == "") {
				alert("제목을 입력하세요.");
				dc.qna_title.focus();
				return false;
			}
			
			if(content == null || content == "") {
				alert("글 내용을 입력하세요.");
				dc.qna_content.focus();
				return false;
			}
		}			
	</script>
</body>
</html>