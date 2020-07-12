<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

.search-container {
  float: left;
  margin-bottom: 10px;
}

input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 10px;
  border: solid 0.5px gray;
}

button.search {
  width: 34px;
  height: 34px;
  float: right;
  padding: 0;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 19px;
  border: none;
  cursor: pointer;
}

div.searchBar {
   width: 284px;
   height: 42px;
}

ul {
   list-style-type: none;
   padding: 0;
}


li > ul {
   padding-left: 20px;
}

div.left_sidebar {
   width: 15%;
   float: left;
}

div.middle {
   display: inline-block;
}

.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  text-align: left;
  border: none;
  outline: none;
  transition: 0.4s;
}

div#container {
   overflow:hidden;
   height:auto;
   min-height: 500px;
}

li.side_menu1 {
   margin: 10px 0 10px 0;
}

</style>

<script type="text/javascript">
   
   function goSearch() {
      if($("#searchWord").val().trim() == "") {
         alert("검색어를 입력해주세요.");
         return;
      }
      else{
         var frm = document.searchBarForm;
         frm.method = "get";
         frm.action = "<%= request.getContextPath()%>/prod/searchProduct.hb";
         frm.submit();
      }
      
      $("#searchWord").keydown(function(event){
         if(event.keyCode == 13){   
            goSearch(); 
         }
      });
      
   }
   
</script>

<div id="container">

<div id="left_sidebar" class="left_sidebar middle">
   <div class="searchBar">
      <form name="searchBarForm">
         <div class="search-container">
            <div>
               <select name="sel" id="sel">
                           <option value="ALL" selected>ALL</option>
                           <option value="prod_name">NAME</option>
                           <option value="prod_category">CATEGORY</option>
                           <option value="prod_color" >COLOR</option>
                           <option value="prod_code">CODE</option>
                           <option value="prod_mtl">MATERIAL</option>
                   </select>
                </div>
            <input type="text" placeholder="Search.." id="searchWord" name="searchWord" size="20">
            <button type="button" id="searchProduct" class="search" onclick="goSearch();"><i class="fa fa-search"></i></button>
         </div>
      </form>
   </div>

   <div>
      <ul class="side_menu middle">
         <li class="side_menu1"><a href="<%= request.getContextPath() %>/member/myInfo.hb?idx=${sessionScope.loginuser.idx}" style="color:black;">MYPAGE</a></li>
         <li class="side_menu1"><a href="/SemiProject/member/memberEdit.hb?idx=${sessionScope.loginuser.idx}" style="color:black;">MYINFO</a></li>
         <li class="side_menu1"><a href="/SemiProject/prod/cartEdit.hb?idx=${sessionScope.loginuser.idx}" style="color:black;">CART</a></li>
         <li class="side_menu1"><a href="/SemiProject/member/point.hb?idx=${sessionScope.loginuser.idx}" style="color:black;">POINT</a></li>
      </ul>

   </div>
</div>