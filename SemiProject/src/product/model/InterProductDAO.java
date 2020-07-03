package product.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterProductDAO {

	// 카테고리별 정보 가져오기
    List<ProductVO> getProductList(String category, String prodCode, int page) throws SQLException;
	
 	// best 상품들 가져오기
	List<ProductVO> prodBestList(String category) throws SQLException;
    
    // 레코드 개수 알아오기
    int getProductCount(String category) throws SQLException;
	
    // 배경화면에서 정보 가져오기 
    List<ProductVO> getProductList(String prodCode, int page) throws SQLException; 
   
    // 사이드바 검색한 정보 가져오기
    List<ProductVO> getSearchProductList(String searchWord, int page, String select) throws SQLException;

    // 검색 결과 레코드 개수 알아오기
	int getSearchProductCount(String searchWord, String select) throws SQLException;
    
    // 로그인 되어진 회원의 장바구니 정보가져오기
 	List<CartVO> selectCartList(String userid) throws SQLException;

 	// 로그인한 사용자의 장바구니에 담긴 주문총액 합계 조회하기
 	HashMap<String, String> selectCartSumPricePoint(String userid) throws SQLException;

 	// === 장바구니 담기 === 
 	// 장바구니 테이블에 해당 제품이 존재하지 않는 경우는 shoppin_cart 테이블에 insert 를 해야하고,
 	// 장바구니 테이블에 해당 제품이 존재하는 경우에 또 그 제품을 추가해서 장바구니 담기를 한다라면  shoppin_cart 테이블에 update 를 해야 한다. 
 	int addCart(String userid, String prod_code, String cart_stock) throws SQLException;
    
 	// 장바구니 테이블에서 특정제품을 장바구니에서 비우기 
 	int delCart(String cart_num) throws SQLException;

 	// 장바구니 테이블에서 특정제품의 수량을 변경시키기
 	int updateCart(String cart_num, String cart_stock) throws SQLException;

 	// myInfo에서 주문내역 확인하기
 	List<OrderVO> selectMemberOrder(String userid) throws SQLException;

 	// 장바구니 번호를 통해 상품정보 가져오기
 	CartVO selectProductForNo(String cartno) throws SQLException;
 	
 	// 전표를 알아오는 메소드
 	int getJunpyo() throws SQLException;
 	
 	// 주문 테이블에 주문내역 insert
 	int insertOrder(HashMap<String, String> map,int junpyo) throws SQLException;

 	// 주문 상세 테이블에 insert
 	void insertOrderInfo(String orderProductsCodeArr, String orderOqty,int junpyo,String orderProducts,String ordertotalPrice) throws SQLException;

 	// 주문이 완료되면 장바구니에서 비워주기
 	void orderCartDel(String orderCartNoArr) throws SQLException;

 	// 사용된 적립금 마이너스 해주기
 	void minusPoint(String orderUserid, String orderUsePoint) throws SQLException;

 	// 구매한 상품에 대한 적립금 적립
 	void plusPoint(String orderUserid, String orderAddPoint) throws SQLException;

 	// 적립금 테이블에 insert
 	void insertPointTabel(int junpyo,String orderUserid, int point) throws SQLException;
 	
 	// 적립금 테이블에 insert(마이너스)
 	void insertMinusPointTable(int junpyo, String orderUserid, String orderUsePoint) throws SQLException;

 	// 배송준비중인 상품의 리스트 불러오기
 	List<OrderVO> selectOrderList(HashMap<String, String> paraMap) throws SQLException;

 	// 배송완료된 상품의 리스트 불러오기
 	List<OrderVO> selectOrderCompleteList(HashMap<String, String> paraMap2) throws SQLException;
 	
 	// 배송준비중인 상품의 갯수 가져오기
 	int countordership() throws SQLException;
 	
 	// 배송완료된 상품의 갯수 가져오기
 	int countorderCompleteship() throws SQLException;
 	
 	// 받아온 주문번호를 통해 배송처리하기
 	void goShipment(String ordercode) throws SQLException;

 	// 주문번호를 통해 주문정보 알아오기
 	OrderVO viewOrderList(String orderCode) throws SQLException;

 	// 주문번호를 통해 주문의 상세정보 알아오기
 	List<OrderInfoVO> viewOrderDetailList(String orderCode) throws SQLException;

 	// 페이징처리를 위한 전체회원에 대한 총페이지갯수 알아오기(select)
 	int getTotalPage(HashMap<String, String> paraMap) throws SQLException;

 	// 페이징처리를 위한 전체회원에 대한 총페이지갯수 알아오기2(select)
 	int getTotalPage2(HashMap<String, String> paraMap) throws SQLException;

 	// 주문번호를 통해 정산테이블에 insert할 주문의 상품정보 가져오기
    OrderVO getOrderInfo(String ordercode) throws SQLException;

    // 알아온 상품정보를 통해 정산테이블에 insert해주기
    void insertCaculate(int order_code, String fk_userid, int order_price) throws SQLException;
    
    // 주문한 수량 만큼 감소시키기
    void minusProductStock(String orderoqty, String orderProductsCode) throws SQLException;
}