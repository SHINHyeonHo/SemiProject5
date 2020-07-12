<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
   //     /MyMVC
%>
    
<jsp:include page="../../Main/header.jsp" />

<style type="text/css">



	body{
	   margin: 0 auto;
	   width: 80%;
	   padding-top: 30px;
	   
	}
	
	div.title{
		text-align: center;
	}
	
	table{
		font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
		width: 90%;
		border-collapse: collapse;
		margin: 0 auto;
		margin-top: 30px;
		color: #666;
		line-height: 1.5;
		font-family: 'Malgun Gothic';
		
	    /* text-align: center; */
	}
	
	 
	table,tr,td,th{
		border:solid 1px navy;
	}
	
	
	ul{
		list-style: none;
	}
	
	li{
		font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
		color: #666;
		line-height: 1.5;
		font-family: 'Malgun Gothic';
	}
	
	a.goOrder{
		display: inline-block;
		width: 200px;
		height: 70px;
		border: solid 2px gray;
		text-align: center;
		line-height: 70px;
		font-size: 20pt;
		font-weight: bold;
		color: white;
		background-color: gray; 
		float: right;
		cursor: pointer;
	}
	
</style>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 주문자 정보와 동일한 배송지를 선택할 경우
		$("input:radio[id=sameAdress]").click(function(){
				
			$("input:text[id=customer]").val('${(sessionScope.loginuser).name}');
			$("input:text[class=postcode]").val('${(sessionScope.loginuser).postcode}');
			$("input:text[class=address1]").val('${(sessionScope.loginuser).address1}');
			$("input:text[class=address2]").val('${(sessionScope.loginuser).address2}');
			$("select[class=mobile1]").val('${(sessionScope.loginuser).mobile1}');
			$("input:text[class=mobile2]").val('${(sessionScope.loginuser).mobile2}');
			$("input:text[class=mobile3]").val('${(sessionScope.loginuser).mobile3}');
		
		});
		
		// 새로운 배송지를 입력할 경우
		$("input:radio[id=anotherAdress]").click(function(){
						
			$("input:text[id=customer]").val('');
			$("input:text[class=postcode]").val('');
			$("input:text[class=address1]").val('');
			$("input:text[class=address2]").val('');
			$("input:text[class=mobile2]").val('');
			$("input:text[class=mobile3]").val('');
			
		});
		
		
		$("#point").blur(function(){
			
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			
			var sumprice = $(".sumprice").text();
			var allPoint = $(".allPoint").text();			
			var point = $("#point").val();
					
			 if(allPoint-point<0){
				alert('사용가능한 적립금을 확인하세요.');
				point = 0;
				$(".point").text(0);
				$("#point").val(0);
				
				var lastPrice = $(".lastPrice").val();
				lastPrice = sumprice-point;
				$(".lastPrice").text(lastPrice);
				
				$("input:hidden[name=ordersumtotalPrice]").val(lastPrice);
				$("input:hidden[name=orderUsePoint]").val(point);
			} 
			 
			 else {
			$(".point").text(point);
			 				
			var lastPrice = $(".lastPrice").val();
			lastPrice = sumprice-point;
			$(".lastPrice").text(lastPrice);
			
			$("input:hidden[name=ordersumtotalPrice]").val(lastPrice);
			$("input:hidden[name=orderUsePoint]").val(point);
			 }
			 
			 if(lastPrice<0){
				 alert('총 결제금액 만큼만 적립금을 사용할 수 있습니다.')
				 
				 point = 0;
					$(".point").text(0);
					$("#point").val(0);
					
					var lastPrice = $(".lastPrice").val();
					lastPrice = sumprice-point;
					$(".lastPrice").text(lastPrice);
					
					$("input:hidden[name=ordersumtotalPrice]").val(lastPrice);
					$("input:hidden[name=orderUsePoint]").val(point);
			 }
		});
		
		
		$("#zipcodeSearch").click(function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = ''; // 주소 변수
	                var addr2 = ''; // 참고항목 변수

	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        addr2 += data.bname;
	                    }
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        addr2 += (addr2 !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    if(addr !== ''){
	                        addr2 = ' (' + addr2 + ')';
	                    }
	                } else {
	                }
	                
	                
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address1").value = addr + addr2;
	               // document.getElementById("address2").focus();
	            }
	        }).open();	
		}); // $("#zipcodeSearch").click(function(){})
		
	});// end of $(document).ready() -----------------------------------------------

	function goOrder(userid,sumtotalPrice){
		
		var bOrderInfo = false;
		
		$("input:hidden[name=orderUsePoint]").val($("#point").val());
		
		var data = $('#customer').val().trim();
		if(data == "") {
			alert("받으시는분의 정보를 입력하세요");
			bOrderInfo = true;
			return;
		}
		
		// 주소 유효성 검사
		var postcode = $('.postcode').val().trim();
		
		if(postcode == "") {
			alert("받으시는분의 주소를 입력하세요");
			bOrderInfo = true;
			return;
		}
		
		var address2 = $(".address2").val().trim();
		if(address2 == "") {
			alert("나머지 주소를 입력하세요");
			bOrderInfo = true;
			return;
		}
		
		
		// 전화번호 유효성 검사		
			var mobile2 = $(".mobile2").val();
			var regExp_mobile2 = /^[1-9][0-9]{3,4}$/g;
			var bool = regExp_mobile2.test(mobile2);
			
			if(!bool) {
				alert("연락처를 입력하세요");
				$(".mobile2").val('');
				$(".mobile2").focus();
				bOrderInfo = true;
				return;
			}
	
			var mobile3 = $(".mobile3").val();
			var regExp_mobile3 = /^[1-9][0-9]{3,4}$/g;
			var bool = regExp_mobile3.test(mobile3);
			
			if(!bool) {
				alert("연락처를 입력하세요");
				$(".mobile3").val('');
				$(".mobile3").focus();
				bOrderInfo = true;
				return;
			}
		
			var check = $('.orderAgree').prop("checked");
			if(!check){
				alert("구매진행에 동의하셔야 합니다.");
				bOrderInfo = true;
				return;
			}
			
	////////////////////////////////////////////////////////////////////
	
	// == 받는사람 처리
			
			var customer = $("input:text[class=customer]").val();
			$("input:hidden[name=orderName]").val(customer);
	
	// == 주문 전화번호 처리
			var mobile1 = $("select[class=mobile1]").val();
			var mobile2 = $("input:text[class=mobile2]").val();
			var mobile3 = $("input:text[class=mobile3]").val();
				
			$("input:hidden[class=orderMobile]").val(mobile1+mobile2+mobile3);
	
	// == 주문 주소 처리		
			var postcode = $("input:text[class=postcode]").val();
			var address1 = $("input:text[class=address1]").val();
			var address2 = $("input:text[class=address2]").val();
			
			$("input:hidden[name=orderAddress]").val(postcode+" "+address1+" "+address2);
	
	// == 배송 메세지 처리		
			
			var orderMemo = $("textarea[class=orderMemo]").val();
			$("input:hidden[name=orderMemo]").val(orderMemo);
	////////////////////////////////////////////////////////////////
		
	 	//  아임포트 결제 팝업창 띄우기
			var url="<%= request.getContextPath()%>/product/productPurchase.hb?userid="+userid+"&sumtotalPrice="+sumtotalPrice;
		
			if(!bOrderInfo){
				window.open(url, "productPurchase",
			    "left=350px, top=100px, width=820px, height=600px");
			}
			
	};

	
	function goCartUpdate(userid,sumtotalPrice) {
			
			var frm = document.cartUpdateFrm;
			
			
			frm.method = "POST";
			frm.action = "<%= request.getContextPath()%>/product/orderUpdate.hb";
			frm.submit(); 
		} 
	
	
