<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<style type="text/css">

div.main_banner {
	width: 74%;
	min-height: 3000px;
	float: right;
}

h3 {
	margin-top: 0;
}


</style>


<script type="text/javascript" src="/SemiProject/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>

</head>

<jsp:include page="../../Main/sideBar.jsp"/>


	<div id="main_banner" class="main_banner middle">
		<div id="main_banner_top">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
    			<ol class="carousel-indicators">
	      			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      			<li data-target="#myCarousel" data-slide-to="1"></li>
	      			<li data-target="#myCarousel" data-slide-to="2"></li>
    			</ol>

    			<!-- Wrapper for slides -->
    			<div class="carousel-inner">
	      			<div class="item active">
	        			<img src="/SemiProject/images/Product/H008SLP.png" alt="Los Angeles" style="width:100%;">
	      			</div>
	
	      			<div class="item">
	        			<img src="/SemiProject/images/Product/H007SLP.png" alt="Chicago" style="width:100%;">
	      			</div>
	    
	      			<div class="item">
	        			<img src="/SemiProject/images/Product/H006SLP.png" alt="New york" style="width:100%;">
	      			</div>
    			</div>

    			<!-- Left and right controls -->
    			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      			<span class="glyphicon glyphicon-chevron-left"></span>
	      			<span class="sr-only">Previous</span>
    			</a>
    			<a class="right carousel-control" href="#myCarousel" data-slide="next">
      				<span class="glyphicon glyphicon-chevron-right"></span>
      				<span class="sr-only">Next</span>
    			</a>
  			</div>
		</div>
		
		<br>
		<br>
		
		<h3>NEW</h3>
		<div id="main_banner_middle">
			<div id="main_middle_left" style="width: 50%; float: left;">
				<div>
					<a href="">
					<img src="/SemiProject/images/Product/H006SLP.png" style="width:95%; height:500px; margin-bottom: 10px;">
					</a>
				</div>
				<div>
					<a href="">
					<img src="/SemiProject/images/Product/H006SLP.png" style="width:95%; height:500px; margin-bottom: 10px;">
					</a>
				</div>
			</div>
			
			<div id="main_middle_right" style="width: 50%; float: right;">
				<div>
					<a href="">
					<img src="/SemiProject/images/Product/H006SLP.png" style="width:95%; height:300px; margin-bottom: 10px;">
					</a>
				</div>
				<div>
					<a href="">
					<img src="/SemiProject/images/Product/H006SLP.png" style="width:95%; height:300px; margin-bottom: 10px;">
					</a>
				</div>
				<div>
					<a href="">
					<img src="/SemiProject/images/Product/H006SLP.png" style="width:95%; height:400px; margin-bottom: 10px;">
					</a>
				</div>
			</div>
		</div>
		
		<br>
		<br>
		
		<h3>BEST</h3>
		<div id="main_banner_bottom">
			<div id="main_bottom_left" style="width: 50%; float: left;">
				<div>
					<a href="">
					<img src="/SemiProject/images/Product/H006SLP.png" style="width:95%; height:500px; margin-bottom: 10px;">
					</a>
				</div>
				<div>
					<a href="">
					<img src="/SemiProject/images/Product/H006SLP.png" style="width:95%; height:500px; margin-bottom: 10px;">
					</a>
				</div>
			</div>
			
			<div id="main_bottom_right"  style="width: 50%; float: right;">
				<div>
					<a href="">
					<img src="/SemiProject/images/Product/H006SLP.png" style="width:95%; height:1000px; margin-bottom: 10px;">
					</a>
				</div>
			</div>
		</div>
	</div>
	
</div>
      
      
<jsp:include page="../../Main/footer.jsp"/>