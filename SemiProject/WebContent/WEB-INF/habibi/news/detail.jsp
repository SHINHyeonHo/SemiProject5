<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<jsp:include page="../../Main/header.jsp"/>

<title>게시글 상세</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

<style type="text/css">

div.boardView {
	border: solid 1px blue;
	width: 78%;
	min-height: 3000px;
	margin-top:50px;
}

table{
width:68%;
margin-top:40px;
}

th{
    color: dimgray;
    padding:8px 0px 8px 20px;
     
}

tr.view{
margin-top:30px;
}

td.detail{
	padding: 40px 0px 700px 20px;
	border-bottom: 1px solid dimgray;
	width:910px;
	line-height: 2.3em;
}

div.btnArea{
	padding: 10px 0px 20px;
	margin:0 auto;
}
tr.border-top{
	border-top: 1px solid dimgray;
	margin-top:10px;
}

img.post_image{
	height: 400px;
    length: 500px;
   margin-top:50px;
   margin-bottom:50px;

}

tr.attach{
border-top: 1px solid dimgray;
border-bottom: 1px solid dimgray;
}
tr.border-bottom{
border-bottom: 1px solid dimgray;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
</head>

<jsp:include page="../../Main/sideBar.jsp"/>


<div id="boardView">


	
	<h5 align="center">NEWS</h5>



	<table>
		<tr class="border-top">
			<th scope="row" width="130px">title</th>
			 <td width="780px">${nvo.news_title}</td> 
		</tr>
		<tr>
			<th scope="row" width="130px">name</th>
			 <td width="780px">${nvo.news_writer}</td> 
		</tr>
		<tr>
			<th scope="row" width="130px">date</th>
			 <td width="780px">${nvo.regdate}</td> 
		</tr>
		<tr class="border-bottom" >
			<th scope="row" width="130px">조회수</th>
			 <td width="780px">${nvo.hit}</td> 
		</tr>
		
	
		
		<tr class="view">
			<td class="block"colspan="2" >
			
			<c:set var="fileName" value="${nvo.news_no}.jpg"/>
			<c:if test= "${nvo.files == fileName}">
			<center><img class='post_image' src="/SemiProject/images/Post/${nvo.news_no}.jpg"></center>
			</c:if>
			</td>
		</tr>
		
		<tr>
		<td id="detail" class="block"  colspan="2" style="line-height: 2.3em;">
			${nvo.news_content}
		</td>
		</tr>
		<tr class="attach">
			<th scope="row">첨부파일</th>
			<td width="780px">${nvo.files}</td> 
		</tr>
		</table>
	<div class="btnArea" align="center">
	<button type="button" id="goback">목록</button>
	
	<button type="button" id="update">수정</button>
	
	<button type="button" id="delete">삭제</button>
	
	<input  id="news_no" type="text" value="${param.news_no}">
	
	</div>
	
	
	
</div>
	
	
	
</div>

<jsp:include page="../../Main/footer.jsp"/>

<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$("#goback").click(function(){
		
		location.href="/SemiProject/news/list.hb";
		
	});
	
	$("#update").click(function(){
		
		var news_no=$("#news_no").val();
		// alert(news_no);
		location.href="/SemiProject/news/updatePost.hb?news_no="+news_no;
		
	});
	
	$("#delete").click(function(){
		
		location.href="/SemiProject/news/deletePost.hb?news_no=${param.news_no}";
		
	});
	

</script>  


