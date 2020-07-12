<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
   
%>    

<jsp:include page="../../Main/header.jsp"/>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
   
   $(document).ready(function(){
      
      // 찾기
      $("#btnFind").click(function(){
         
         var useridVal = $("#userid").val().trim();
         var emailVal = $("#email").val().trim();
         
         if(useridVal != "" && emailVal != "") {
            var frm = document.pwdFindFrm;
            frm.method = "POST";
            frm.action = "<%= ctxPath%>/member/passwdFind.hb";
            frm.submit();
         }
         else {
            alert("아이디와 이메일을 입력하세요!!");
            return;
         }
      });// end of $("#btnFind").click(function(){})--------------
      
      var method = "${method}";
      var userid = "${userid}";
      var email = "${email}";
      var n = "${n}";
      
      if(method=="POST" && n==1) {
         $("#userid").val(userid);
         $("#email").val(email);
         $("#div_btnFind").hide();
      }
      else {
         $("#div_btnFind").show();
      }
      
      $("#btnConfirmCode").click(function(){
         var frm = document.verifyCertificationFrm;
         frm.userid.value = $("#userid").val();
         frm.userCertificationCode.value = $("#input_confirmCode").val();
         
         frm.action = "<%= ctxPath%>/member/verifyCerticode.hb";
         frm.method = "POST";
         frm.submit();
      });
   
      
   });// end of $(document).ready(function(){})---------------
   
</script>

<title>비밀번호찾기</title>
<jsp:include page="../../Main/sideBar.jsp"/>

<div style="border: solid 1px gray; float: right; margin-right: 300px; width: 400px; height: 400px; padding-top: 30px;">
<form name="pwdFindFrm">
   <div id="div_userid" align="center" style="margin-top: 10px;">
      <span style="color: blue; font-size: 12pt;">아이디</span><br/> 
      <input type="text" name="userid" id="userid" size="15" placeholder="ID" autocomplete="off" required />
   </div>
   
   <div id="div_email" align="center" style="margin-top: 10px;">
        <span style="color: blue; font-size: 12pt;">이메일</span><br/>
      <input type="text" name="email" id="email" size="15" placeholder="abc@def.com" autocomplete="off" required />
   </div>
    
   <div id="div_findResult" align="center" style="margin-top: 10px;">
        <c:if test="${n == 1}">
            <span style="font-size: 10pt;">인증코드가 ${email}로 발송되었습니다.</span><br/>  
            <span style="font-size: 10pt;">인증코드를 입력해주세요</span><br/>
            <input type="text" name="input_confirmCode" id="input_confirmCode" required />
            <br/><br/>
            <button type="button" class="btn btn-info" id="btnConfirmCode">인증하기</button>
        </c:if> 
        
        <c:if test="${n == 0}">
           <span style="color: red;" style="margin-top: 10px;">사용자 정보가 없습니다.</span> 
        </c:if> 
        
        <c:if test="${n == -1}">
           <span style="color: red;" style="margin-top: 10px;">메일발송이 실패했습니다.</span>  
        </c:if> 
   </div> 
          
   <div id="div_btnFind" align="center" style="margin-top: 10px;">
        <button type="button" class="btn btn-success" id="btnFind">찾기</button>
   </div>
</form>
<form name="verifyCertificationFrm">
   <input type="hidden" name="userid" />
   <input type="hidden" name="userCertificationCode" />
</form>

</div>
</div>

<jsp:include page="../../Main/footer.jsp"/>