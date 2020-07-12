<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<jsp:include page="../../Main/header.jsp"/>

<title>공지목록</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

<style type="text/css">

div.main_banner {
/* 	border: solid 1px blue; */
	width: 78%;
	min-height: 1500px;
	margin-top:50px;
}
div#search{

margin-top:40px;
margin-bottom:40px;

}
table{
display:table-cell;
table-layout:fixed;
 margin-top: 100px;
}

table,th, tr, td {
    border: 1px solid white;
    border-collapse: collapse;
    text-align:center;
    vertical-align:middle;
    font-size:14px;
    padding:6px 4px;
  
    
}

th#border{
border-bottom:1px solid gray;
border-top:1px solid gray;
}
 
td#left{
text-align:left;
}
div#result{
margin-top:35px;
}

a,a:link,a:visited,a:active,a:hover{
text-decoration:none;
color: #4c4b4b;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
</head>

<jsp:include page="../../Main/sideBar.jsp"/>


	<div id="main_banner" class="main_banner middle">
		
    	<h5 align="center"><a href="/SemiProject/news/list.hb">NEWS</a></h5>
    	
    	<div id="search" align="right">
    	
    		<c:if test="${sessionScope.loginuser.userid eq 'admin'}">
    		<button type="button" id="btnWrite">글쓰기</button>
    		</c:if>
			<input type="text" id="searchWord2"/>
			<button type="button" id="btnSearch">search</button>
		</div>
    	
    	<table>
    		<thead>
    			<th width='120px' id='border'>no</th>
				<th width='750px' id='border'>title</th>
				<th width='100px' id='border'>name</th>
				<th width='100px' id='border'>date</th>
				<th width='100px' id='border'>조회</th>
		</thead>
		<tbody>
    			<c:forEach var="nvo" items="${noticeList}">
    			 <c:if test= "${nvo.is_post == 1}">
    					<tr>
			   		    <td class='news_no'>${nvo.news_no}</td>	
			        	<td id='left'><a href='/SemiProject/news/newsDetail.hb?news_no=${nvo.news_no}'>${nvo.news_title}</a></td>
			        	<td class='newsInfo'>${nvo.news_writer}</td>
			        	<td class='newsInfo'>${nvo.regdate}</td>
			        	<td class='newsInfo'>${nvo.hit}</td>
			        	</tr>
			       </c:if>
    	 		</c:forEach>
    	
		</tbody>
		</table>
		<div align="center">
		${pageBar}
		</div>
	</div>

	
      
      
<jsp:include page="../../Main/footer.jsp"/>

<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	//func_searchAll(""); //게시글 모두 나오게
	
	//글 검색
	
	$("#btnSearch").click(function(){
		
		var searchWord2=$("#searchWord2").val().trim();

		if(searchWord2==""){
			alert("검색할 단어를 입력하세요.");
			return;
		}
		else{
		location.href="/SemiProject/news/list.hb?searchWord="+searchWord2;
		
		}
		});

	
	$("#searchWord2").keydown(function(key){
		if(key.keyCode==13){
			var searchWord2=$(this).val().trim();

			if(searchWord2==""){
				alert("검색할 단어를 입력하세요.");
				return;
			}
			else{
			location.href="/SemiProject/news/list.hb?searchWord="+searchWord2;
			
			}
			
		}
	});
	
	//////////////////////////////////////////////////
	
	
	
	//글쓰기
	$("#btnWrite").click(function(){
		
		location.href="/SemiProject/news/writePost.hb";
		
	});
	
});

</script>


