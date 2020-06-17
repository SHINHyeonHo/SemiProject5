<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div id="contain">
      <div class="title">
         <h2>POINT</h2>
         <p style="font-size:11px;">고객님의 사용가능 적립금 금액 입니다.</p>
      </div>
      <div>
         <div class="myshop">
            <ul>
               <li>
                  <strong class="title">총 적립금</strong>
                  <span class="data">
                     <span id="total_mileage">0원</span>&nbsp;
                  </span>
               </li>
               <li class="">
                  <strong class="title">사용가능 적립금</strong>
                  <span class="data">
                     <span id="avail_mileage">0원</span>&nbsp;</span>
               </li>
               <li class="">
                  <strong class="title">사용된 적립금</strong>
                     <span class="data">
                     <span id="used_mileage">0원</span>&nbsp;
                  </span>
               </li> 
            </ul>
         </div>
      </div>
      <div class="myshop-list">
         <table border="1">
            <caption>적립금 내역</caption>
                        <colgroup>
            <col style="width:15%">
            <col style="width:15%">
            <col style="width:25%">
            <col style="width:auto">
            </colgroup>
            <thead><tr>
            <th scope="col">주문날짜</th>
                                <th scope="col">적립금</th>
                                <th scope="col">관련 주문</th>
                                <th scope="col">적립내용</th>
                            </tr></thead>
            <tbody class="">
            <tr class="record">
            <td>yyyy-mm-dd</td>
                                <td class="right">0원</td>
                                <td><a href=""></a></td>
                                <td class="left">적립금</td>
                            </tr>
            </tbody>
            <tfoot class="displaynone"><tr>
            <td colspan="4" class="noData">적립금 내역이 없습니다.</td>
                            </tr></tfoot>
         </table>
      </div>
   </div>
</body>
</html>