</script>

<div class="title">
   <h2>ORDER</h2>
   <p>주문서 작성</p>
</div>

	<div>
		<span>주문내역</span>
	</div>

<div class="cart">
     <table border="1" class="left">
	 <thead>
		<tr>
              <th>이미지</th>
              <th>상품정보</th>
              <th>판매가</th>
              <th>수량</th>
              <th>적립금</th>
              <th>배송비</th>
              <th>합계</th>
        </tr>
   </thead>
   
   <tbody>
   <c:forEach var="cart" items="${cartList}" varStatus="status">
   		<tr>	
	        <td class="thumb">
	        	<img src="/SemiProject/images/Product/${cart.fk_prod_code}.png" width="100" height="100">
	        </td>
	        
	        
	        <td>      	      
				<strong>${cart.prod.prod_name}</strong>
			</td>
			
			
	        <td class="price">
		        <div>
					<strong id="price"><fmt:formatNumber value="${cart.prod.prod_price}" pattern="###,###" /></strong>원					
				</div>
	        </td>
	                                  
	        <td>
	            <span class="quantity">
	            ${cart.cart_stock}	
	            </span>
	        </td>
	                    
	        <td><fmt:parseNumber value="${cart.prod.totalPrice*0.01}" /> 원</td>
	                               
	            
	        <td>무료</td>
	          
	      	<td class="total">
				<strong id="totalMoney"><fmt:formatNumber value="${cart.prod.totalPrice}" pattern="###,###" /></strong>원
			</td>
		</tr>
		</c:forEach>
	</tbody>

	<tfoot>
		<tr>
			<td colspan="10">
				<span style="float: left;">[기본배송]</span>
					<div class="right"> 
						<span>상품구매금액</span>
						<strong>
							<span></span>
						</strong>
						<span> </span> + 배송비 (무료)
						<span> </span> = 합계 : 
						<strong>
							<span id="finalMoney"><fmt:formatNumber value="${sumtotalPrice}" pattern="###,###" /></span>원
						</strong>
					</div> 
			</td>
	    </tr>
	</tfoot>

