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

span.ordershopping{
	float: right;
	border: solid 2px gray;
	background-color: gray;
	color: white;
	margin-right: 10px;
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
			
			$("input:checkbox[name=fk_prod_code]").prop("checked",true);
			
			if(this.checked == false){
				$("input:checkbox[name=fk_prod_code]").prop("checked",false);	
			}
		});
		
		// 하위체크박스가 모두 체크되었을때/해제 되었을때 전체체크박스도 체크/해제
		
			$("input:checkbox[name=fk_prod_code]").click(function(){
				
				var bFlag = false;
				
				$("input:checkbox[name=fk_prod_code]").each(function(){
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
		         min : 0,
		         max : 30,
		         step : 1
		      });
	
			
	}); // end of $(document).ready(function())

	// === 장바구니에서 특정 제품을 비우기 === //  
	   function goDel(cart_num) {
	      
	      var $target = $(event.target);	   	
	      var pname = $target.parent().parent().find(".prod_name").text();
	      
	      var bool = confirm("선택하신 상품을 장바구니에서 제거하시는 것이 맞습니까?");
	   	      
	      if(bool) {
	         
	         $.ajax({
	            url:"/SemiProject/prod/cartDel.hb",
	            type:"POST",
	            data:{"cart_num":cart_num},
	            dataType:"JSON",
	            success:function(json){
	               if(json.n == 1) { // 특정 제품을 장바구니에서 비운후 페이지이동을 해야 하는데 이동할 페이지는 페이징 처리하여 보고 있던 그 페이지로 가도록 한다. 
	                  location.href= "<%= request.getContextPath()%>/${goBackURL}"; 
	               }
	            },
	            error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
	         });
	         
	      }
	      else {
	         alert("제품 삭제를 취소하셨습니다.");
	      }
	    
	   }// end of function goDel(cartno)---------------------------

	   
	   
	   
	// 장바구니 수량 수정
	   function goOqtyEdit(obj) {
	      
	      var index = $(".updateBtn").index(obj);
	      
	    // alert(index);
	      
	      var cart_num = $(".cart_num").eq(index).val();
	      
	   //  alert(cart_num) 
	      var cart_stock = $(".cart_stock").eq(index).val();
	      
	      var regExp = /^[0-9]+$/g; // 숫자만 체크하는 정규표현식
	      var bool = regExp.test(cart_stock);
	     
	      
	      if(!bool) {
	         alert("수정하시려는 수량은 0개 이상이어야 합니다.");
	         location.href="javascript:history.go(0);";
	         return;
	      }
	            
	      //alert("장바구니번호 : " + cart_num + "\n주문량 : " + cart_stock);
	     
	      else if (cart_stock == "0") {
	         goDel(cart_num);
	      }
	      
	      else {
	         $.ajax({
	               url:"/SemiProject/prod/cartEdit.hb",
	               type:"POST",
	               data:{"cart_num":cart_num,
	                     "cart_stock":cart_stock},
	               dataType:"JSON",
	               success:function(json){
	                  if(json.n == 1) {  
	                     location.href= "<%= request.getContextPath()%>/${goBackURL}"; 
	                  }
	               },
	               error: function(request, status, error){
	                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	               }
	            });
	      }
	     
	   }// end of function goOqtyEdit(obj)-----------------
	   
	   
	// === 장바구니에서 제품 주문하기 === // 
	   function goOrder() {
		   
	   ///// == 체크박스의 체크된 갯수(checked 속성이용) == /////
	       var checkCnt = $("input:checkbox[name=fk_prod_code]:checked").length; 
	   
	       if(checkCnt < 1) {
	           alert("주문하실 제품을 선택하세요!!");
	           return;
	        }
	       else{
	    	   var allCnt = $("input:checkbox[name=fk_prod_code]").length;
	    	   
	    	   console.log(allCnt);
	    	   
	    	   
	           var cartnoArr = new Array();
	           var totalPriceArr = new Array();
	           var prodnameArr = new Array();
	           var oqtyArr = new Array();
	           var prodcodeArr = new Array();
	           var addPointArr = new Array();
	           
	           for(var i=0; i<allCnt; i++) {
	                if( $("input:checkbox[class=chkboxpnum]").eq(i).is(":checked") ) {                  
	                  cartnoArr.push( $(".cart_num").eq(i).val() );
	                  totalPriceArr.push( $(".totalPrice").eq(i).val() );
	                  oqtyArr.push( $(".cart_stock").eq(i).val() );
	                  prodnameArr.push($("input:hidden[class=prod_name]").eq(i).val() );
	                  prodcodeArr.push($("input:checkbox[class=chkboxpnum]").eq(i).val() );
	                  addPointArr.push(Number($("input:hidden[class=addPoint]").eq(i).val()) );
	               }
	            }
	           	           
	           
	           var cartnojoin = cartnoArr.join();
	           var totalPricejoin = totalPriceArr.join();
	           var prodnamejoin = prodnameArr.join();
	           var oqtyjoin = oqtyArr.join();
	           var prodcodejoin = prodcodeArr.join();
	           var addPointjoin = addPointArr.join();
	          
	           
	           var sumtotalPrice = 0;
	            for(var i=0; i<totalPriceArr.length; i++) {
	               sumtotalPrice += parseInt(totalPriceArr[i]);
	            }	           
	            
	              
	             
	            
	            $("input:hidden[name=cartnojoin]").val(cartnojoin);
	            $("input:hidden[name=totalPricejoin]").val(totalPricejoin);
	            $("input:hidden[name=prodnamejoin]").val(prodnamejoin);
	            $("input:hidden[name=sumtotalPrice]").val(sumtotalPrice);
	            $("input:hidden[name=oqtyjoin]").val(oqtyjoin);
	            $("input:hidden[name=prodcodejoin]").val(prodcodejoin);
	            $("input:hidden[name=addPointjoin]").val(addPointjoin);
	            
	            
	            var frm = document.cartSelectFrm;
	            frm.method = "POST";
	            frm.action = "/SemiProject/prod/orderform.hb";
	            frm.submit(); 
	       }
	   }
	   
	   
	   
	   function AllOrder(){
		   
		   $("input:checkbox[name=fk_prod_code]").prop("checked",true);
		   
		   goOrder();
	   }
	   
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
      
      
      
      <li >
    	  ${(sessionScope.loginuser).name} 님 장바구니 목록 
      </li>         
   </ul>   
