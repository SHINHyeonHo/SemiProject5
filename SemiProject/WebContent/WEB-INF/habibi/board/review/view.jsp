<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력</title>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" /> 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">

	#container {
		width: 780px;
        height: 900px;
        margin: 0 auto;
        font-size: 0.9em;
        font-family: Verdana, Dotum, AppleGothic, sans-serif;
        color: #4c4b4b;
        text-align: center;
	}
	
    #title {
    	font-size: 0.75em;
        text-align: center;
        color: gray;
        font-family: AppleGothic;
    }
	
	table#view {
		width: 680px;
		height: 500px;
		border-collapse: collapse;
		margin: 30px auto 0 auto;
		border-top: solid 2px #BDBDBD;
		border-bottom: solid 2px #BDBDBD;
		text-align: left;
	}
		
	td {
		font-size: 0.8em;
		color: #6E6E6E;
		height: 40px;
	}
	
	.info {
		border-bottom: solid 1px #BDBDBD;
		
	}
	
	.row1 {
		text-align: left;
		padding-left: 10px;
		width: 70px;
		font-weight: bold;
	}
	
	#content {
		height: 400px;
		padding-left: 10px;
		vertical-align: top;
	}
	
	a, a:link, a:visited, a:active, a:hover {
        	text-decoration: none;
        	color: #4c4b4b; 
    } 
        
    #viewCMT {
		width: 680px;
    	border: solid 1px black;
		border-collapse: collapse;
    	margin: 0 auto;
    	font-size: 1em;
    }  
    
    #comment {
    	width: 400px;
    	text-align: left;
    	padding-left: 10px;
    	padding-right: 20px;
    	border: solid 1px black;
    }
    
    #userid {
    	font-weight: bold;
    	font-size: 1.1em;
    }
    
   #delete-cmt,  #modify-cmt {
    	float: right;
    }
    
    #content {
    }
   
	
</style>

<script>
	$(document).ready(function() {
		commentView();
		
	   // 댓글 달기
	   $(".btnCommentOK").click(function(){
		  
		   var cmt_content = $("#cmt_content").val().trim();
		   
		   if(cmt_content == "") {
			   alert("댓글 내용을 입력하여 주세요.");
			   return; 
		   }
		   
		   var queryString = $("form[name=cmtFrm]").serialize();
		   
		   $.ajax({
			   url:"/SemiProject/board/CMTinsert.hb",
			   type:"POST",
			   data:queryString,
			   success:function(){
				   commentView();
				   $("#cmt_content").val("").focus();
			   },
			   error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			   }
		   }); // end of ajax		   
	   }); // end of $(".btnCommentOK").click(function() {
	}) // end of $(document).ready(function() {
	
	// 댓글 보기
	function commentView() {
		$.ajax({
			url:"/SemiProject/board/CMTlist.hb",
			type:"GET",
			data:{"fk_rev_no":"${param.revNo}"},
			dataType:"JSON",
			success:function(json) {
				var html = "";
				
				if(json.length > 0) {    
					$.each(json, function(index, item){
					  html +=  "<tr><td id='comment'>"
					  		 + "<span id='userid'>"+item.fk_cmt_userid+"</span>&nbsp;&nbsp;|&nbsp;&nbsp;"
					         + "<span id='date'>"+item.cmt_write_date+"</span>"
					         + "<span id='no' style='display:none;'>"+item.cmt_no+"</span>"
					         + "<span id='modify-cmt'>수정</span>"
					         + "<span onclick='func_delete("+item.cmt_no+")' id='delete-cmt'>삭제</span></div><br>"
					         + "<span id='content'>"+item.cmt_content+"</span><br>"
					         + "<div id='update-cmt'></div></td></tr>";
					}); 
				} else {
					html += "<div>등록된 댓글이 없습니다.</div>";
				}
				
				$("#viewCMT").html(html);
		   },
		   error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		})
	}
	
	
	$(document).on('click','#modify-cmt',function(){
		
		var userid = $(this).parent().children("#userid").text();		
		var content = $(this).parent().children("#content").text();
		var cmt_no = $(this).parent().children("#no").text();
		
		var htmls = "<span>"+userid+"</span>"+
		 			"<textarea id='cmt_content'>"+content+"</textarea>"+
		 			"<input type='hidden' id='cmt_no' value="+cmt_no+">"+
		  			"<button id='btnOK'>확인</button>";
		  			
		var updateCMT = $(this).parent().children("#update-cmt");
		
		updateCMT.html(htmls);
		
	});
	
	$(document).on('click','#btnOK',function(){
		
		var formData = {"cmt_content":$("#cmt_content").val()
				       ,"cmt_no":$("#cmt_no").val()};
		var clean = $(this).parent();
				
		$.ajax({
			url:"/SemiProject/board/CMTmodify.hb",
			type:"POST",
			data:formData,
			success:function(){

				location.reload();	
				clean.remove();
				
			},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		});
	});
	
	// 댓글 삭제
	function func_delete(cmt_no) {
		
		var dlt = $(this).parent();
		
		$.ajax({
			url:"/SemiProject/board/CMTdelete.hb",
			type:"GET",
			data:{"cmt_no":cmt_no},
			success:function(){
				
				alert("댓글이 삭제되었습니다.");	
				location.reload();							
			},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		});
	}
	
