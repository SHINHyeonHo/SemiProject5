<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../Main/header.jsp"/>
    
<style type="text/css">
td {
   padding: 5px;
}
</style>
<script type="text/javascript">
   $(document).ready(function(){ 
      
      $("btnSubmit").click(function(){ 
         goLogin(); // 로그인 시도
      });
      
      $("#passwd").keydown(function(event){
         if(event.keyCode == 13){ // 암호 입력란에 엔터를 했을 경우   
            goLogin(); // 로그인 시도한다.
         }
      });
   }); // end of $(document).ready(function() -----------------------------------
   
   function goLogin() {
      var userid = $("#userid").val().trim();
      var passwd = $("#passwd").val().trim();
         
      if(userid == "") {
    	  alert("아이디를 입력하세요!!");
    	  $("#userid").val("");
    	  $("#userid").focus();
    	  return;   // goLogin() 함수 종료
         }
         
      if(passwd == "") {
         alert("암호를 입력하세요!!");
         $("#passwd").val("");
         $("#passwd").focus();
         return;   // goLogin() 함수 종료
        }
      
      var frm = document.loginFrm;
        
      frm.method = "post";
      frm.action = "<%=request.getContextPath()%>/member/login.hb";
      frm.submit();
   } // end of function goLogin(){} ------------------------------  
   
</script>
<title>Login</title>

<jsp:include page="../../Main/sideBar.jsp"/>

 <div>
      <form name="loginFrm">
        <p style="font-weight:bold; padding-bottom:10px; color: #666;">MEMBER LOGIN</p>
        <table>
           <tr>
              <td><span>ID</span></td>
              <td><input id="userid" name="userid" type="text" ></td>
           </tr>
           <tr>
              <td><span>PASSWORD</span></td>
              <td><input id="passwd" name="passwd" type="password" ></td>
           </tr>
           <tr>
              <td><button type="button" style="cursor: pointer;" onclick="goLogin();">LOGIN</button></td>
              <td><button type="button" style="cursor: pointer;" onclick="location.href='<%= request.getContextPath()%>/member/memberRegister.hb'">JOIN</button></td>
           </tr>
           <tr>
              <td><span onclick="location.href='<%= request.getContextPath()%>/member/idFind.hb'" style="color: #666; cursor: pointer; text-decoration: underline;">FIND ID</span>&nbsp;&nbsp;&nbsp;&nbsp; /</td>
              <td><span onclick="location.href='<%= request.getContextPath()%>/member/passwdFind.hb'" style="color: #666; cursor: pointer; text-decoration: underline;">FIND PASSWORD</span></td>
            </tr>
         </table>
   </form>
</div>


</div>

<jsp:include page="../../Main/footer.jsp"/>
