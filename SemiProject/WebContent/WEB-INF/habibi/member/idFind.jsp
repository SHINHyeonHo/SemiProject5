<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
<<<<<<< HEAD
   
%>    

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
   
   $(document).ready(function(){
     
      var method = "${method}";
   //   console.log("method : " + method);
   
       if(method == "GET") {
         $("#div_findResult").hide();
       }
       else if(method == "POST") {
          $("#name").val("${name}");
          $("#mobile").val("${mobile}");
          $("#div_findResult").show();
       }
       
       
      $("#btnFind").click(function(){
         var frm = document.idFindFrm;
         frm.action = "<%= ctxPath%>/member/idFind.hb";
         frm.method = "POST";
         frm.submit();
      });
      
   });
   
</script>



<form name="idFindFrm">
   <div id="div_name" align="center">
      <span style="color: blue; font-size: 12pt;">성명</span><br/> 
      <input type="text" name="name" id="name" size="15" placeholder="하비비" autocomplete="off" required />
   </div>
   
   <div id="div_mobile" align="center">
        <span style="color: blue; font-size: 12pt;">휴대전화</span><br/>
      <input type="text" name="mobile" id="mobile" size="15" placeholder="-없이 입력하세요" autocomplete="off" required />
   </div>
   
   <div id="div_findResult" align="center">
        ID : <span style="color: red; font-size: 16pt; font-weight: bold;">${userid}</span> 
   </div>
   
   <div id="div_btnFind" align="center">
         <button type="button" class="btn btn-success" id="btnFind">찾기</button>
   </div>
   
</form>


      


=======
    //    /MyMVC
%>    

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
   
   $(document).ready(function(){
       
      var method = "${method}";
   //   console.log("method : " + method);
   
       if(method == "GET") {
         $("#div_findResult").hide();
       }
       else if(method == "POST") {
          $("#name").val("${name}");
          $("#mobile").val("${mobile}");
          $("#div_findResult").show();
       }
       
       
      $("#btnFind").click(function(){
         var frm = document.idFindFrm;
         frm.action = "<%= ctxPath%>/member/idFind.hb";
         frm.method = "POST";
         frm.submit();
      });
      
   });
   
</script>



<form name="idFindFrm">
   <div id="div_name" align="center">
      <span style="color: blue; font-size: 12pt;">성명</span><br/> 
      <input type="text" name="name" id="name" size="15" placeholder="홍길동" autocomplete="off" required />
   </div>
   
   <div id="div_mobile" align="center">
        <span style="color: blue; font-size: 12pt;">휴대전화</span><br/>
      <input type="text" name="mobile" id="mobile" size="15" placeholder="-없이 입력하세요" autocomplete="off" required />
   </div>
   
   <div id="div_findResult" align="center">
        ID : <span style="color: red; font-size: 16pt; font-weight: bold;">${userid}</span> 
   </div>
   
   <div id="div_btnFind" align="center">
         <button type="button" class="btn btn-success" id="btnFind">찾기</button>
   </div>
   
</form>
>>>>>>> refs/heads/master