</div>

<div class="cart">
     <table border="1">
	<thead>
		<tr>
			<th><input type="checkbox" id="allCheck"> 상품코드</th>
              <th>이미지</th>
              <th>상품정보</th>
              <th>판매가</th>
              <th>수량</th>
              <th>적립금</th>
              <th>배송구분</th>
              <th>배송비</th>
              <th>합계</th>
              <th>삭제</th>
        </tr>
   </thead>
   
    
   <tbody>
   
   <c:if test="${empty cartList}">
      <tr>
           <td colspan="6" align="center">
             <span style="color: red; font-weight: bold;">
                장바구니에 담긴 상품이 없습니다.
             </span>
           </td>   
      </tr>
   </c:if>  
   
   <c:if test="${not empty cartList}">
	   <c:forEach var="cart" items="${cartList}" varStatus="status">
	   		<tr>
				<td>
					<input type="checkbox" name="fk_prod_code" class="chkboxpnum" id="pnum${status.index}" value="${cart.fk_prod_code}" /> &nbsp;<label for="pnum${status.index}">${cart.fk_prod_code}</label>
					<%-- 장바구니번호 --%>
                     <input class="cart_num" type="hidden" name="cart_num" value="${cart.cart_num}" />
				</td>
				
		        <td class="thumb">
		        	<a href="/SemiProject/prod/page.hb?category=${cart.prod.prod_category}&prodCode=${cart.fk_prod_code}"><img src="/SemiProject/images/Product/${cart.fk_prod_code}.png" width="100" height="100"></a>
		        </td>
		        
		        <td>      	      
					<a href="/SemiProject/prod/page.hb?category=${cart.prod.prod_category}&prodCode=${cart.fk_prod_code}"><strong class="prod_name">${cart.prod.prod_name}</strong></a>
					<input id="prod_name" class="prod_name" type="hidden" value="${cart.prod.prod_name}" />		
				</td>
		
		        <td class="price">
			        <div>
						<strong><fmt:formatNumber value="${cart.prod.prod_price}" pattern="###,###" /></strong>원
					</div>
		        </td>
		                                  
		        <td>	            
		            	<div id="example">  
	                        <input type="text" id="spinner" class ="spinner cart_stock" name="cart_stock" value="${cart.cart_stock}" style="width: 30px;"/>
	                        <button class="updateBtn" type="button" onclick="goOqtyEdit(this);">수정</button>  
	                    </div>
		            
		        </td>
		        
		        <%-- 적립금 --%>         
		        <td class="addPoint">
		        <fmt:parseNumber value="${cart.prod.totalPrice*0.01}" /> 원		       		     
		        <input id="addPoint" class="addPoint" type="hidden" value="${cart.prod.totalPrice*0.01}"/>		    
		        </td>
		        <td class="delivery">기본배송</td>
		            
		        <td>무료</td>
		          
		      	<td class="total">
					<strong id="sum"><fmt:formatNumber value="${cart.prod.totalPrice}" pattern="###,###" />원</strong>
					<%-- 총금액 --%>
					<input class="totalPrice" type="hidden" value="${cart.prod.totalPrice}" />
				</td>
				
		        <td class="button">
		           <span class="del" style="cursor: pointer;" onClick="goDel('${cart.cart_num}');">삭제</span>
		        </td>
			</tr>
		</c:forEach>
	</c:if>
	
	</tbody>
	
	
	<tfoot>
		<tr>
			<td colspan="10">
				<span style="float: left;">[기본배송]</span>
					<div class="right"> 
						<span>상품구매금액</span>
						<strong>
							<span><fmt:formatNumber value="${sumMap.SUMTOTALPRICE}" pattern="###,###" />원</span>
						</strong>
						<span> </span> + 배송비 (무료)
						<span> </span> = 합계 : 
						<strong>
							<span><fmt:formatNumber value="${sumMap.SUMTOTALPRICE}" pattern="###,###"/>원</span>
						</strong>
					</div> 
			</td>
	    </tr>
	</tfoot>
	
</table>   
</div>

<div id="btn">
   <span class="ordershopping" style="cursor: pointer;" onClick="goOrder();">선택상품주문</span>&nbsp;&nbsp;
   <span class="ordershopping" style="cursor: pointer;" onClick="AllOrder();">전체상품주문</span>
</div>

<form name="cartSelectFrm">
		<input type="hidden" name="cartSelect" />
		<input type="hidden" name="prodnamejoin" />
		<input type="hidden" name="oqtyjoin" />
		<input type="hidden" name="cartnojoin" />
		<input type="hidden" name="totalPricejoin" />
		<input type="hidden" name="sumtotalPrice" />
		<input type="hidden" name="addPointjoin" />
		<input type="hidden" name="prodcodejoin"/>
</form>

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