<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="../../Main/header.jsp"/>
<jsp:include page="../../Main/sideBar.jsp"/>
<style type="text/css">
	div#memberEditBody{
		border: solid 1px gray;
		display: inline;
		float: right;
	}
	p {
		margin: 0 0 0 0px;
	    color: #888;
	    font-family: "Malgun Gothic";
	    text-align: center;
	    font-size: 11px;
    }
   
</style>
</head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".error").hide();
	
	});
	
</script>
<form name="memberEditFrm">
   <div id="memberEditHeader">
   		<h2 align="center">MY INFO</h2>
   		<p align="center">회원 정보 수정</p>
   		<h3 align="left">기본 정보 </h3>
   </div>	
   <div class="memberEditBody" id="memberEditBody">	
   
   <table>
      <tr>
         <th>아이디</th>
         <td>
         	<input type="hidden" name="idx" value="${sessionScope.loginuser.idx}" readonly />
         	<input type="text" name="userid" id="userid" value="${sessionScope.loginuser.userid}" class="userid" required readonly="readonly" />  
         	<span class="error">아이디 형식에 맞지 않습니다.</span>
         </td>
      </tr>
      <tr>
         <th>비밀번호</th>
         <td>
         	<input type="password" name="pwd" id="pwd" class="requiredInfo" required />
         	<span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
         </td>
      </tr>
      <tr>
         <th>비밀번호 확인</th>
         <td>
         	<input type="password" name="pwd" id="pwdcheck" class="requiredInfo" required />
         	<span class="error">암호가 일치하지 않습니다.</span>
         </td>
      </tr>
      <tr>
         <th>이름</th>
         <td>
         	<input type="hidden" name="idx" value="${sessionScope.loginuser.idx}" readonly />
         	<input type="text" name="name" id="name" value="${sessionScope.loginuser.name}" class="requiredInfo" required />
         	<span class="error">성명은 필수입력 사항입니다.</span>
         </td>
      </tr>
      <tr>
         <th>주소</th>
         <td>
            <input type="text" id="postcode" value="${sessionScope.loginuser.postcode}" size="6" maxlength="5" />-<input type="button" value="우편번호"/><br>
            <input type="text" id="address" name="address" value="${sessionScope.loginuser.address1}" size="30" />  기본주소<br>
            <input type="text" id="detailAddress" name="detailAddress" value="${sessionScope.loginuser.address2}" size="40" />  나머지주소
            <span class="error">주소를 입력하세요</span>
         </td>
      </tr>
      <tr>
         <th>휴대전화</th>
         <td>
            <select>
               <option>010</option>
               <option>011</option>
               <option>016</option>
               <option>017</option>
               <option>018</option>
               <option>019</option>
            </select>
            &nbsp;-&nbsp;
            <input type="text" name="hp2" id="hp2" value="${sessionScope.loginuser.mobile2}" size="6" maxlength="4" />&nbsp; - &nbsp;
            <input type="text" name="hp3" id="hp3" value="${sessionScope.loginuser.mobile3}" size="6" maxlength="4" />
         	<span class="error">휴대폰 형식이 아닙니다.</span>
         </td>
      </tr>
      <tr>
         <th>SMS 수신여부</th>
         <td>
            <input type="radio" id="sms" name="sms"/><label for="sms">수신함</label>
            <input type="radio" id="smsx" name="sms"/><label for="smsx">수신안함</label>
            <p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
         </td>
      </tr>
      <tr>
         <th>이메일 수신여부</th>
         <td>
            <input type="radio" id="email" name="email"/><label for="email">수신함</label>
            <input type="radio" id="emailx" name="email"/><label for="emailx">수신안함</label>
            <p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
         </td>
      </tr>
   </table>
   
   </div>
   
   <div id="btn">
      <input type="button" value="회원정보수정"/>
      <input type="button" value="취소"/>
      <input type="button" value="회원탈퇴" style="float: right;"/>
   </div>

</form>
<jsp:include page="../../Main/footer.jsp"/>