<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 상세 정보(iframe)</title>
    <link rel="shortcut icon" type="image/x-icon" href="/SemiProject/images/Main/titleImage.png">

    <style>
        #detailPage {
            width: 780px;
            margin: 0 auto;
            padding-bottom: 30px;
            font-size: 0.75em;
            font-family: Verdana, Dotum, AppleGothic, sans-serif;
            color: #4c4b4b;
        }

        #content {
            margin-left: 50px;
            padding: 30px 0;
        }

        #prodImg {
            width: 500px;
            display: block;
            margin: 0 auto;
        }

        #prodDetail {
            width: 702px;
            margin: 0 auto;
        }

        .tblH3 {
            padding-left: 5px;
        }

        #dlvyInfo {
            margin-left: 20px;
        }

        .tblArea {
            margin-top: 30px;
        }
    </style>

</head>
<body>

    <div id="detailPage">
    	<c:forEach var="list" items="${prodList}">
	        <!-- 재료 및 사이즈 -->
	        <div id="content">
	            <p>재료 : <span>${list.prod_mtl }</span></p>
	            <p>색상 : <span>${list.prod_color }</span></p>
	            <p>사이즈 : <span>${list.prod_size }</span></p>
	        </div>
	
	        <!-- 제품 사진 -->
	        <div id="prodImg">
	            <img src="/SemiProject/images/Product/${list.prod_code}.png" style="width:500px; height:500px;">
	        </div>
		</c:forEach>
        <!-- 원목 및 색상 -->
        <img src="../images/ProdDetail//woodSel.png" style="width:777px; padding-top: 30px">

        <!-- 배송 및 고객센터 안내-->
        <div id="prodDetail">

            <table class="tblArea">
                <tr>
                    <td><img src="../images/ProdDetail//delivery.png" style="width: 30px; height: 30px;"></td>
                    <td class="tblH3"><h3>배송 안내</h3></td>
                </tr>
            </table>
            <p>
                하비비는 택배 배송, 화물 배송, 직접 배송으로 안전하게 배송해 드립니다.<br>
                수입되는 상품의 경우 주문과 동시에 제작 및 수입 진행이 되기도 하며, 제품에 따라 배송이 다소 지연될 수 있습니다.<br>
            </p>

            <div id="dlvyInfo">
                <p>
                    <span>* 택배 배송 (전국)</span><br>
                    부피가 적고, 조립 상품의 경우 택배 발송됩니다.<br>
                    택배비 : 구매 금액 5만원 이하 3,500원 / 5만원 이상 무료<br>
                    제품 재고가 있는 경우는 주문 후 (주말 및 공휴일 제외) 2~5일 정도 소요됩니다.
                </p>
                <p>
                    <span>* 화물 배송(서울,경기수도권 외)</span><br>
                    부피가 큰 가구는 주문양과 지역에 따라 화물 배송으로 진행되며 운송비가 추가될 수 있습니다.<br>
                    배송지의 환경에 따라 사다리차가 필요할 경우 비용은 구매자 부담입니다.<br>
                    화물 배송의 경우 소파나 식탁 등의 부피가 큰 제품은 화물 기사님 혼자 운반하기 힘들 수 있으며 <br>
                    고객님께서 잠시 도와주시거나 또는 배송 인원을 추가 시 추가 비용이 발생할 수 있습니다. 이는 구매자 부담입니다.
                </p>
                <p>
                    <span>* 직접 배송(서울,경기수도권 및 부산 지역)</span><br>
                    하비비 직접 배송은 서울/경기 수도권 지역 및 부산 지역으로 가능합니다.
                </p>
            </div>

            <table class="tblArea">
                <tr>
                    <td><img src="../images/ProdDetail//exchangeRefund.png" style="width: 30px; height: 30px;"></td>
                    <td class="tblH3"><h3>교환 및 환불 안내</h3></td>
                </tr>
            </table>
            <p>
                소비자 보호에 관한 법률 제17조에 의거 상품을 공급받은 날로부터 7일 이내에 교환/환불이 가능합니다. <br>
                단 주문제작가구, 상품을 조립한 경우 또는 상품의 택을 제거한 경우 교환/환불이 불가합니다.<br>
                단순 변심 등의 이유로 교환 및 반품은 제품과 택, 박스 등 보내드린 구성품이 훼손되어서는 안되며, 그대로 반송해 주셔야 합니다. <br>
                또한 이에 대한 왕복 택배비 또는 직접 운송비는 고객이 부담합니다.<br>
                원목 가구의 경우, 제품마다 색상과 결이 다를 수 있으며, 옹이가 포함될 수 있으며 이는 반품 사유에 해당하지 않습니다.<br>
            </p>

            <table class="tblArea">
                <tr>
                    <td><img src="../images/ProdDetail//customerService.png" style="width: 30px; height: 30px;"></td>
                    <td class="tblH3"><h3>고객센터 02.2020.0218</h3></td>
                </tr>
            </table>
            <p>
                각종 배송문의 또는 제품문의는 하비비 고객센터로 문의바랍니다.<br>
                평일 AM10:00 ~ PM7:00  /  주말 및 공휴일 AM11:00 ~ PM6:00<br>
                영업 시간 이외의 문의 사항은 이메일(habibi@habibi.co.kr)을 이용해 주세요. 빠른 문의는 익일 유선문의하시면 더욱 좋습니다.<br>
            </p>

        </div>
    </div>

</body>
</html>