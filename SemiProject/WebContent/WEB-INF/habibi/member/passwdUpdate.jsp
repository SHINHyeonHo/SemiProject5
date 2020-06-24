<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String ctxPath = request.getContextPath();

%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<style>
	

</style>


<script type="text/javascript">
	$(document).ready(function(){ 
		
		$("#btnUpdate").click(function(){  
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			
			var regexp_passwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			/* 암호는 숫자,영문자,특수문자가 포함된 형태의 8~15글자 이하만 허락해주는 정규표현식 객체 생성 */
			
			var bool = regexp_passwd.test(pwd);
			/* 암호 정규표현식 검사를 하는 것 
			      정규표현식에 만족하면 리턴값은 true,
			      정규표현식에 틀리면 리턴값은 false */
			      
			if(!bool) {
				alert("암호는 8글자 이상 15글자 이하에 영문자, 숫자, 특수기호가 혼합되어야 합니다."); 
				$("#pwd").val("");
				$("#pwd2").val("");
				return;
			}   
			else if(pwd != pwd2) {
				alert("암호가 일치하지 않습니다.");
				$("#pwd").val("");
				$("#pwd2").val("");
				return;
			}
			else {
				var frm = document.passwdUpdateFrm;
				frm.method = "POST";
				frm.action = "<%= ctxPath%>/member/passwdUpdate.hb";
				frm.submit();	
			}
		});
		
		
	});	


</script>

<form name = "passwdUpdateFrm">
	<div id="div_passwd" align="center">
		<span style="color: blue; font-size: 12pt;">새 암호</span><br/>
		<input type="password" name="pwd" id="pwd" size="15" placeholder="PASSWORD" required />
	</div>
	<div id="div_passwd2" align="center">
		<span style="color: blue; font-size: 12pt;">새 암호확인</span><br/>
		<input type="password" name="pwd2" id="pwd2" size="15" placeholder="PASSWORD" required />
	</div>
	
	<input type="hidden" name="userid" id="userid" value="${userid}" />
   
   <c:if test="${method.equals('POST') && n==1 }">
   		<div id="div_confirmResult" align="center">
   			ID : ${userid}님의 암호가 새로이 변경되었습니다.<br/>
   		</div>
   </c:if>
   
   <c:if test="${method.equals('GET')}">
	   <div id="div_btnUpdate" align="center">
	   		<button type="button" class="btn btn-success" id="btnUpdate">암호변경하기</button>
	   </div>		
   </c:if>
</form>
