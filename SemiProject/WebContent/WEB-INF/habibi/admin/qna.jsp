<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/SemiProject/css/admin/admin.css"
	type="text/css">
<style>

.search {
	text-align: center;
	margin: 20px 0px;
}

#search {
	margin: 0px 10px;
}

#searchTable {
	margin: 0 auto;
	border: solid 0px white;
}

body {
	font-size: small;
}

.back-to-habibi {
	padding: 3px;
	background-color: lightSteelBlue;
	position: absolute;
	right: 40px;
}

a#qna_title:link, a#qna_title:hover, a#qna_title:visited, a#qna_title:active {
	text-decoration: none; 
	color : black;
}

.qna-button {
            text-align: right;
            margin: 20px;
        }

</style>

</head>
<body>

	<header></header>

	<span class="admin">HABIBI 관리자 페이지</span>
	<span class="back-to-habibi"> <a href="../habibi.hb">HABIBI main page</a>
	</span>

	<div class="container">

	<jsp:include page="sideBar.jsp"></jsp:include>

		<div class="item" id="main">


			<div id="top">문의관리</div>
			<table>

				<tr>
					<td>대기 중 문의</td>
					<td><span id="unANScnt" class="font-bold"></span>개</td>
					<td>답변 완료 문의</td>
					<td><span id="ANScnt" class="font-bold"></span>개</td>
					<td>총 문의</td>
					<td><span id="all-qna" class="font-bold"></span>개</td>
				</tr>

			</table>

			<div class="search">
				<select id="searchCategory">
					<option value="fk_prod_code" selected>상품코드</option>
					<option value="fk_userid">작성자</option>
				</select> <input name="searchName" id="searchName" type="text" value="">
				<button id="searchButton" type="button">검색</button>
				<button id="searchAllButton" type="button">전체조회</button>
			</div>
			
			<div id="info-group">

				<table id="searchTable">

					<thead>
						<th>선택</th>
						<th>글 번호</th>
						<th>상품코드</th>
						<th>문의유형</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>답변</th>
						<th>비밀글</th>
						<th>등록여부</th>
					</thead>

					<tbody id='tbody'>
						<!-- 검색한 값이 들어오는 곳 -->
					</tbody>


				</table>

				<div class='qna-button'><button id='deleteButton' type='button'>문의삭제</button></div>

				<button type="button" id="more-button" value="">더보기</button>
				<span id="total-count"></span> <span id="count">0</span>


			</div>

			<div id="no-match">일치하는 문의가 없습니다.</div>


		</div>
	</div>
	<!-- </div>  -->


</body>

<script>

$(document).ready(function(){ // 로드되면

	$("#no-match").hide();
	$("#total-count").hide();
	$("#count").hide();
	
	func_qnaAll("fk_prod_code","",1); // 리로드 되자마자 전체조회
	
	
	$("#more-button").click(function(){ // 더보기 버튼 누르면		
		
		if($(this).text() == "처음으로"){
			
			$("#tbody").html("");
			$("#more-button").val("");
			$("#more-button").text("더보기");
			$("#count").text("0");
			var searchCategory = $("#searchCategory").val();
			var searchName = $("#searchName").val().trim();
			func_qnaAll(searchCategory,searchName,1);
			
		}else{
			
			var searchCategory = $("#searchCategory").val();
			var searchName = $("#searchName").val().trim();
			
		    if(searchName == null){
		    	searchName = "";
		    }
			
			func_qnaAll(searchCategory,searchName,$(this).val());
		}		
	});
	
	
	$("#searchAllButton").click(function(){ // 전체조회 버튼 누르면
		
		$("#tbody").html("");
		$("#more-button").val("");
		$("#more-button").text("더보기");
		$("#count").text("0");
		$("#info-group").show();
		$("#no-match").hide();
		func_qnaAll("fk_prod_code","",1);

		
	});
	
	// 상품 검색
	$("#searchButton").click(function(){ // 검색버튼 누르면
		
		var searchCategory = $("#searchCategory").val();
		var searchName = $("#searchName").val().trim();
		if(searchName == ""){
			
			alert("입력한 값이 없습니다.");
			return;
		}
		
		$("#tbody").html("");
		$("#more-button").val("");
		$("#more-button").text("더보기");
		$("#count").text("0");
		$("#info-group").show();
		$("#no-match").hide();
		func_qnaAll(searchCategory,searchName,1);	

	});
	
// ---------------------------- 상품 삭제 --------------------------------- 상품 삭제 --------------------------------------- 상품 삭제 ----------------------
	
	$(document).on('click','#deleteButton',function(){
		
		var checkedValue = [];
		
		$("input[type=checkbox]:checked").each(function(){
			
			checkedValue.push($(this).val());
		});
		
		// 유효성 검사
		if(checkedValue.length == 0){
			alert("선택된 문의가 없습니다.");
			return;
		}
					
		var qnaNoString = "'";
	    for(var i=0; i<checkedValue.length; i++){ // array to string
	    	
	    	qnaNoString += checkedValue[i]+"','"; 	
	    }
	    qnaNoString = qnaNoString.substring(0, qnaNoString.length-2);
		
		$.ajax({
			url:"/SemiProject/admin/QNAdelete.hb",
			type:"GET",
			data:{"qnaNoString":qnaNoString},
			success:function(){
				
				alert("총 "+checkedValue.length+"개의 문의가 삭제되었습니다.");	
				
				var count = 0;
				$("input[type=checkbox]:checked").each(function(){
					
					count ++;
					var tr = $(this).parent().parent();
					tr.remove();
		
				});
				
				var allQNA = parseInt($("#all-qna").text()); // 총 상품 개수
				$("#all-qna").text(allQNA - count);
							
			},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		}); // ajax

		
	});
	
// ---------------------------- 판매 상태 변경 --------------------------- 판매 상태 변경 ---------------------------------- 판매 상태 변경 ----------------------

	
	$(document).on('click','#changeStatusButton',function(){
		
		var qnaStatus = $(this).prev();
		var statusValue = qnaStatus.text();
		var qnaNo= $(this).val();
				
		var newStatusValue = "";
		var changeStatus = true;
		if(statusValue == "등록 중"){
			newStatusValue = "등록중지";
			changeStatus = confirm("상태를 "+newStatusValue+"로 변경하시겠습니까?");
			
		}else{
			newStatusValue = "등록 중";
			changeStatus = confirm("상태를 "+newStatusValue+"으로 변경하시겠습니까?");
		}
		
		if(changeStatus == false){
			return;
		}
				
		var data = newStatusValue+","+qnaNo;
		
		$.ajax({
			url:"/SemiProject/admin/QNAchangeStatus.hb",
			type:"GET",
			data:{"data":data},
			success:function(){
				
				qnaStatus.text(newStatusValue);
				alert("변경되었습니다.");	
	
			},
			
			error: function(request, status, error){
				alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
			}	
		}); // ajax
		

		
	});
	
//end of document ready	
});
	
	
	
