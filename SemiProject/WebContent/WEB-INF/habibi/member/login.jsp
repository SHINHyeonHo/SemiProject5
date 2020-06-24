<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




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
   
	function MemberRegister() {
		location.href="<%=request.getContextPath()%>/member/memberRegister.hb"
	} // end of function MemberRegister() -----------------------------

</script>



<!-- 모달 묶음으로 로그인 창처리 -->

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Login</h4>
	        </div>
	        
	        <div class="modal-body">
		       	<form name="loginFrm">
		         	<p style="font-weight:bold; padding-bottom:10px; color: #666;">MEMBER LOGIN</p>
		         	<!-- <legend>회원로그인</legend> -->
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
		         			<td><button type="button" style="cursor: pointer;" onclick="MemberRegister();">JOIN</button></td>
		         		</tr>
		         		<tr>
		         			<td><a href="<%= request.getContextPath() %>/member/idFind.hb" style="color: #666;">FIND ID</a>&nbsp;&nbsp;&nbsp;&nbsp; /</td>
		         			<td><a href="<%= request.getContextPath() %>/member/passwdFind.hb" style="color: #666;">FIND PASSWORD</a></td>
		         		</tr>
		         	</table>
				</form>
			</div>
			
	        <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			
		</div>
	    </div>
	</div>
