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
   
   padding-top: 30px;
   border: solid 2px black;
}

div{
     /* border: solid 1px red;  */
    width: 90%;
    margin: 0 auto; 
}

div#link>ul{
   margin:0 auto;
   list-style: none;
   border-bottom: solid 1px gray;
  
   font-family: "돋움","맑은 고딕";
   font-size: 13px;
}

li{
   display: inline-block;
   /* border: solid 1px red; */
}


.title{
   text-align: center;
}

.right{
   float: right;
}

#btn{
   height: 50px;
   margin-top: 20px;
}


.inform{
   width: 90%;
   margin: 0 auto;
}

a{
   color: #666;
   font-weight: bold;
   text-decoration: none;
}

input{
   background-color: gray;
   color: white;
   margin-right: 10px;
   border: 0;
   text-align: center;
}

input:hover{
   background-color: white;
   color: gray;
   cursor: pointer;
}

table{
font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
width: 100%;
border-collapse: collapse;
margin: 0 auto;
margin-top: 30px;
color: #666;
line-height: 1.5;
font-family: 'Malgun Gothic';
text-align: center;
}

h4{
   line-height: 18px;
   font-family: "돋움","맑은 고딕";
   color: #666;
   font-size: 12px;
   font-weight: bold;  
}

h3{
   line-height: 18px;
    font-family: "돋움","맑은 고딕";
    font-size: 11px;
    color: #888;
}

.text{
   line-height: 18px;
    font-family: "돋움","맑은 고딕";
    font-size: 11px;
    color: #888;
}

.button>a{
	display: block;
}

div#btn > input{
	float: right;
}

div#cart{
	border: solid 1px black;
}

</style>

<script type="text/javascript" src="/JqueryStudy/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/JqueryStudy/util/myutil.js"></script>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">  
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 



<script type="text/javascript">

	$(document).ready(function(){
		
		// 체크박스 전체선택/ 전체해제
		
			$("#allCheck").click(function(){
			
			$("input:checkbox[name=product_01]").prop("checked",true);
			
			if(this.checked == false){
				$("input:checkbox[name=product_01]").prop("checked",false);	
			}
		});
		
		// 하위체크박스가 모두 체크되었을때/해제 되었을때 전체체크박스도 체크/해제
		
			$("input:checkbox[name=product_01]").click(function(){
				
				var bFlag = false;
				
				$("input:checkbox[name=product_01]").each(function(){
					var bool = $(this).prop("checked");
					if(!bool){
						$("input:checkbox[id=allCheck]").prop("checked",false);
						bFlag = true;
						return false;
					}		
				});
				
				if(!bFlag)
					$("input:checkbox[id=allCheck]").prop("checked",true);
			});
		

			$(".spinner").spinner({
		         min : 1,
		         max : 30,
		         step : 1
		      });
	
		
			$("#spinner").change(function(){
				alert("알림");
			});
	});


</script>

<div id="memberinfo">
	<table>
		<tr>
			<td></td>
		</tr>
	</table>
</div>

<div id="cart">
<div class="title">
   <h2>SHOPPING CART</h2>
   <p>장바구니</p>
</div>

<div id="link">
   <ul>
      <li>
      <a href="1.html" style="margin: 0;">국내배송상품(0)</a>
      </li>
      
      
      <li class="right">
    	  장바구니에 담긴 상품은 7일 동안 보관됩니다.
      </li>         
   </ul>   
</div>

<div class="cart">
     <table border="1" summary="" class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
	<thead>
		<tr>
			<th><input type="checkbox" id="allCheck"></th>
              <th>이미지</th>
              <th>상품정보</th>
              <th>판매가</th>
              <th>수량</th>
              <th>적립금</th>
              <th>배송구분</th>
              <th>배송비</th>
              <th>합계</th>
              <th>선택</th>
        </tr>
   </thead>
   
   <c:forEach var="cart" items="${cartlist}"> 
   <tbody>
   		<tr>
			<td>
				<input type="checkbox" name="product_01">
			</td>
			
	        <td class="thumb">
	        	<img src="//www.remod.co.kr/web/product/tiny/201909/803ff7ed045a68592bffe695e1a57278.jpg">
	        </td>
	        
	        <td>      	      
				<strong>${cart.fk_prod_name}</strong>
				<br>[옵션: Black] 
			</td>
	
	        <td class="price">
		        <div>
					<strong><fmt:formatNumber value="${cart.cart_price}" pattern="###,###" />원</strong>
				</div>
	        </td>
	                                  
	        <td>
	            
	            	<div id="example">  
                        <input type="text" id="spinner" class ="spinner" value="${cart.cart_stock}" />  
                    </div>
	            
	        </td>
	                    
	        <td>-</td>
	                               
	        <td class="delivery">기본배송</td>
	            
	        <td>무료</td>
	          
	      	<td class="total">
				<strong id="sum">${cart.cart_price}</strong>원
			</td>
			
	        <td class="button">
	           <a href="javascript:;" onclick="Basket.orderBasketItem(0);">주문하기</a>
	           <a href="javascript:;" onclick="BasketNew.moveWish(0);">관심상품등록</a>
	           <a href="javascript:;" onclick="Basket.deleteBasketItem(0);">삭제</a>
	        </td>
		</tr>
	</tbody>
	
	
	<tfoot>
		<tr>
			<td colspan="10">
				<span style="float: left;">[기본배송]</span>
					<div class="right"> 
						<span>상품구매금액</span>
						<strong>
							<span><fmt:formatNumber value="${cart.cart_price}" pattern="###,###" />원</span>
						</strong>
						<span> </span> + 배송비 (무료)
						<span> </span> = 합계 : 
						<strong>
							<span><fmt:formatNumber value="${cart.cart_price}" pattern="###,###" />원</span>
						</strong>
					</div> 
			</td>
	    </tr>
	</tfoot>
	</c:forEach>
</table>   
</div>

<div id="btn">
   <input type="button" value="전체상품주문"/>
   <input type="button" value="선택상품주문"/>
</div>

<div class="inform">

   <h4>이용안내</h4>
   <h3>장바구니 이용안내</h3>
   <ul class="text">
      <li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.<br></li>
      <li>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
      <li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
      <li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
      <li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
      <li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
   </ul>
   
   <h3>무이자할부 이용안내</h3>
   <ul class="text">
      <li>상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
        <li>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
        <li>단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>     
   </ul>
   
</div>
</div>




<jsp:include page="../../Main/footer.jsp" />