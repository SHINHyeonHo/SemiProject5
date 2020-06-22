<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="../../Main/header.jsp"/>

<title>HABIBI</title>
<link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

	<style type="text/css">

		#container {
			font-size: 0.9em;
			font-family: Verdana, Dotum, AppleGothic, sans-serif;
			color: #4c4b4b;
		}
		
		div.main_banner {
			/*border: solid 1px blue;*/
			width: 74%;
		}

		#divPageTop {
			width: 780px;
			margin: 0 auto;
		}

		#prodImg {
			float: left;
			height: 500px;
		}

		#prodInfo {
			float: right;
			width: 250px;
			height: 500px;
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			grid-template-rows: repeat(9, 1fr);
			color: #4c4b4b;
		}

		.item:nth-child(1),  .item:nth-child(n+12) {
			grid-column: 1/4;
		}

		.item:nth-child(3), .item:nth-child(5), .item:nth-child(7), .item:nth-child(9), .item:nth-child(11) {
			grid-column: 2/4;
		}

		#prodName {
			height: 50px;
			line-height: 50px;
			border-top: solid 1px #adadad;
			border-bottom: solid 1px #adadad;
			margin-bottom: 20px;
		}

		.infoArea {
			height: 30px;
			line-height: 30px;
			padding-left: 10px;
		}

		#woodSel {
			font-size: 1em;
			font-family: Verdana, Dotum, AppleGothic, sans-serif;
			color: #4c4b4b;
		}

		#prodQty {
			display: table;
			height: 60px;
			text-align: center;
			border-top: solid 1px #adadad;
			border-bottom: solid 1px #adadad;
			margin-top: 20px;
			margin-bottom: 20px;
		}

		.tblCell {
			display: table-cell;
			vertical-align: middle;
		}

		#qty {
			text-align: right;
			color: #4c4b4b;
			width: 40px;
			margin: 20px 10px;
		}

		.btnArea {
			margin-top: 5px;
		}

		.btn {
			width: 248px;
			height: 50px;
			cursor: pointer;
			font-size: 1em;
			font-family: Verdana, Dotum, AppleGothic, sans-serif;
			color: gray;
			background-color: white;
			border: solid 1px gray;
			outline: 0;
			border-radius: 0;
		}

		.btnBuy {
			color: white;
			background-color: #A4A4A4;
			border: solid 1px #A4A4A4;
		}

		#pageBtn {
			width: 780px;
			margin: 0 auto;
		}

		.btn2 {
			cursor: pointer;
			width: 260px;
			height: 40px;
			margin: 30px -5px 20px 0;
			color: gray;
			background-color: white;
			border: solid 1px gray;
		}

		.btn2:focus {
			color: white;
			background-color: #A4A4A4;
			border: solid 1px #A4A4A4;
			outline: 0;
		}

		iframe {
			width: 780px;
			margin-left: 59px;
			padding: 0;
			font-size: 0.75em;
			font-family: Verdana, Dotum, AppleGothic, sans-serif;
			color: #4c4b4b;
		}
	</style>

	<script>
		function func_movePage(url) {
			document.getElementById('frame').src = url;
		}

		function resizeIframe(obj) {
			obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
		}
	</script>

</head>
<body>

<jsp:include page="../../Main/sideBar.jsp"/>
<jsp:include page="../member/login.jsp" />

<div id="container">

	<div id="main_banner" class="main_banner middle">
		<div id="divPageTop">
		
<c:forEach var="list" items="${prodList}">
			
			<div id="prodImg">
				<!-- 제품 이미지 -->
				<img class="image" src="/SemiProject/images/Product/${list.prod_category}/${list.prod_code}.png" style="width:500px; height:500px;"/>
			</div>
	
			<div id="prodInfo">
				<!-- 제품 정보 -->
				<div class="item" id="prodName">${list.prod_name}</div>
	
				<div class="item infoArea">브랜드</div>
				<div class="item infoArea">habibi</div>
				<div class="item infoArea">원산지</div>
				<div class="item infoArea">korea</div>
				<div class="item infoArea">상품코드</div>			
				<div class="item infoArea">${list.prod_code}</div>
				<div class="item infoArea">가격</div>
				<div class="item infoArea"><span id="price">${list.prod_price}</span>원</div>
				<div class="item infoArea">색상</div>
				<div class="item infoArea">${list.prod_color}</div>
	
				<!-- 제품 수량 -->
				<div class="item" id="prodQty">
					<span class="tblCell">${list.prod_name}</span>
					<input class="tblCell" id="qty" type="number" min="1" max="10" value="1">
					<span class="tblCell"><span id="inputPrice">${list.prod_price}</span>원</span>
				</div>

			
			<!-- 구매 및 장바구니 버튼 -->
			<div class="item btnArea">
				<button class="btn btnBuy" onclick="">BUY NOW</button>
			</div>
			<div class="item btnArea">
				<button class="btn" onclick="">ADD TO CART</button>
			</div>
		</div>
	</div>

	<!-- 정보, 후기, 문의 버튼 -->
	<div id="pageBtn">
		<button class="btn2" id="dp" onclick="func_movePage('/SemiProject/prod/detail.hb?category=${list.prod_category}&prodCode=${list.prod_code}');" autofocus>상세 정보</button>
		<button class="btn2" id="rp" onclick="func_movePage('Mem_ReviewPage.html');">사용 후기</button>
		<button class="btn2" id="qp" onclick="func_movePage('Mem_QNAPage.html');">상품 Q&A</button>
	</div>

	<!-- iframe -->
	<iframe id="frame" src="/SemiProject/prod/detail.hb?category=${list.prod_category}&prodCode=${list.prod_code}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" onload="resizeIframe(this)"></iframe>
			
</c:forEach>

</div>
</div>

<jsp:include page="../../Main/footer.jsp"/>