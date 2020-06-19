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
		
		var agree = $("#agree").prop("checked");
		
		var bRequiredInfo = false;

		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
				return false;
			}
		});
		
		if(!bRequiredInfo) {
		   	  var frm = document.registerFrm;
		   	  frm.method = "POST";
		   	  frm.action = "memberRegister.up";
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
			<td style="width: 80%; text-align: left;"><input type="password" id="pwdcheck" class="requiredInfo" /> 
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
			   <input type="text" id="detailAddress" name="detailAddress" class="requiredInfo" size="40" placeholder="상세주소" />&nbsp;<input type="text" id="extraAddress" name="extraAddress" size="40" placeholder="참고항목" /> 
			   <span class="error">주소를 입력하세요</span>
			</td>
		</tr>
		
		<tr>
			<td style="width: 20%; font-weight: bold;">성별</td>
			<td style="width: 80%; text-align: left;">
			   <input type="radio" id="male" name="gender" value="1" /><label for="male" style="margin-left: 2%;">남자</label>
			   <input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
			</td>
		</tr>
		
		<tr>
			<td style="width: 20%; font-weight: bold;">생년월일</td>
			<td style="width: 80%; text-align: left;">
				<input type="number" id="birthyyyy" name="birthyyyy" min="1950" max="2050" step="1" value="1995" style="width: 80px;" required />
			   
				<select id="birthmm" name="birthmm" style="margin-left: 2%; width: 60px; padding: 8px;">
					<option value ="01">01</option>
					<option value ="02">02</option>
					<option value ="03">03</option>
					<option value ="04">04</option>
					<option value ="05">05</option>
					<option value ="06">06</option>
					<option value ="07">07</option>
					<option value ="08">08</option>
					<option value ="09">09</option>
					<option value ="10">10</option>
					<option value ="11">11</option>
					<option value ="12">12</option>
				</select> 
			   
			   	<select id="birthdd" name="birthdd" style="margin-left: 2%; width: 60px; padding: 8px;">
			   		<option value ="01">01</option>
					<option value ="02">02</option>
					<option value ="03">03</option>
					<option value ="04">04</option>
					<option value ="05">05</option>
					<option value ="06">06</option>
					<option value ="07">07</option>
					<option value ="08">08</option>
					<option value ="09">09</option>
					<option value ="10">10</option>
					<option value ="11">11</option>
					<option value ="12">12</option>
					<option value ="13">13</option>
					<option value ="14">14</option>
					<option value ="15">15</option>
					<option value ="16">16</option>
					<option value ="17">17</option>
					<option value ="18">18</option>
					<option value ="19">19</option>
					<option value ="20">20</option>
					<option value ="21">21</option>
					<option value ="22">22</option>
					<option value ="23">23</option>
					<option value ="24">24</option>
					<option value ="25">25</option>
					<option value ="26">26</option>
					<option value ="27">27</option>
					<option value ="28">28</option>
					<option value ="29">29</option>
					<option value ="30">30</option>
					<option value ="31">31</option>
				</select> 
			</td>
		</tr>
		
		<tr>
			<td style="width: 20%; font-weight: bold;">SMS 수신여부</td>
			<td style="width: 80%; text-align: left;">
				<label for="sms" style="margin-left: 2%;">동의&nbsp;&nbsp;</label><input type="checkbox" id="sms" name="sms" />
			</td>
		</tr>
		
		<tr>
			<td style="width: 20%; font-weight: bold;">E-Mail 수신여부</td>
			<td style="width: 80%; text-align: left;">
				<label for="email" style="margin-left: 2%;">동의&nbsp;&nbsp;</label><input type="checkbox" id="email" name="email"/>
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