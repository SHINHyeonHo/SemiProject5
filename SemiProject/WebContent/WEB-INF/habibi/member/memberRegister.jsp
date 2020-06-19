<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
<style type="text/css">

div#divRegisterFrm {
	float: right;
}

table#tblMemberRegister #th {
	height: 40px;
   	text-align: center;
   	background-color: silver;
   	font-size: 14pt;
}

table#tblMemberRegister td {
	line-height: 30px;
   	padding-top: 8px;
   	padding-bottom: 8px;
}
   
.star { 
	color: red;
    font-weight: bold;
    font-size: 13pt;
}

span#emailCheck {
	display: inline-block;
	width: 120px; 
	height: 30px; 
	border: solid 1px gray;
	border-radius: 5px; 
	font-size: 8pt; 
	text-align: center; 
	margin-left: 10px; 
	cursor: pointer;
}

</style>


<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		$(".error").hide();
				
	}); // end of $(document).ready(function() ----------------------
			
	function goRegister() {
		
		var bRequiredInfo = false;

		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
				return false;
			}
		});
		
		var agree = $("#agree").prop("checked");
		
		if(agree == false) {
			alert("이용약관에 동의해주시기 바랍니다.");
		}
		
		if(!bRequiredInfo && agree) {
		   	  var frm = document.registerFrm;
		   	  frm.method = "POST";
		   	  frm.action = "<%=request.getContextPath()%>/member/memberRegister.up";
		   	  frm.submit();
		}
		
	}
	
</script>

</head>



<jsp:include page="../member/login.jsp" />
<jsp:include page="../../Main/sideBar.jsp"/>

<div id="divRegisterFrm" class="row middle">
	<div class="col-md-12" align="center">
	
	<form name="registerFrm">
	<table id="tblMemberRegister">
		<thead>
		<tr>
			<th colspan="2" id="th">::: 회원가입 (<span style="font-size: 10pt; font-style: italic;"><span class="star">*</span>표시는 필수입력사항</span>) :::</th>
		</tr>
		</thead>
		
		<tbody>
		<tr>
			<td style="width: 20%; font-weight: bold;">성명&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;">
			    <input type="text" name="name" id="name" class="requiredInfo" /> 
				<span class="error">성명은 필수입력 사항입니다.</span>
			</td>
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">아이디&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;">
			    <input type="text" name="userid" id="userid" class="requiredInfo" />&nbsp;&nbsp;
			    <!-- 아이디중복체크 -->
			    <img id="idcheck" src="/SemiProject/images/Member/idCheck.jpg" style="border: solid 1px gray; vertical-align: middle; width: 180px; height: 30px;" />
			    <span id="idcheckResult"></span>
			    <span class="error">아이디는 필수입력 사항입니다.</span>
			</td> 
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">비밀번호&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;"><input type="password" name="pwd" id="pwd" class="requiredInfo" />
				<span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
			</td>
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">비밀번호확인&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;"><input type="password" name="pwdcheck" id="pwdcheck" class="requiredInfo" /> 
				<span class="error">암호가 일치하지 않습니다.</span>
			</td>
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">이메일</td>
			<td style="width: 80%; text-align: left;"><input type="text" name="email" id="email" class="requiredInfo" placeholder="abc@def.com" /> 
			    <span class="error">이메일 형식에 맞지 않습니다.</span>
			    
			    <span id="emailCheck" onclick="isExistEmailCheck();">이메일중복확인</span> 
			    <span id="emailCheckResult"></span>
			</td>
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">연락처&nbsp;<span class="star">*</span></td></td>
			<td style="width: 80%; text-align: left;">
			    <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" />&nbsp;-&nbsp;
			    <input type="text" id="hp2" name="hp2" size="6" maxlength="4" />&nbsp;-&nbsp;
			    <input type="text" id="hp3" name="hp3" size="6" maxlength="4" />
			    <span class="error">휴대폰 형식이 아닙니다.</span>
			</td>
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">우편번호&nbsp;<span class="star">*</span></td></td>
			<td style="width: 80%; text-align: left;">
			   <input type="text" id="postcode" name="postcode" class="requiredInfo" size="6" maxlength="5" />&nbsp;&nbsp;
			   <%-- 우편번호 찾기 --%>
			   <img id="zipcodeSearch" src="/SemiProject/images/Member/addressCode.jpg" style="vertical-align: middle; width: 130px; height: 30px;" />
			   <span class="error">우편번호 형식이 아닙니다.</span>
			</td>
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">주소&nbsp;<span class="star">*</span></td></td>
			<td style="width: 80%; text-align: left;">
			   <input type="text" id="address" name="address" class="requiredInfo" size="40" placeholder="주소" /><br/>
			   <input type="text" id="detailAddress" name="detailAddress" class="requiredInfo" size="40" placeholder="상세주소" />&nbsp;
			   <span class="error">주소를 입력하세요</span>
			</td>
		</tr>
		
		<tr>
			<td style="width: 20%; font-weight: bold;">SMS 수신여부</td>
			<td style="width: 80%; text-align: left;">
				<label for="sms" style="margin-left: 2%;">동의&nbsp;&nbsp;</label><input type="checkbox" id="smsad" name="smsad" />
			</td>
		</tr>
		
		<tr>
			<td style="width: 20%; font-weight: bold;">E-Mail 수신여부</td>
			<td style="width: 80%; text-align: left;">
				<label for="email" style="margin-left: 2%;">동의&nbsp;&nbsp;</label><input type="checkbox" id="emailad" name="emailad"/>
			</td>
		</tr>
			
		<tr>
			<td colspan="2">
				<label for="agree">이용약관에 동의합니다&nbsp;<span class="star">*&nbsp;&nbsp;</span></label><input type="checkbox" id="agree" />
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center; vertical-align: middle;">
				<iframe src="../iframeAgree/agree.html" width="85%" height="150px" class="box" ></iframe>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" id="btnRegister" style="border:none; width: 135px; height: 34px; margin-left: 30%;" onClick="goRegister();">JOIN</button> 
			</td>
		</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>
</div>
      
<jsp:include page="../../Main/footer.jsp"/>