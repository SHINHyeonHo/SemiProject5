<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<style type="text/css">



@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
@import url(https://fonts.googleapis.com/css?family=Raleway:400,300,800);
@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);

figure.new_first {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;

  width:100%;
  background: #000000;	
  color: #000000;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.25);
}

figure.new_first * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.new_first img {
  opacity: 0.8;
  width: 100%;
  vertical-align: top;
  -webkit-transition: opacity 0.35s;
  transition: opacity 0.35s;
}

figure.new_first figcaption {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

figure.new_first figcaption > div {
  height: 50%;
  overflow: hidden;
  width: 100%;
  position: relative;
}

figure.new_first h5,
figure.new_first h4 {
  margin: 3px;
  position: absolute;
  left: 0;
  padding: 0 30px;
  text-transform: uppercase;
  
}

figure.new_first h5 {
  font-size: 2em;
  font-weight: 900;
  top: 0;
  color: white;
}

figure.new_first h4 {
  font-size: 2em;
  bottom: 0;
  font-weight: 400;
  color: white;
}

figure.new_first h4:nth-of-type(2) {
  opacity: 0;
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
}

figure.new_first a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  
}

figure.new_first:hover img,
figure.new_first.hover img {
  opacity: 0.3;
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
}

figure.new_first:hover figcaption h4:first-of-type,
figure.new_first.hover figcaption h4:first-of-type {
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
  opacity: 0;
}
figure.new_first:hover figcaption h4:nth-of-type(2),
figure.new_first.hover figcaption h4:nth-of-type(2) {
  opacity: 1;
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
}









figure.new_two {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;

  width:100%;
  background: #000000;	
  color: #000000;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.25);
}

figure.new_two * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.new_two img {
  opacity: 0.8;
  width: 100%;
  vertical-align: top;
  -webkit-transition: opacity 0.35s;
  transition: opacity 0.35s;
}