function func_qnaAll(searchCategory, searchName, start) {
		
	var len = 20;	
	
	$.ajax({
		url:"/SemiProject/admin/QNAlist.hb",
		type:"GET",
		data:{"searchCategory":searchCategory,"searchName":searchName,"start":start,"len":len},
		dataType:"json",
		success:function(json){
			
			var count = json.count;
			var unANScnt = json.unANScnt;
			var ANScnt = json.ANScnt;
			
			$("#total-count").text(count); // 검색한 문의 개수			
			$("#searchCategory").val(searchCategory); // 입력한 카테고리 그대로 두기
			$("#searchName").val(searchName); // 입력한 검색어 그대로 두기

			var html =  "";
			
			if($(json.qnaList).length>0){
			
				$(json.qnaList).each(function(index, item){
						
					var status = "";
					
					if(item.qna_status == 0)
						status = "등록중지";
					else
						status = "등록 중";	
					
					var secret = "";
					
					if(item.qna_secret == 0)
						secret = "공개";
					else
						secret = "비밀글";
					
					var isDone = "";
					
					if(item.qna_is_done == 0)
						isDone = "대기";
					else
						isDone = "답변 완료"
					
					html +=  
		 					 "<tr>"
							+ "<td><input type='checkbox' value='"+item.qna_no+"'></td>"
							+ "<td>"+item.qna_no+"</td>"
							+ "<td>"+item.fk_prod_code+"</span></td>"
							+ "<td>"+item.qna_category+"</td>"
							+ "<td><a id='qna_title' href='/SemiProject/board/QNAview.hb?prodCode="+item.fk_prod_code+"&qnaNo="+item.qna_no+"'>"+item.qna_title+"</a></td>"
							+ "<td>"+item.fk_userid+"</td>"
							+ "<td>"+item.qna_write_date+"</td>"
							+ "<td>"+isDone+"</td>"
							+ "<td>"+secret+"</td>"
							+ "<td><span value="+item.qna_status+">"+status+"</span><button id='changeStatusButton' type='button' value='"+item.qna_no+"'>변경</button></td>"
							+ "</tr>";
				});
				
				// 결과 출력
				$("#tbody").append(html);
				
				// 더보기 value 변경
				$("#more-button").val(Number(start)+ len);
				
				// 지금까지 출력된 개수 누적
				$("#count").text(Number($("#count").text()) + $(json.qnaList).length);
				
				// 출력 누적 개수와 나와야 할 총개수가 일치하면
				if($("#count").text() == $("#total-count").text()){ 
					
					$("#more-button").text("처음으로");
					$("#count").text("0");
				}
					
				if(searchName == ""){ // 전체조회 상품 개수일때만 상단반 총 상품개수에 올려라
					$("#all-qna").text(count);
					$("#unANScnt").text(unANScnt);
					$("#ANScnt").text(ANScnt);
				}
		
			}
			else{
				
				$("#info-group").hide();
				$("#no-match").show();
			}
		},
		error: function(request, status, error){
			alert("code : "+request.status+"\n"+"message : "+request.responseText+"\n"+"error : "+error);
		}

	});
	
};// end of func_qnaAll(searchName)---------------


</script>
</html>