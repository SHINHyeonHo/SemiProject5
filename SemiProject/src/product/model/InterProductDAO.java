package product.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterProductDAO {

	// 카테고리별 정보 가져오기
    List<ProductVO> getProductList(String category, String prodCode, int page) throws SQLException;
	
    // 레코드 개수 알아오기
    int getProductCount(String category, String prodCode) throws SQLException;
    
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
 	
}
