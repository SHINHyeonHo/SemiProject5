<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%> 
    
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
<style type="text/css">

div#divRegisterFrm {
	padding-left: 100px;
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

.error {
	color: red;
}

</style>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	var bIdDuplicateCheck = false; // 아이디중복 확인 했는지 판단.
	var bEmailCheck = false;

	$(document).ready(function() {
		
		$(".error").hide();
		
		// 성명 확인
		$("#name").blur(function(){
			var data = $(this).val().trim();
			if(data == "") {
				$(this).parent().find(".error").show();
			}
			else {
				$(this).parent().find(".error").hide();
			}
		});
		
		// ID check
		$("#useridregister").blur(function(){
			var userid = $(this).val();
			var regExp_ID = /^[A-za-z0-9]{5,15}$/g;
			var bool = regExp_ID.test(userid);
			var data = userid.trim();
			
			if(data == "") {
				$(this).parent().find(".error").show();
				$("#idcheckResult").hide();
			}
			else {
				 if(bool && bIdDuplicateCheck) {
					$(this).parent().find(".error").hide();
					$("#idcheckResult").html("아이디 중복을 확인해주세요.");
				}
				else if(!bool) {
					$("#idcheckResult").html("엉어 대,소문자,숫자 6~12자리 조합으로 만들어주세요.");
				} 
			}
		});
		
		// 아이디 중복확인
		$("#idcheck").click(function() {
			$.ajax({
				url:"<%= ctxPath%>/member/idDuplicateCheck.hb",
				type:"post",
				data:{"useridregister":$("#useridregister").val()},
				dataType:"json",
				success:function(json){
					if(json.isUse){
						if($("#useridregister").val().trim() != "") {
							$("#idcheckResult").html("사용가능합니다.").css("color","navy");
							bIdDuplicateCheck = true;
						}
						else {
							$("#idcheckResult").html("아이디를 입력해주세요.").css("color","red");
						}
					}
					else {
						$("#idcheckResult").html($("#useridregister").val() + " 은 중복된 ID 입니다. 사용이 불가능합니다.").css("color", "red");
						$("#userid").val("");
					}
				},
				error:function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});			
		}); // end of $("#idcheck").click(function(){})
		
		$("#pwd").blur(function(){
			var passwd = $(this).val();
			var regExp_PW = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			var bool = regExp_PW.test(passwd);
			
			if(!bool) {
				$(this).parent().find(".error").show();
			}
			else {  
				$(this).parent().find(".error").hide();
			} 
		}); // end of $("#pwd").blur()
		
		$("#pwdcheck").blur(function(){
			var passwd = $("#pwd").val();
			var passwdCheck = $(this).val();
			
			if(passwd != passwdCheck) { 
				$(this).parent().find(".error").show();
			}
			else { 
				$(this).parent().find(".error").hide();
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
				}
			}
		});// end of $("#email").blur()
		
		$("#hp2").blur(function(){
			var hp2 = $(this).val();
			var regExp_HP2 = /^[1-9][0-9]{2,3}$/g;
			var bool = regExp_HP2.test(hp2);
			
			if(!bool) {
				$(this).parent().find(".error").show();
			}
			else {
				$(this).parent().find(".error").hide();
			}
		}); // end of $("#hp2").blur()
		
		$("#hp3").blur(function(){
			var hp3 = $(this).val();
			var regExp_HP3 = /^\d{4}$/g;
			var bool = regExp_HP3.test(hp3);
			
			if(!bool) {
				$(this).parent().find(".error").show();
			}
			else {
				$(this).parent().find(".error").hide();
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
	                document.getElementById("address").value = addr + addr2;
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();	
		}); // $("#zipcodeSearch").click(function(){})
		
	}); // end of $(document).ready(function(){})
	
	
	function isExistEmailCheck() {
		
		//순근이형꺼~~ㅎㅎㅎ
		
	} // end of function isExistEmailCheck() {}
	
	
	
	function goRegister() {
		
		var bRequiredInfo = false;

		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				$(this).parent().find(".error").show();
				alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
				return false;
			}
		});
		
		if(bRequiredInfo){
			return false;	
		}
		
		if(!bIdDuplicateCheck) {
			alert("아이디 중복확인을 해주세요.");
			return;
		}
		
		var agree = $("#agree").prop("checked");
		
		if(agree == false) {
			alert("이용약관에 동의해주시기 바랍니다.");
		}
		
		if(!bRequiredInfo && agree) {
		   	  var frm = document.registerFrm;
		   	  frm.method = "POST";
		   	  frm.action = "<%=request.getContextPath()%>/member/memberRegister.hb";
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
			<th colspan="2" id="th">::: 회원가입 (&nbsp;&nbsp;<span style="font-size: 10pt; font-style: italic;"><span class="star">*</span>표시는 필수입력사항</span>&nbsp;&nbsp;) :::</th>
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
			    <input type="text" name="useridregister" id="useridregister" class="requiredInfo" placeholder="영 대소문자, 숫자 6~12자리를"/>&nbsp;&nbsp;
			    <!-- 아이디중복체크 -->
			    <img id="idcheck" src="/SemiProject/images/Member/idCheck.jpg" style="border: solid 1px gray; vertical-align: middle; width: 180px; height: 30px; cursor: pointer;" />
			    <span id="idcheckResult"></span>
			    <span class="error">아이디는 필수 입력사항입니다.</span>
			</td> 
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">비밀번호&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;"><input type="password" name="pwd" id="pwd" class="requiredInfo" placeholder="숫자/문자/특수문자 8~15자리 이내" />
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
			    <span id="emailCheck" onclick="isExistEmailCheck();">이메일중복확인</span> 
			    <span class="error">이메일 형식에 맞지 않습니다.</span>
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
			   <img id="zipcodeSearch" src="/SemiProject/images/Member/addressCode.jpg" style="vertical-align: middle; width: 130px; height: 30px; cursor: pointer;" />
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
				<label for="smsad" style="margin-left: 2%;">동의&nbsp;&nbsp;</label><input type="checkbox" id="smsad" name="smsad" />
			</td>
		</tr>
		
		<tr>
			<td style="width: 20%; font-weight: bold;">E-Mail 수신여부</td>
			<td style="width: 80%; text-align: left;">
				<label for="emailad" style="margin-left: 2%;">동의&nbsp;&nbsp;</label><input type="checkbox" id="emailad" name="emailad"/>
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