</table>   
</div>

	<ul>
		<li>- 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
        <li>- 택배 배송 후 직접 조립하시는 방식이 아닌 리모드의 직접 배송을 요청하실 경우 지역에 따라 추가의 배송비가 추가될 수 있습니다. 02-2051-9888로 문의주세요.</li>
    </ul>


	<div>
		<span>주문자 정보</span>
	</div>


	<div id="userinform" >
   		<table border="1" class="left">
		      <tr>
		         <th>주문하시는분 </th>
		         <td><input type="text" value="${(sessionScope.loginuser).name}" readonly /></td>
		      </tr>
		      
		      <tr>
         		 <th>주소 </th>
		         <td>
		            <input type="text" size="5" value="${(sessionScope.loginuser).postcode}" readonly/>-<input type="button" value="우편번호"/><br>
		            <input type="text" size="30" value="${(sessionScope.loginuser).address1}" readonly/>  기본주소<br>
		            <input type="text" size="30" value="${(sessionScope.loginuser).address2}" readonly/>  나머지주소
		         </td>  
      		</tr>
      		
      		<tr>
		         <th>휴대전화 </th>
		         <td>
		            <input type="text" size="4" value="${(sessionScope.loginuser).mobile1}" readonly/>
		            -
		            <input type="text" size="4" value="${(sessionScope.loginuser).mobile2}" readonly/> - <input type="text" size="4" value="${(sessionScope.loginuser).mobile3}" readonly/>
		         </td>
		     </tr>
      		
      		<tr>
		        <th>이메일 </th>
		        <td>
		        <input type="text" value="${sessionScope.loginuser.email}" readonly/><br>
		        <span>이메일을 통해 주문처리과정을 보내드립니다.</span><br>
		        <span>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</span>
		        </td>	        
		    </tr>    		
      	</table>
     </div>

	
	
	<div>
		<span>배송지 정보</span>
	</div>
	
	
	<div id="addressinform">
   		<table border="1">
		      <tr>
		         <th>배송지선택</th>
		         	<td>
		         		<input type="radio" name="orderAdress" id="sameAdress"/><label name="orderAdress">주문자정보와 동일</label>
		         		<input type="radio" name="orderAdress" id="anotherAdress" /><label name="orderAdress">새로운 배송지</label>
		        	 </td>
		      </tr>
		      
		      <tr>
		         <th>받으시는분</th>
		         <td><input type="text" id="customer" class="customer"/></td>
		      </tr>
		      
		      <tr>
         		 <th>주소</th>
		         <td>
		            <input type="text" size="5" class="postcode" id="postcode"/>-<input type="button" value="우편번호 찾기" id="zipcodeSearch"/><br>
		            <input type="text" size="30" class="address1" id="address1"/>  기본주소<br>
		            <input type="text" size="30" class="address2"/>  나머지주소
		         </td>  
      		 </tr>
		      
      		
      		<tr>
		         <th>휴대전화</th>
		         <td>
		            <select class="mobile1">
		               <option>010</option>
		               <option>011</option>
		            </select>
		            -
		            <input type="text" size="4" class="mobile2" /> - <input type="text" size="4" class="mobile3"/>
		         </td>
		     </tr>
      		
      		<tr>
		         <th>배송메시지</th>
		         <td><textarea rows="3" cols="80" class="orderMemo"></textarea></td>
		      </tr>
      	    		
      	</table>
     </div>

	
	<div>
		<span>결제 예정 금액</span>
	</div>
	
	<div class="totalArea">
		
		<div class="summary">
			<table>
				<thead>
					<tr>
						<th colspan="1">총 주문 금액</th>
						<th colspan="2">총 할인 + 부가결제 금액</th>
						<th colspan="2">총 결제예정 금액</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td colspan="1" class="sumprice">${sumtotalPrice}</td>
						<td colspan="2" class="point">0</td>
						<td colspan="2" class="lastPrice">${sumtotalPrice}</td>
					</tr>
				</tbody>
	
				<tr>
					<th>적립금</th>					
					<td colspan="4">
					<input type="text" id="point" value="0"/>원 (총 사용가능 적립금 : <span class="allPoint">${(sessionScope.loginuser).point}</span>원)
						<ul>
							<li> - 적립금은 최소 0 이상일 때 결제가 가능합니다.</li>
							<li> - 최대 사용금액은 제한이 없습니다.</li>
							<li> - 적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<td colspan="5"><input type="checkbox" class="orderAgree" id="ckBox"><label for="ckBox">결제정보를 확인하였으며, 구매진행에 동의합니다.</label></td>
				</tr>
				
				<tr>
					<td colspan="5"><a href="javascript:goOrder('${(sessionScope.loginuser).userid}','${sumtotalPrice}');" class="goOrder">결제하기</a></td>					
				</tr>
			</table>
		</div>
		
		<form name="cartUpdateFrm">
			<input type="hidden" name="orderCartNo" value="${cartnojoin}" /><br>
			<input type="hidden" name="orderUserid" value="${(sessionScope.loginuser).userid}" /><br>
			<input type="hidden" name="orderName" /><br>
			<input type="hidden" name="orderProducts" value="${prodnamejoin}"/><br>
			<input type="hidden" name="orderProductsCode" value="${prodcodejoin}"/><br>
			<input type="hidden" name="orderOqty" value="${oqtyjoin}"/><br>
			<input type="hidden" name="orderMobile" class="orderMobile"/><br>
			<input type="hidden" name="orderAddress"/><br>
			<input type="hidden" name="orderMemo"/><br>
			<input type="hidden" name="ordersumtotalPrice" value="${sumtotalPrice}"/><br>
			<input type="hidden" name="orderUsePoint"/><br>
			<input type="hidden" name="orderAddPoint" value="${addPointjoin}" />
			<input type="hidden" name="ordertotalPrice" value="${totalPricejoin}"/><br>
		</form>
		
	</div>

<jsp:include page="../../Main/footer.jsp" />