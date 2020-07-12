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

 <div style="float: right; height: 300px;">
 	<div style="border: solid 1px gray; margin-right: 400px; width: 700px; height: 290px; padding: 50px;">
      <form name="loginFrm">
        <p style="font-weight:bold; padding-bottom:10px; color: #666;">MEMBER LOGIN</p>
        <table>
           <tr></tr>
           <tr style="border: solid 0.5px gray; height: 38px;">
           	<td><label for="userid" style="font-size: 8pt; color: gray;">ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
           	<td><input id="userid" name="userid" type="text" style="width: 200px; vertical-align: middle; margin: 0px; border: none; background-color: white;"></td>
           </tr>
           <tr style="border: solid 0.5px gray; height: 38px;" >
            <td><label for="passwd" style="font-size: 8pt; color: gray;">PASSWORD</label></td>
            <td><input id="passwd" name="passwd" type="password" style="width: 200px; vertical-align: middle; border: none;"></td>
           </tr>
           <tr> 
           <td sytle="width: 30px;"><img src="/SemiProject/images/Member/lock.png" style="border: solid 2px white; width:25px; height:25px;">보안접속</td>
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


</div>

<jsp:include page="../../Main/footer.jsp"/>
