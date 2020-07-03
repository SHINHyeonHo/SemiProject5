<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

#footer {
	width: 1400px;
	margin: auto 0;
}

.inner {
	padding-bottom: 60px;
	padding-left: 160px;
}

.address {
	padding-top: 20px;
}

.address p {
	padding-left: 100px;
	font-size: 11px;
}

div.cominfo {
	display: inline-block;
	padding: 0 75px 0 75px;
}


p.sns {
	padding: 0 0 0 12px;
}

</style>

<script type="text/javascript">

function goShop() {
	location.href = "<%= request.getContextPath()%>/shop/location.hb";
}

var container_height = $("div#container").height();
$("div.left_sidebar").height(container_height);

</script>



	<div id="footer">
			<div class="inner">
				<div class="cominfo sns_menu" style="position: relative; top: -80px !important;">
					<h5>FOLLOW US</h5>
					<p class="sns">
						<a href="http://www.naver.com" title="blog" target="_blank"><img src="/SemiProject/images/Main/blog.png" width="50" height="50"></a>
					</p>
					<p class="sns">
						<a href="https://www.instagram.com" title="instargram" target="_blank"><img src="/SemiProject/images/Main/instargram.png" width="50" height="50"></a>
					</p>
				</div>
				<div class="cominfo" onclick="goShop();">
					<h3>SEOUL</h3>
					<p><strong>02.1111.1111</strong></p>
					<p>mon - fri " 10:00 - 19:00"</p>
					<p>서울 중구 남대문로 120 대일빌딩 2층 </p>
					<p>fax. 02.1111.1111</p>
					<p>e-mail. khac@habibi.hb</p>
					<p>하나은행 230-010059-41250 하비비</p>
					<p></p>
				</div>
				<div class="cominfo" onclick="goShop();">
					<h3>SEOUL2</h3>
					<p><strong>02.1111.1111</strong></p>
					<p>mon - fri " 10:00 - 19:00"</p>
					<p>서울 중구 남대문로 120 대일빌딩 2층 </p>
					<p>fax. 02.1111.1111</p>
					<p>e-mail. khac@habibi.hb</p>
					<p>하나은행 230-010059-41250 하비비</p>
					<p></p>
				</div>
				<div class="cominfo" style="padding-right: 0;">
					<P>PRIVACY POLICY<P>
					<P>DELIVERY<P>
					<P onclick="goShop();">LOCATION<P>
				</div>
			</div>
	
			<hr>
	
			<div class="address">
				<p style="font-size: 6px; margin-bottom: 30px;">하비비 가구몰. 대표 권순근 / 120-10-70245 / 제2020-서울종각-02195호[사업자정보확인] / 개인정보관리 권순근 / HAVIVI@HAVIVI.CO.KR / COPYRIGHT &copy; 2020 하비비 ALL RIGHTS RESERVED</p>
			</div>
	</div>
</div>
</body>
</html>