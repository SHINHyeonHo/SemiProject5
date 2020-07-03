<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<jsp:include page="../../Main/header.jsp"/>
<jsp:include page="../../Main/sideBarMypage.jsp"/>

<style type="text/css">
	
	div#divmemberEditFrm{
		width: 70%;
		float: right;
		margin-bottom: 100px;
	}
	
	div#memberEditHeader{
		border: solid 1px red; 
		font-family: '맑은 고딕';
		margin: 0px 0px 6px;
	}
	div#memberEditBody{
		border: solid 1px gray;
		font-size: 11px;
		margin-bottom: 50px;
	}
	div#memberEditBody th{
		font-size: 11px;
		padding: 10px 0px 8px 20px;
		color:#555555;
		
	}

</style>
</head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>


<script type="text/javascript">

	
	$(document).ready(function(){
		
		$(".error").hide();
		
		$("#name").blur(function(){
			var data = $(this).val().trim();
			if(data == "") {
				$(this).parent().find(".error").show();
			}
			else {
				$(this).parent().find(".error").hide();
				return;
			}
			
		});
		
		$("#passwd").blur(function(){
			var passwd = $(this).val();
			var regExp_PW = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			var bool = regExp_PW.test(passwd);
			
			if(!bool) {
				$(this).parent().find(".error").show();
			}
			else {  
				$(this).parent().find(".error").hide();
				return;
			} 
		}); // end of $("#pwd").blur()
		
		$("#passwdcheck").blur(function(){
			var passwd = $("#pwd").val();
			var passwdCheck = $(this).val();
			
			if(passwd != passwdCheck) { 
				$(this).parent().find(".error").show();
			}
			else { 
				$(this).parent().find(".error").hide();
				return;
			}
		});// end of $("#pwdcheck").blur()
		
		$("#email").blur(function(){
			var email = $(this).val();
			var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
			var bool = regExp_EMAIL.test(email);
			
			if(!bool) { 
				$("#emailCheckResult").hide();
				$(this).parent().find(".error").show();
			}
			else { 
				if(bEmailCheck == false) {
					$(this).parent().find(".error").hide();		
					$("#emailCheckResult").html("이메일 인증을 해주세요.");
					return;
				}
			}
		});// end of $("#email").blur()
		
		$("#mobile2").blur(function(){
			var hp2 = $(this).val();
			var regExp_HP2 = /^[1-9][0-9]{2,3}$/g;
			var bool = regExp_HP2.test(hp2);
			
			if(!bool) {
				$(this).parent().find(".error").show();
			}
			else {
				$(this).parent().find(".error").hide();
				return;
			}
		}); // end of $("#hp2").blur()
		
		$("#mobile3").blur(function(){
			var hp3 = $(this).val();
			var regExp_HP3 = /^\d{4}$/g;
			var bool = regExp_HP3.test(hp3);
			
			if(!bool) {
				$(this).parent().find(".error").show();
			}
			else {
				$(this).parent().find(".error").hide();
				return;
			}			
		});// end of $("#hp3").blur()
		
		$("#zipcodeSearch").click(function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = ''; // 주소 변수
	                var addr2 = ''; // 참고항목 변수

	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        addr2 += data.bname;
	                    }
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        addr2 += (addr2 !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    if(addr !== ''){
	                        addr2 = ' (' + addr2 + ')';
	                    }
	                } else {
	                }
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address1").value = addr + addr2;
	                document.getElementById("address2").focus();
	            }
	        }).open();	
		}); // $("#zipcodeSearch").click(function(){})
		
		
	}); // end of $("#memberDel").click(function()
	
	function goMemberEdit() {
		
		var flagBool = false;
		
		$(".requiredInfo").each(function(){  // 필수사항 입력 확인 값
			var data = $(this).val().trim();
			if(data == ""){
				flagBool = true;
				return false;
			}
		});
		
		if(flagBool){
			alert("필수 입력란은 모두 입력하셔야 합니다.");
			return;
		}
		else{
			var frm = document.memberEditFrm;
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/member/memberEditEnd.hb";
			frm.submit();
			
		}
	} // end of function goMemberEdit()
	
	function goMemberDel(){
		
		var flagBool = false;
		
		$(".requiredInfo").each(function(){  
			var data = $(this).val().trim();
			if(data == ""){
				flagBool = true;
				return false;
			}
		});
		
		if(flagBool){
			alert("필수 입력란은 모두 입력해야 합니다.");
			return;
		}
		else{
			var answer = confirm("정말 회원을 탈퇴하시겠습니까? 계속 진행할 경우 기존에 보유하고 있는 적립금이 소멸됩니다. 그래도 진행하시겠습니까?");
			
			if(answer){
				// 회원탈퇴 진행
				
				var frm = document.memberEditFrm;
				frm.method = "POST";
				frm.action = "<%= ctxPath%>/member/memberdel.hb";
				frm.submit();
				alert("그동안 HABIBI Mall을 이용해 주셔서 감사합니다.");
				
				return true;
			}else{
				// 회원탈퇴 진행 안함
				alert("이전 페이지로 이동 합니다.");
				return false;
			}
		}
		
		
		
	} // end of function goMemberDel()
	
	
</script>