figure.new_two figcaption {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

figure.new_two figcaption > div {
  height: 50%;
  overflow: hidden;
  width: 100%;
  position: relative;
}

figure.new_two h5,
figure.new_two h4 {
  margin: 3px;
  position: absolute;
  left: 0;
  padding: 0 30px;
  text-transform: uppercase;
  
}

figure.new_two h5 {
  font-size: 2em;
  font-weight: 900;
  top: 0;
  color: white;
  
}

figure.new_two h4 {
  font-size: 2em;
  bottom: 0;
  font-weight: 400;
  color: white;
   
}

figure.new_two h4:nth-of-type(2) {
  opacity: 0;
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
}

figure.new_two a {
  left: 0;
  right: 0;
  top: 0px;
  bottom: 0;
  
}

figure.new_two:hover img,
figure.new_two.hover img {
  opacity: 0.3;
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
}

figure.new_two:hover figcaption h4:first-of-type,
figure.new_two.hover figcaption h4:first-of-type {
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
  opacity: 0;
}
figure.new_two:hover figcaption h4:nth-of-type(2),
figure.new_two.hover figcaption h4:nth-of-type(2) {
  opacity: 1;
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
}










figure.new_three {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;

  width:100%;
  background: #000000;	
  color: #ffffff;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.25);
}

figure.new_three * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.new_three img {
  max-width: 100%;
  position: relative;
  
}

figure.new_three .circle {
  position: relative;
  height: 70px;
  width: 70px;
  top: 0%;
  left: 0%;
  background-color: rgba(0, 0, 0, 0.45);
  border-radius: 50%;
  text-align: center;
}


figure.new_three .circle:before,
figure.new_three .circle:after {
  border: 2px solid #ffffff;
  border-right-color: transparent;
  position: absolute;
  content: '';
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  border-radius: 50%;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  -webkit-transition-delay: 0.45s;
  transition-delay: 0.45s;
}
     
figure.new_three .circle:before {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

figure.new_three .circle:after {
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}
     
figure.new_three figcaption {
  position: absolute;
  top: 40px;
  left: 30px;
  display: block;
  width: 100%;
  overflow: hidden;
} 

figure.new_three h2 {
  position: absolute;
  margin: 0;
  text-transform: uppercase;
  font-weight: 300;
  color:#ffffff;
  letter-spacing: 10px;
  line-height: 65px;
  top: 0%;
  left: 0%;
  width: 100%;
  padding: 0 20px;
  opacity: 0;
  -webkit-transform: translateX(-10%);
  transform: translateX(-10%);
}     
    
figure.new_three .icon {
  overflow: hidden;
  width: 100%;
  position: absolute;
}    
   
figure.new_three i {
  color: white;
  font-size: 60px;
  line-height: 70px;
  -webkit-transition-delay: 0.2s;
  transition-delay: 0.2s;
}   

figure.new_three a {
 
    z-index: 1;
}

figure.new_three:hover .circle,
figure.new_three.hover .circle {
  background-color: rgba(0, 0, 0, 0);
}

figure.new_three:hover .circle:before,
figure.new_three.hover .circle:before,
figure.new_three:hover .circle:after,
figure.new_three.hover .circle:after {
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

figure.new_three:hover h2,
figure.new_three.hover h2 {
  opacity: 1;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

figure.new_three:hover img,
figure.new_three.hover img {
  opacity: 0.35;
  -webkit-transform: scale(1.0);
  transform: scale(1.0);
}

figure.new_three:hover i,
figure.new_three.hover i {
  opacity: 0;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}








figure.new_four {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;

  width:100%;
  background: #000000;	
  color: #ffffff;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.25);
}

figure.new_four * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.new_four img {
  max-width: 100%;
  position: relative;
  
}

figure.new_four .circle {
  position: relative;
  height: 70px;
  width: 70px;
  top: 0%;
  left: 0%;
  background-color: rgba(0, 0, 0, 0.45);
  border-radius: 50%;
  text-align: center;
}


figure.new_four .circle:before,
figure.new_four .circle:after {
  border: 2px solid #ffffff;
  border-right-color: transparent;
  position: absolute;
  content: '';
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  border-radius: 50%;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  -webkit-transition-delay: 0.45s;
  transition-delay: 0.45s;
}
     
figure.new_four .circle:before {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

figure.new_four .circle:after {
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}
     
figure.new_four figcaption {
  position: absolute;
  top: 40px;
  left: 30px;
  display: block;
  width: 100%;
  overflow: hidden;
} 

figure.new_four h2 {
  position: absolute;
  margin: 0;
  text-transform: uppercase;
  font-weight: 300;
  color:#ffffff;
  letter-spacing: 10px;
  line-height: 65px;
  top: 0%;
  left: 0%;
  width: 100%;
  padding: 0 20px;
  opacity: 0;
  -webkit-transform: translateX(-10%);
  transform: translateX(-10%);
}     
    
figure.new_four .icon {
  overflow: hidden;
  width: 100%;
  position: absolute;
}    
   
figure.new_four i {
  color: white;
  font-size: 60px;
  line-height: 70px;
  -webkit-transition-delay: 0.2s;
  transition-delay: 0.2s;
}   

figure.new_four a {
 
    z-index: 1;
}

figure.new_four:hover .circle,
figure.new_four.hover .circle {
  background-color: rgba(0, 0, 0, 0);
}

figure.new_four:hover .circle:before,
figure.new_four.hover .circle:before,
figure.new_four:hover .circle:after,
figure.new_four.hover .circle:after {
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

figure.new_four:hover h2,
figure.new_four.hover h2 {
  opacity: 1;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

figure.new_four:hover img,
figure.new_four.hover img {
  opacity: 0.35;
  -webkit-transform: scale(1.0);
  transform: scale(1.0);
}

figure.new_four:hover i,
figure.new_four.hover i {
  opacity: 0;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}






figure.new_five {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;

  width:100%;
  background: #000000;	
  color: #ffffff;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.25);
}

figure.new_five * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.new_five img {
  max-width: 100%;
  position: relative;
  
}

figure.new_five .circle {
  position: relative;
  height: 70px;
  width: 70px;
  top: 0%;
  left: 0%;
  background-color: rgba(0, 0, 0, 0.45);
  border-radius: 50%;
  text-align: center;
}


figure.new_five .circle:before,
figure.new_five .circle:after {
  border: 2px solid #ffffff;
  border-right-color: transparent;
  position: absolute;
  content: '';
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  border-radius: 50%;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  -webkit-transition-delay: 0.45s;
  transition-delay: 0.45s;
}
     
figure.new_five .circle:before {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

figure.new_five .circle:after {
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}
     
figure.new_five figcaption {
  position: absolute;
  top: 40px;
  left: 30px;
  display: block;
  width: 100%;
  overflow: hidden;
} 

figure.new_five h2 {
  position: absolute;
  margin: 0;
  text-transform: uppercase;
  font-weight: 300;
  color:#ffffff;
  letter-spacing: 10px;
  line-height: 65px;
  top: 0%;
  left: 0%;
  width: 100%;
  padding: 0 20px;
  opacity: 0;
  -webkit-transform: translateX(-10%);
  transform: translateX(-10%);
}     
    
figure.new_five .icon {
  overflow: hidden;
  width: 100%;
  position: absolute;
}    
   
figure.new_five i {
  color: white;
  font-size: 60px;
  line-height: 70px;
  -webkit-transition-delay: 0.2s;
  transition-delay: 0.2s;
}   

figure.new_five a {
 
    z-index: 1;
}

figure.new_five:hover .circle,
figure.new_five.hover .circle {
  background-color: rgba(0, 0, 0, 0);
}

figure.new_five:hover .circle:before,
figure.new_five.hover .circle:before,
figure.new_five:hover .circle:after,
figure.new_five.hover .circle:after {
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

figure.new_five:hover h2,
figure.new_five.hover h2 {
  opacity: 1;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

figure.new_five:hover img,
figure.new_five.hover img {
  opacity: 0.35;
  -webkit-transform: scale(1.0);
  transform: scale(1.0);
}

figure.new_five:hover i,
figure.new_five.hover i {
  opacity: 0;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}







figure.best_first {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
 
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  font-size: 24px;
}

figure.best_first * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
}

figure.best_first img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}

figure.best_first figcaption {
  position: absolute;
  top: 45%;
  left: 7%;
  right: 7%;
  bottom: 45%;
  border: 1px solid white;
  border-width: 1px 1px 0;
}

figure.best_first .heading {
  overflow: hidden;
  -webkit-transform: translateY(50%);
  transform: translateY(50%);
  position: absolute;
  bottom: 0;
  width: 100%;
}

figure.best_first h6 {
  display: table;
  margin: 0 auto;
  padding: 0 10px;
  position: relative;
  text-align: center;
  width: auto;
  text-transform: uppercase;
  font-weight: 400;
  color: white;
  font-size: 24px;
}

figure.best_first h6 span {
  font-weight: 800;
}

figure.best_first h6:before,
figure.best_first h6:after {
  position: absolute;
  display: block;
  width: 1000%;
  height: 1px;
  content: '';
  background: white;
  top: 50%;
}
figure.best_first h6:before {
  left: -1000%;
}
figure.best_first h6:after {
  right: -1000%;
}

figure.best_first p {
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  position: absolute;
  width: 100%;
  padding: 0 20px;
  margin: 0;
  opacity: 0;
  line-height: 1.6em;
  font-size: 0.9em;
  color:white;
}


figure.best_first a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  
  z-index: 1;
}

figure.best_first:hover img,
figure.best_first.hover img {
  opacity: 0.25;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

figure.best_first:hover figcaption,
figure.best_first.hover figcaption {
  top: 7%;
  bottom: 7%;
}
figure.best_first:hover p,
figure.best_first.hover p {
  opacity: 1;
  -webkit-transition-delay: 0.35s;
  transition-delay: 0.35s;
}



figure.best_two {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
 
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  font-size: 24px;
}

figure.best_two * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
}

figure.best_two img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}

figure.best_two figcaption {
  position: absolute;
  top: 45%;
  left: 7%;
  right: 7%;
  bottom: 45%;
  border: 1px solid white;
  border-width: 1px 1px 0;
}

figure.best_two .heading {
  overflow: hidden;
  -webkit-transform: translateY(50%);
  transform: translateY(50%);
  position: absolute;
  bottom: 0;
  width: 100%;
}

figure.best_two h6 {
  display: table;
  margin: 0 auto;
  padding: 0 10px;
  position: relative;
  text-align: center;
  width: auto;
  text-transform: uppercase;
  font-weight: 400;
  color: white;
  font-size: 24px;
}

figure.best_two h6 span {
  font-weight: 800;
}

figure.best_two h6:before,
figure.best_two h6:after {
  position: absolute;
  display: block;
  width: 1000%;
  height: 1px;
  content: '';
  background: white;
  top: 50%;
}
figure.best_two h6:before {
  left: -1000%;
}
figure.best_two h6:after {
  right: -1000%;
}

figure.best_two p {
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  position: absolute;
  width: 100%;
  padding: 0 20px;
  margin: 0;
  opacity: 0;
  line-height: 1.6em;
  font-size: 0.9em;
  color:white;
}


figure.best_two a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  
  z-index: 1;
}

figure.best_two:hover img,
figure.best_two.hover img {
  opacity: 0.25;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

figure.best_two:hover figcaption,
figure.best_two.hover figcaption {
  top: 7%;
  bottom: 7%;
}
figure.best_two:hover p,
figure.best_two.hover p {
  opacity: 1;
  -webkit-transition-delay: 0.35s;
  transition-delay: 0.35s;
}







figure.best_three {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  
  width: 100%;
  color: #ffffff;
  text-align: left;
  font-size: 16px;
  background-color: #000000;
}

figure.best_three * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}

figure.best_three img {
  max-width: 100%;
  backface-visibility: hidden;
  
}

figure.best_three:after,
figure.best_three figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}

figure.best_three:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}

figure.best_three figcaption {
  z-index: 1;
  padding: 40px;
}
figure.best_three h1,
figure.best_three .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}

figure.best_three h1 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 2em;
  text-transform: uppercase;
  opacity: 0;
  color: white;
}
figure.best_three p {
  font-size: 1.2em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
  color: white;
  line-height: 150%;
  margin-top: 20%;
}

figure.best_three i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
  color: white;
}

