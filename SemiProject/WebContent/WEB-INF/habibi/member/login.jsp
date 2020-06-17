<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">
   $(document).ready(function(){ 
      
      $("btnSubmit").click(function(){ 
         
         goLogin(); // 로그인 시도
         
      });
      
      $("#loginPwd").keydown(function(event){
            
            if(event.keyCode == 13){ // 암호 입력란에 엔터를 했을 경우   
               goLogin();// 로그인 시도한다.
            }
            
       });
      
   }); // end of $(document).ready(function()
         
   function goLogin(){
         
         // alert("확인용 로그인 처리");
         var loginUserid = $("#loginUserid").val().trim();
         var loginPwd = $("#loginPwd").val().trim();
         
         if(loginUserid == "") {
            alert("아이디를 입력하세요!!");
            $("#loginUserid").val("");
            $("#loginUserid").focus();
            
            return;   // goLogin() 함수 종료
         }
         
         if(loginPwd == "") {
            alert("암호를 입력하세요!!");
            $("#loginPwd").val("");
            $("#loginPwd").focus();
            
            return;   // goLogin() 함수 종료
         }
         
         var frm = document.loginFrm;
         frm.method = "post";
         frm.action = "<%=request.getContextPath()%>/login/login.hb";
         frm.submit();
         
   } // end of function goLogin(){}      

</script>
</head>
<body>
      <div class="login">
         <p style="font-weight:bold; padding-bottom:10px; color: #666;">MEMBER LOGIN</p>
         <!-- <legend>회원로그인</legend> -->
         <label class="id">
            <span>ID</span>
            <input id="loginUserid" name="userid" type="text" >
         </label>
         <label class="password">
            <span>PASSWORD</span>
            <input id="loginPwd" name="passwd" type="text" >
         </label>
         
         <p class="security">보안접속</p>
         
         <button type="button" style="cursor: pointer;" onclick="goLogin();">LOGIN</button>
         <button type="button" style="cursor: pointer;" onclick="goLogOut();">LOG OUT</button>
      </div>
   
   <div class="joinpart">
      <div class="joinbtn">
         <p style="font-weight:bold; color: #666;">JOIN US</p>
         <button type="button" style="cursor: pointer;" onclick="MemberRegister();">JOIN</button>
      </div>
      <p>
         <a href="findID.html" style="color: #666;">FIND ID</a>      
         <a href="findPassword.html" style="color: #666;">FIND PASSWORD</a>   
      </p>
   </div>
</body>
</html>