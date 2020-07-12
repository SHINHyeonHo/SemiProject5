<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../Main/header.jsp"/>

<jsp:include page="../../Main/sideBar.jsp"/>
    

	<div>
		<div id="map"></div>
		
		<div style="float: right;">
			<!-- 
			주소		서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T: 1544-9970 / F: 02-722-0858) <br>
			버스		우리은행 종로지점 정류장  <br>
					163/172/201/262/401/406/701/704/N15/N62  <br>
					7017/7021/7022		8110  <br>
			지하철	지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M  <br> 
			-->
			<br/><br/>
			<img src="/SemiProject/images/shop/address.png" style/>
		</div>
	</div>
</div>

<title>찾아오시는 길</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c179fca8ebf9617530123e5bf842279"></script>

<style>
div#map {
	width: 78%;
	height: 600px;
	float: right;
}

div.mycontent {
	width: 300px;
	padding: 5px 3px;
}

div.mycontent>.title {
	font-size: 12pt;
	font-weight: bold;
	background-color: #d95050;
	color: #fff;
}

div.mycontent>.title>a {
	text-decoration: none;
	color: #fff;
}


div.mycontent>.desc {
 /* border: solid 1px red; */
	padding: 10px 0 0 0;
	color: #000;
	font-weight: normal;
	font-size: 9pt;
}

div.mycontent>.desc>img {
	width: 50px;
	height: 50px;
}
</style>

<script>

	$(document).ready(function() {
		
		var mapContainer = document.getElementById('map');
		
		var options = {
			center: new kakao.maps.LatLng(37.56800975043258, 126.9832248918777),
			level: 4
		}
		
		var mapobj = new kakao.maps.Map(mapContainer, options);
		
		var mapTypeControl = new kakao.maps.MapTypeControl();
		mapobj.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		var zoomControl = new kakao.maps.ZoomControl();
		mapobj.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);
		
		var bClick = false;
		
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var latitude = "37.56800975043258";
				var longitude = "126.9832248918777";
				
				var locPosition = new kakao.maps.LatLng(latitude, longitude);
				var imageSrc = '/SemiProject/images/shop/pointerPink.png'; 
			    var imageSize = new kakao.maps.Size(34, 39); 
			    var imageOption = {offset: new kakao.maps.Point(15, 39)};
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				
				var marker = new kakao.maps.Marker({ 
					map: mapobj, 
			        position: locPosition,
			        image: markerImage
				}); 
				
				marker.setMap(mapobj);
				
				var iwContent = " <div class='mycontent'> "
							  + " <div class='title'> "
						 	  + " <a href='https://map.kakao.com/link/map/HABIBI 가구몰," + latitude + "," + longitude + "' target='_blank'><strong>Habibi 가구몰</strong></a>"
							  + " </div>"
							  + " <div class='desc'>"
							  + " <img src='/SemiProject/images/shop/kh01.png' style='margin: 5px;'>"
							  +	" <div style='display: inline-block; padding-left: 10px;'>"
							  + " <a href='https://map.kakao.com/link/map/HABIBI," + latitude + "," + longitude + "' style='color:blue;' target='_blank'>큰지도</a>" 
							  + " <a href='https://map.kakao.com/link/to/HABIBI," + latitude + "," + longitude + "' style='color:blue' target='_blank'>길찾기</a>"
					  	 	  + " <br/>" 
					  	 	  + " <span class='address'>종로</span>"
					  	 	  +	" </div>"
							  + " </div>"
							  + " </div>";
				var iwPosition = locPosition;
				var iwRemoveable = true;
				
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent,
				    removable : iwRemoveable
				});
				mapobj.setCenter(locPosition);
				
				infowindow.open(mapobj, marker);
				
				kakao.maps.event.addListener(marker, 'click', function(){
					if(bClick) {
						infowindow.open(mapobj, marker);
						bClick=false;
					} else {
						infowindow.close();
						bClick=true;
					}
				});
				
			});
		}
		else {
			var locPosition = new kakao.maps.LatLng(37.56602747782394, 126.98265938959321);
			mapobj.setCenter(locPosition);
			
			kakao.maps.event.addListener(marker, 'click', function(){
				if(bClick) {
					infowindow.open(mapobj, marker);
					bClick=false;
				} else {
					infowindow.close();
					bClick=true;
				}
			});
			
		}
	/* 	
		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';
		var imageSize = new kakao.maps.Size(34, 39); 
		var imageOption = {offset: new kakao.maps.Point(15, 39)}; 
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		var movingMarker = new kakao.maps.Marker({ 
			map: mapobj, 
		       image: markerImage
		});
		var movingInfowindow = new kakao.maps.InfoWindow({
		    removable : false
	 	 // removable : true
		}); 
	
		kakao.maps.event.addListener(mapobj, 'click', function(mouseEvent) {
			 var latlng = mouseEvent.latLng;
			 movingMarker.setPosition(latlng);
			 movingInfowindow.setContent("<div style='padding:5px; font-size:9pt;'>찾을 위치<br/><a href='https://map.kakao.com/link/map/찾을 위치,"+latlng.getLat()+","+latlng.getLng()+"' style='color:blue;' target='_blank'>큰지도</a> <a href='https://map.kakao.com/link/to/여기,"+latlng.getLat()+","+latlng.getLng()+"' style='color:blue' target='_blank'>길찾기</a></div>");  
			 
			 movingInfowindow.open(mapobj, movingMarker);
		});
	*/	
	/* 
		var positionArr = [];
		
		$.ajax({
			url:"/SemiProject/shop/locationJSON.up",
			async:false,
			dataType:"json",
			success:function(json){
				$.each(json, function(index, item) {
					var position = {};
					
					position.content = "<div class='mycontent'>"
									 + "  <div class='title'>"
									 + "  <a href='" + item.storeurl + "' target='_blank'><strong>" + item.storename + "</strong></a>"
									 + "  </div>"
									 + "  <div class='desc'>"
									 + "    <img src='/MyMVC/images/" + item.storeimg + "'>"
									 + "    <span class='address'>" + item.storeaddress + "</span>"
									 + "  </div>"
									 + "</div>";
									 
					position.latlng = new kakao.maps.LatLng(item.lat, item.lng);
					position.zIndex = item.zIndex;
					
					positionArr.push(position);
				});
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		});
		
		var infowindowArr = new Array();
		
		for(var i=0; i<positionArr.length; i++) {
			var marker = new kakao.maps.Marker({
				map: mapobj,
				position: positionArr[i].latlng
			});
		
			marker.setMap(mapobj);
		
			var infoWindow = new kakao.maps.InfoWindow({
				content: positionArr[i].content,
				removable: true,
				zIndex: i+1
			}); 
			
			infowindowArr.push(infoWindow);
		
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(mapobj, marker, infoWindow, infowindowArr));
			
		}
	*/
	}); 
	
/* 
	function makeOverListener(mapobj, marker, infowindow) {
	    return function() {
	    	// alert("infowindow.getZIndex()-1:"+ (infowindow.getZIndex()-1));
	    	
	    	for(var i=0; i<infowindowArr.length; i++) {
	    		if(i == infowindow.getZIndex()-1) {
	    			infowindowArr[i].open(mapobj, marker);
	    		}
	    		else{
	    			infowindowArr[i].close();
	    		}
	    	}
	    };
	}
*/
</script>


<jsp:include page="../../Main/footer.jsp"/>
