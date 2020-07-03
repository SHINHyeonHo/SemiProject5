<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
    //     /MyMVC
%>


<!DOCTYPE html>
<html lang="en">
<head>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  

    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="/SemiProject/css/admin/admin.css" type="text/css">
    
    <style>
        td.confirm{
            margin-top: 10px;
            text-align: right;
            border-left: hidden;
            border-right: hidden;
            border-bottom: hidden;
        }
        .search{
            text-align: center;
            margin: 20px 0px;
        }
        #search{
            margin: 0px 10px;
        }

    </style>

</head>

<body>


<div class="admin">HABIBI 관리자 페이지</div>

<div class = "container">

	<jsp:include page="sideBar.jsp"></jsp:include>

    <div class="item" id="main">
		
		<%--
        <div id="top">회원관리</div>
        <table>

            <tr>
                <td>일반 회원</td>
                <td class="number"><span>16</span>명</td>
                <td>탈퇴회원</td>
                <td class="number"><span>1</span>명</td>
                <td>총 회원</td>
                <td class="number"><span>17</span>명</td>
            </tr>
		 --%>
       
        </table>


        <div class="menu">회원검색</div>
        
      
        <form name="searchFrm" style="margin-bottom:20px" method="post" action="">
        
        <select id="searchType" name="searchType" style="width:75px;height:21px;">
        	<option value="name">회원명</option>
			<option value="userid">아이디</option>
        </select>
        <input type="text" id="searchWord" name="searchWord" />
		<input type="text" style="display: none;">
		<button type="button" id="searchButton" style="margin-right: 30px;">검색</button>
		<button type="button" id="searchAllButton">전체조회</button>
        </form>
 		
 		<div id="resultTable"></div>
 		
 		
 		
 
 <script>
 
 $(document).ready(function(){//처음 로딩 될 때 실행 될 것. 
	 
	func_mbrAll("name","");// default
	
	$("#searchAllButton").click(function(){
		func_mbrAll("name","");
	});
	
	
	//회원 검색
	
	$("#searchButton").click(function(){
		
		var searchType= $("#searchType").val();
		//alert("타입명"+searchType);
		var searchWord = $("#searchWord").val().trim();
		
		if(searchWord==""){
			alert("상품명을 입력하세요");
			return;
		}
		
		//alert(searchType + searchWord);
		
		func_mbrAll(searchType,searchWord);
	});
	
	//회원 삭제  
	$(document).on('click','#deleteButton',function(){
		
		var checkedValue=[];
		
		$("input[type=checkbox]:checked").each(function(){
			checkedValue.push($(this).val()); //체크된 체크박스 한 행 한 행의 value 값을 빈문자열 checkedValue에 push해서 모은다. 
		});
		
		//유효성 검사 
		if(checkedValue.length==0){
			alert("선택한 회원이 없습니다.");
			return;
		}
		
		var useridString="'";
		
		for(var i=0;i<checkedValue.length;i++){
			
			useridString+=checkedValue[i]+"','";
			
		}
		useridString=useridString.substring(0, useridString.length-2);
		
		$.ajax({
		url:"/SemiProject/admin/deleteMember.hb",
		type:"GET",
		data:{"useridString":useridString},
		success: function(){
			
			alert("총"+checkedValue.length+"명의 회원이 삭제되었습니다.");
			func_mbrAll("name","");//전체 회원 조회 
		},
		
		 error: function(request, status, error){
			 alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error : "+error);
		 }
			
		});//end of Ajax
		
	});//end of 회원삭제
	

	
 });//end of $(document).ready(function(){
 
 //회원목록 전체조회
 
 function func_mbrAll(searchType,searchWord){
	 
 
	 $.ajax({
		 url:"/SemiProject/admin/searchMember.hb",//json을 받아올 controller 매핑된 url
		 type:"GET",
		 data:{"searchType":searchType,"searchWord":searchWord},//서버로 보낼 데이터
		 dataType:"json",//서버에서 jason형식으로 받아올 데이터 
		 success:function(json){
			 
			 
			 $("#searchWord").val(searchWord);//입력검색어그대로두기
			 
			 var html="";
			 if(json.length >0){//행이 있다면
				 
				 //column 명 출력 
				 html+= "<table><thead><th>선택</th>"
				        +"<th>아이디</th>"
				        +"<th>회원명</th>"
				        +"<th>이메일</th>"
				        +"<th>주소</th>"
				        +"<th>연락처</th>"
				        +"<th>sms수신동의</th>"
				        +"<th>email수선동의</th>"
				        +"<th>포인트</th>"
				        +"<th>탈퇴여부</th>"
				        +"<th>가입일자</th>"
				        +"<th>비밀번호변경일자</th>"
				        +"<th>최근접속일</th></thead><tbody>";
				
				        
				        $.each(json, function(index, item){
				        	
				        	var is_sms="";
				        	if(item.is_sms==1){
				        		is_sms="동의"}
				        	else{
				        		is_sms="거부"
				        	}
				        	
				        	var is_email="";
				        	if(item.is_email==1){
				        		is_email="동의"}
				        	else{
				        		is_email="거부"
				        	}
				        	
				        	var is_member="";
				        	if(item.is_member==1){
				        		is_member="회원"}
				        	else{
				        		is_member="탈퇴회원"
				        	}
				        	
				        
				        	
				        	html+="<tr>"
				        	+"<td><input type='checkbox' value='"+item.userid+"'></td>"
				        	+"<td>"+item.userid+"</td>"
				        	+"<td>"+item.name+"</td>"
				        	+"<td>"+item.email+"</td>"
				        	+"<td>"+item.address1+item.address2+"</td>"
				        	+"<td>"+item.mobile1+"-"+item.mobile2+"-"+item.mobile3+"</td>"
				        	+"<td>"+is_sms+"</td>"
				        	+"<td>"+is_email+"</td>"
				        	+"<td>"+item.point+"</td>"
				        	+"<td>"+is_member+"</td>"
				        	+"<td>"+item.join_date+"</td>"
				        	+"<td>"+item.last_passwd_date+"</td>"
				        	+"<td>"+item.last_login_date+"</td>"
				        	+"</tr>";

				        	
				        });
				        
				        
				        html  +="</tbody></table><div class='member-button'><button id='deleteButton' type='button' style='margin-top:30px;'>회원삭제</button></div>";
				        $("#resultTable").html(html);
				        
				        
			 }
			  else{
				 $("#resultTable").html("일치하는 회원명이 없습니다.")
			 } 
		 },
		 error: function(request, status, error){
			 alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error : "+error);
		 }
		 
	 });//end of ajax-------------
				        
	 };//end of func_mbrAll----------------
 
 
 
 
 
 </script>
 
 
 
</html>