</script>

</head>

<body>
	<div id="title"><h2>REVIEW</h2></div>
	<div id="container">
		<table id="view">
			<tr class="info">
				<td class="row1">제목</td>
				<td class="row2">${viewREV.rev_title}</td>
			</tr>
			<tr class="info">
				<td class="row1">작성자</td>
				<td class="row2" colspan="2">${viewREV.fk_userid}</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right;">${viewREV.rev_write_date}&nbsp;&nbsp;|&nbsp;&nbsp;조회&nbsp;${viewREV.rev_count}&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" id="content">${viewREV.rev_content}</td>
			</tr>
		</table>
		<table id="viewCMT">
			<!-- 댓글내용 들어오는 곳 -->
		</table>
		
	
	<span>댓글</span>
    
    <form name="cmtFrm">
    	<div>
    		<input type="text" name="fk_cmt_userid" value="${sessionScope.loginuser.userid}" style="border: none; background-color: white;" readonly>
    		<textarea cols="50" id="cmt_content" name="cmt_content"></textarea>
    		<input type="hidden" name="fk_rev_no" value="${param.revNo}">
    	</div>
    	<div style="display:inline-block;">
    		<button type="button" class="btnCommentOK">등록</button>
    	</div>
    </form>
    	<br>
    	<span style="float:left; padding-left:60px;">
		<a href="/SemiProject/board/REVlist.hb?prodCode=${param.prodCode}&p=${param.p}&f=${param.f}&q=${param.q}">목록</a>
		
 		<c:set var="loginuser" value="${sessionScope.loginuser.userid}" />
		<c:if test="${empty loginuser}">
	    <a class="write" onclick="alert('로그인한 회원만 글을 쓸 수 있습니다.')">글쓰기</a>
	    </c:if>
	    <c:if test="${not empty loginuser}">
	    <a class="write" href="/SemiProject/board/REVwrite.hb?prodCode=${param.prodCode}">글쓰기</a>
	    </c:if>
	    </span>
	    <span style="float:right; padding-right:60px;">
		<c:if test="${loginuser==viewREV.fk_userid}">
		<a href="/SemiProject/board/REVmodify.hb?prodCode=${param.prodCode}&revNo=${param.qnaNo}">수정</a>
		<a href="/SemiProject/board/REVdelete.hb?prodCode=${param.prodCode}&revNo=${param.qnaNo}" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
		</c:if>	
		</span>
		</div>	

</body>
</html>