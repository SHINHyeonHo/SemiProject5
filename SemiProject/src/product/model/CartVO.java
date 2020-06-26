package product.model;

public class CartVO {

	private int cart_num;			// 장바구니번호
	private String fk_userid;		// 회원 아이디
	private String fk_prod_code;	// 상품 코드
	private int cart_stock;			// 주문수량
	
	private ProductVO prod;
	
	public CartVO() {}
	
	public CartVO(int cart_num, String fk_userid, String fk_prod_code, int cart_stock) {
		super();
		this.cart_num = cart_num;
		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.cart_stock = cart_stock;
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getFk_prod_code() {
		return fk_prod_code;
	}

	public void setFk_prod_code(String fk_prod_code) {
		this.fk_prod_code = fk_prod_code;
	}

	public int getCart_stock() {
		return cart_stock;
	}

	public void setCart_stock(int cart_stock) {
		this.cart_stock = cart_stock;
	}

	public ProductVO getProd() {
		return prod;
	}

	public void setProd(ProductVO prod) {
		this.prod = prod;
	}
	
	
	
	
}
	