figure.best_three a {
  
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.best_three:hover img,
figure.best_three.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}

figure.best_three:hover:after,
figure.best_three.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}

figure.best_three:hover h1,
figure.best_three.hover h1,
figure.best_three:hover p,
figure.best_three.hover p,
figure.best_three:hover i,
figure.best_three.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}






div.main_banner {
	width: 74%;
	min-height: 3000px;
	float: right;
}

div.carousel slide {
 
}

h3 {
	margin-top: 50px;;
}

</style>

<script>
$(".hover").mouseleave(
	    function() {
	      $(this).removeClass("hover");
	    }
	  );
	  
var index = 0;
window.onlad = function(){
	foreach().slideShow();
}

function slideShow() {
    var i;
    var x = document.getElementsByClassName("slide1");
    
    for (i = 0; i < slides.length; i++) {
       x[i].style.display = "none";  
    }
    index++;
    if (index > x.length) {index = 1}    
   	x[index-1].style.display= "block";
    setTimeout(slideShow,500);
}

</script>
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
    			<div class="slideshow-container">
	    			
	    			<div class="carousel-inner">	
		      			<div class="item active">
		        			<a href="/SemiProject/prod/page.hb?category=sleeping&prodCode=H003SLP">
		        				<img class="slide1" src="/SemiProject/images/Product/H003SLP.png" alt="Los Angeles" style="width:100%; height:700px;">
		      				</a>
		      			</div>
		
		      			<div class="item">
		      				<a href="/SemiProject/prod/page.hb?category=sleeping&prodCode=H007SLP">
		        				<img class="slide1" src="/SemiProject/images/Product/H007SLP.png" alt="Chicago" style="width:100%; height:700px;">
		      				</a>
		      			</div>
		    
		      			<div class="item">
		        			<a href="/SemiProject/prod/page.hb?category=sleeping&prodCode=H008SLP">
		        				<img class="slide1" src="/SemiProject/images/Product/H008SLP.png" alt="New york" style="width:100%; height:700px;">
		      				</a>
		      			</div>
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


		<br/>
		<br/>		
		<h3>NEW</h3>
		<div id="main_banner_middle" style="margin-bottom: 10px;">
			<div id="main_middle_left" style="border: solid 2px white; width: 50%; float: left;">
				<div>
					<figure class="new_first">
						<a href="/SemiProject/prod/page.hb?category=seating&prodCode=H007STG">
						<img src="/SemiProject/images/Product/H007STG.png" style="width:100%; height:400px; border: solid 2px white;"> 
						<figcaption>
    					<div>
					      <h4>Where there is love</h4>
					      <h4>There is life</h4>
					    </div>
					    <div>
					      <h5>pure White Sofa</h5>
					    </div>
  						</figcaption>
					</a>
					</figure>
				</div>
				
				<div>
					<figure class="new_two">
					<a href="/SemiProject/prod/page.hb?category=lighting&prodCode=H008LTG">
					<img src="/SemiProject/images/Product/H008LTG.png" style="width:100%; height:450px; border: solid 2px white;">
					<figcaption>
    					<div>
					      <h4>Just In This moment</h4>
					      <h4>Enjoy your life</h4>
					    </div>
					    <div>
					      <h5>Moody Lights</h5>
					    </div>
  					</figcaption>
					</a>
				</div>
				</figure>
			</div>
			
			<div id="main_middle_right" style=" width: 50%; float: right;">
				<div>
					<figure class="new_three">
					<a href="/SemiProject/prod/page.hb?category=storage&prodCode=H005STR">
					<img src="/SemiProject/images/Product/H005STR.png" style="width:100%; height:300px; border: solid 2px white;">
					<figcaption>
						<div class="circle"><i class="ion-ios-plus-empty"> </i></div>
    					<h2>Modern Shelf</h2>
					</figcaption>
					</a>
					</figure>
				</div>
				<div>
					<figure class="new_four">
						<a href="/SemiProject/prod/page.hb?category=sleeping&prodCode=H013SLP">
							<img src="/SemiProject/images/Product/H013SLP.png" style="width:100%; height:300px; border: solid 2px white;">
							<figcaption>
								<div class="circle"><i class="ion-ios-plus-empty"> </i></div>
		    					<h2>Brown Bed</h2>
							</figcaption>
						</a>
					</figure>
				</div>
				<div>
					<figure class="new_five">
						<a href="/SemiProject/prod/page.hb?category=table&prodCode=H020TBL">
						<img src="/SemiProject/images/Product/H020TBL.png" style="width:100%; height:250px; border: solid 2px white;">
						<figcaption>
							<div class="circle"><i class="ion-ios-plus-empty"> </i></div>
	    					<h2 s>Wooden Table</h2>
						</figcaption>
						</a>
					</figure>
				</div>
			</div>
		</div>
		
		<br/>
		<br/>

		<h3>                                                                                                                                                                   .</h3>		
		<h3 style="margin-bottom: -12px;">BEST</h3>
		<div id="main_banner_bottom">
			
			<div id="main_bottom_left" style=" width: 50%; float: left; margin-top: 20px; margin-bottom: 10px;">
				<div>
					<figure class="best_first">
						<a href="/SemiProject/prod/page.hb?category=seating&prodCode=H013STG">
							<img src="/SemiProject/images/Product/H013STG.png" style="border: solid 2px white; width:100%; height:500px;">
							<figcaption>
			    				<p>If you want comfort, sitting in this chair wouldn't be bad.</p>
			    				<div class="heading">
			      					<h6>My<span> Hobby</span></h6>
			   					</div>
		  					</figcaption>
						</a>
					</figure>
				</div>
				<div>
					<figure class="best_two">
						<a href="/SemiProject/prod/page.hb?category=sleeping&prodCode=H010SLP">
							<img src="/SemiProject/images/Product/H010SLP.png" style="border: solid 2px white; width:100%; height:500px; ">
							<figcaption>
			    				<p>If you think about your spine health, this will be your best choice.</p>
			    				<div class="heading">
			      					<h6>My<span> Home</span></h6>
			   					</div>
		  					</figcaption>
						</a>
					</figure>
				</div>
			</div>
			
			<div id="main_bottom_right"  style="border: solid 2px white; width: 50%; float: right; margin-top: 20px;">
				<div>
					<figure class="best_three">
						<a href="/SemiProject/prod/page.hb?category=storage&prodCode=H016STR">
							<img src="/SemiProject/images/Product/H016STR.png" style="width:100%; height:600px;">
							<figcaption>
    							<h1>Country rope shelf</h1>
    							<p>Which is worse, that everyone has his price, or that the price is always so low.</p><i class="ion-ios-arrow-right"></i>
  							</figcaption>
						</a>
					</figure>
				</div>
			</div>
			
			<div id="main_bottom_right"  style="border: solid 2px white; width: 50%; float: right;">
				<div>
					<figure class="best_three">
						<a href="/SemiProject/prod/page.hb?category=lighting&prodCode=H012LTG">
							<img src="/SemiProject/images/Product/H012LTG.png" style="width:100%; height:400px;">
							<figcaption>
    							<h1>Stand Side Of YourBed</h1>
    							<p>Which is worse, that everyone has his price, or that the price is always so low.</p><i class="ion-ios-arrow-right"></i>
  							</figcaption>
						</a>
					</figcaption>
				</div>
			</div>
		</div>
	</div>
	
</div>
      
      
<jsp:include page="../../Main/footer.jsp"/>