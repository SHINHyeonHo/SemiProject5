<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

	#topButton {
	   	position: fixed; 
	   	right: 2%;
	   	bottom: 50px; 
	   	display: none; 
	   	z-index: 999;
	   	}


</style>
<script type="text/javascript">

$(window).scroll(function() {
    // top button controll
    if ($(this).scrollTop() > 500) {
        $('#topButton').fadeIn();
    } else {
        $('#topButton').fadeOut();
    }
});

$(document).ready(function(){ // 로드되면
			
	// Top Button click event handler
	  $("#topButtonImg").click(function() {
	    $('html, body').animate({scrollTop:0}, '300');
	  });
});

</script>
    
    	<div id="topButton" style="cursor: pointer"><img id="topButtonImg" src="/SemiProject/images/admin/topbutton.png"></div>
    