<div id="divmemberEditFrm" class="row middle">
	<div class="col-md-12" align="center">

	<form name="memberEditFrm">
	    <div id="memberEditHeader" class="memberEditHeader">
	   		<h2 style="font-size: 20px; font-weight: bold;" align="center">MY INFO</h2>
	   		<p style="font-size: 16px; font-weight: bold;" align="center">회원 정보 수정</p>
	   		<h3 style="font-size: 13px; font-weight: bold;" align="center">기본 정보 </h3>
	   		<input type="hidden" name="idx" value="${sessionScope.loginuser.idx}"/>
	    </div>	
    <div class="memberEditBody" id="memberEditBody">
    <table>
      <tr>
         <th style="width: 20%; ">아이디</th>
         <td>
         	<input type="text" name="useridregister" id="useridregister" style="text-align: left; font-size: 10px;" value="${sessionScope.loginuser.userid}" readonly="readonly"/>
         </td>
      </tr>
      
      <tr>
			<th style="width: 20%; ">비밀번호&nbsp;<span class="star">*</span></th>
			<td style="width: 80%; text-align: left;"><input type="password" name="passwd" id="passwd" class="requiredInfo" placeholder="숫자/문자/특수문자 8~15자리 이내" />
				<span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
			</td>
	  </tr>
      
      <tr>
			<th style="width: 20%; ">비밀번호확인&nbsp;<span class="star">*</span></th>
			<td style="width: 80%; text-align: left;"><input type="password" name="passwdCheck" id="passwdCheck" class="requiredInfo" /> 
				<span class="error">암호가 일치하지 않습니다.</span>
			</td>
	  </tr>
      
      <tr>
			<th style="width: 20%; ">성명&nbsp;<span class="star">*</span></th>
			<td style="width: 80%; text-align: left;">
			    <input type="text" name="name" id="name" class="requiredInfo" value="${sessionScope.loginuser.name}" /> 
				<span class="error">성명은 필수입력 사항입니다.</span>
			</td>
	  </tr>
      
      <tr>
			<th style="width: 20%; ">이메일</th>
			<td style="width: 80%; text-align: left;"><input type="text" name="email" id="email" class="requiredInfo" value="${sessionScope.loginuser.email}" placeholder="abc@def.com" /> 
			</td>
	 </tr>
      
      <tr>
			<th style="width: 20%; ">우편번호&nbsp;<span class="star">*</span></th>
			<td style="width: 80%; text-align: left;">
			   <input type="text" id="postcode" name="postcode" class="requiredInfo" value="${sessionScope.loginuser.postcode}" size="6" maxlength="5" />&nbsp;&nbsp;
			   <%-- 우편번호 찾기 --%>
			   <img id="zipcodeSearch" src="/SemiProject/images/Member/addressCode.jpg" style="vertical-align: middle; width: 130px; height: 30px; cursor: pointer;" />
			   <span class="error">우편번호 형식이 아닙니다.</span>
			</td>
		</tr>
		<tr>
			<th style="width: 20%; ">주소&nbsp;<span class="star">*</span></th>
			<td style="width: 80%; text-align: left;">
			   <input type="text" id="address1" name="address1" class="requiredInfo" size="40" value="${sessionScope.loginuser.address1}" placeholder="주소" /><br/>
			   <input type="text" id="address2" name="address2" class="requiredInfo" size="40" value="${sessionScope.loginuser.address2}"placeholder="상세주소" />&nbsp;
			   <span class="error">주소를 입력하세요</span>
			</td>
		</tr>
      <tr>
			<th style="width: 20%; ">연락처&nbsp;<span class="star">*</span></th>
			<td style="width: 80%; text-align: left;">
			    <input type="text" id="mobile1" name="mobile1" class="requiredInfo" size="6" maxlength="3" value="010" />&nbsp;-&nbsp;
			    <input type="text" id="mobile2" name="mobile2" class="requiredInfo" size="6" maxlength="4" />&nbsp;-&nbsp;
			    <input type="text" id="mobile3" name="mobile3" class="requiredInfo" size="6" maxlength="4" />
			    <span class="error">휴대폰 형식이 아닙니다.</span>
			</td>
	  </tr>
      <tr>
			<th style="width: 20%; ">SMS 수신여부</th>
			<td style="width: 80%; text-align: left;">
				<label for="smsad" style="margin-left: 2%;">동의&nbsp;&nbsp;</label><input type="checkbox" id="smsad" name="smsad" />
			</td>
		</tr>
		
		<tr>
			<th style="width: 20%; ">E-Mail 수신여부</th>
			<td style="width: 80%; text-align: left;">
				<label for="emailad" style="margin-left: 2%;">동의&nbsp;&nbsp;</label><input type="checkbox" id="emailad" name="emailad"/>
			</td>
		</tr>
   </table>
   
   </div>
   
   <div id="btn-group" class="btn-group">
   	  <button type="button" class="btn btn-primary" onclick="goMemberEdit();">회원정보수정</button>
   	  <button type="button" class="btn btn-primary">취소</button>
   	  <button type="button" class="btn btn-primary" onclick="goMemberDel();">회원탈퇴</button>
   	  
   </div>
  
   </form>



</div>
</div>
</div>
<jsp:include page="../../Main/footer.jsp"/>