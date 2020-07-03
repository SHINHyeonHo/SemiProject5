package product.model;

public class OrderInfoVO {

	private int orderinfo_code;	  // 주문상세 시퀀스
	private int fk_order_code;	  // 주문번호
	private String fk_prod_code;  // 상품코드
	private String fk_prod_name;  // 상품이름
	private int order_oqty;		  // 주문수량
	private int order_price;	  // 개별가격
	
	
	// 기본생성자
	public OrderInfoVO() {
		
	}

	// 오버로드 생성자
	public OrderInfoVO(int orderinfo_code, int fk_order_code, String fk_prod_code, String fk_prod_name, int order_oqty,
			int order_price) {
		super();
		this.orderinfo_code = orderinfo_code;
		this.fk_order_code = fk_order_code;
		this.fk_prod_code = fk_prod_code;
		this.fk_prod_name = fk_prod_name;
		this.order_oqty = order_oqty;
		this.order_price = order_price;
	}

	public int getOrderinfo_code() {
		return orderinfo_code;
	}

	public void setOrderinfo_code(int orderinfo_code) {
		this.orderinfo_code = orderinfo_code;
	}

	public int getFk_order_code() {
		return fk_order_code;
	}

	public void setFk_order_code(int fk_order_code) {
		this.fk_order_code = fk_order_code;
	}

	public String getFk_prod_code() {
		return fk_prod_code;
	}

	public void setFk_prod_code(String fk_prod_code) {
		this.fk_prod_code = fk_prod_code;
	}

	public String getFk_prod_name() {
		return fk_prod_name;
	}

	public void setFk_prod_name(String fk_prod_name) {
		this.fk_prod_name = fk_prod_name;
	}

	public int getOrder_oqty() {
		return order_oqty;
	}

	public void setOrder_oqty(int order_oqty) {
		this.order_oqty = order_oqty;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}


	
	
	
}
