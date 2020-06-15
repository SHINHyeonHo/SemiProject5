<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하비비</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

<style type="text/css">
   
   div#wrap {
      border: solid 1px red;
      margin: 0 auto;
      padding: 10px;
      width: 100%;
   }
   
   header#header {
      border: solid 1px blue;
      width: 95%;
      height: 100px;
      display: inline-block;
      
   }
   
   div#container {
      border: solid 1px blue;
      width: 95%;
      height: 600px;
   }
   
   div.middle {
      display: inline-block;
      width: 80%;
   }
   
   div#left_sidebar {
      border: solid 1px blue;
      width: 15%;
      height: 600px;
   }
   
   div#main_banner {
      height:600px;
   }
   
   div#main_banner_top {
      display: block;
      border: solid 1px blue;
      width: 100%;
      height: 250px;
      margin-top: 5px;
   }
   
   div#main_banner_bottom {
      display: block;
      border: solid 1px blue;
      width: 100%;
      height: 250px;
      margin-top: 5px;
   }
   
   div.inner {
      border: solid 1px red;
      width: 95%;
      height: 100px;
      font-size: 8pt;
   }
   
   div.address {
      border: solid 1px black;
      width: 95%;
      height: 100px;
      font-size: 7pt;
   }
   
   div.address > p {
      margin: 0 auto;
   }
   
   div#logo{
         margin-top: 30px;
         width: 2px;
   }
   
   a{
         text-decoration: none;
         color: black;
         font-weight: bold;
   }
   
   ul {
      list-style-type: none;
      margin: 0;
      
      
   }
   
   ul#menu > li {
         margin-left: 5px;
         margin-right: 5px;
        display: inline;
   }
   
   div.main_menu{
         
         float:right;
   }
    
</style>

<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body class="main">
   <div id="wrap">
   
      <header id="header">
            <div id="logo" >
               <a href=".html"><!-- 메인페이지 -->
                  <img src="/SemiProject/images/Main/HABIBILOGO.png" width="175">
               </a>
            </div>
      
         <div class="main_menu">
            <ul id="menu">
               <li>
                  <a href="">NEWS</a>
               </li>
               <li>
                  <a href="">COMPANY</a>
               </li>
               <li>
                  <a href="">PHOTO</a>
               </li>
               <li>
                  <a href="">LOGIN</a>
               </li>
               <li>
                  <a href="">CART</a>
               </li>
            </ul>
         </div>
      </header>
      <div id="container">
         <div id="left_sidebar" class="middle">
         </div>
         
         <div id="main_banner" class="middle">
            <div id="main_banner_top">
            </div>
            
            <div id="main_banner_bottom">
            </div>
         </div>
      </div>
      
      
      <div class="inner">
      
      </div>
      
      
      <div class="address">
         <p>하비비 가구몰. 대표 권순근 / 120-10-70245 / 제2020-서울종각-02195호[사업자정보확인] / 개인정보관리 권순근 / HAVIVI@HAVIVI.CO.KR / COPYRIGHT &copy; 2020 하비비 ALL RIGHTS RESERVED</p>
      </div>
      
   </div>
</body>
</html>
