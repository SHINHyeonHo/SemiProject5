<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<jsp:include page="../../Main/header.jsp"/>

<title>게시글 작성</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

   
<style type="text/css">

div.boardView {
	border: solid 1px blue;
	width: 78%;
	min-height: 1500px;
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

textarea {
      align: center;
      width: 98%;
      height: 400px;
      resize: none;
      margin: 10px auto;
      border: none;
      outline: none;
   }


div.detail{
	padding: 40px 0px 40px 20px;
	border-bottom: 1px solid dimgray;
}

div.btnArea{
	padding: 10px 0px 20px;
	margin:0 auto;
}
tr.border-top{
	border-top: 1px solid dimgray;
	margin-top:10px;
}
tr.border-bottom{
border-bottom: 1px solid dimgray;
margin-bottom:10px;
}
th{
   height: 50px;
}

th.title{
   height: 80px;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
</head>

<jsp:include page="../../Main/sideBar.jsp"/>


<div id="boardView">


	
	<h5 align=center style="margin-right: 5%;ghf ">NEWS</h5>


	<form method="post" name="registerFrm" action="/SemiProject/news/registerPost.hb" enctype="multipart/form-data" >
	<table>
	
		<tr class="border-top">
			<th scope="row" width="130px" class="title">title</th>
			 <td width="780px">
			  <input type="text" name="title" size="70" maxlength="100"/> 
			 </td> 
		</tr>
		
		<tr style="margin-top: 60px;">
         <th scope="row" width="130px">name</th>
          <td>
          <input type="text" name="writer" size="70" maxlength="100"/> 
          </td> 
      	</tr>
		
		
		 <tr class="attach"  style="margin-top: 60px;">
         <th scope="row">첨부파일</th>
         <td width="780px">
           <input type="file" name="file"/> 
          </td> 
         
      </tr>
      <tr class="view">
         <td colspan="2">
            <div class="detail" width="910px">
              <textarea style="border: solid 2px gray;" rows="50" cols="50" name="content"></textarea>
            </div> 
         </td>
      </tr>
      
   </table>

   <div class="btnArea" align="center">
   
   <div class="button">
   <button id="registerButton" type="submit" style="align:center; margin-left: 10%;ghf ">등록</button></div>
   </div>
      </form> 
   
   
</div>
		

<jsp:include page="../../Main/footer.jsp"/>

<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function formCheck() {
	var dc = document.forms[0];
	
	var title = title.value;
	var content = content.value;
	
	if(title == null || title == "") {
		alert("제목을 입력하세요.");
		dc.title.focus();
		return false;
	}
	
	if(content == null || content == "") {
		alert("글 내용을 입력하세요.");
		dc.qna_content.focus();
		return false;
	}
	
	
	
}			

</script>  


   