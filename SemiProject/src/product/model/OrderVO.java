package product.model;

public class OrderVO {

	private int order_code; 		// 주문번호
	private String fk_userid;		// 아이디
	private String order_name;		// 받으시는분
	private String order_address;	// 주소
	private int order_ship;			// 배송상태
	private String order_memo;		// 배송메모
	private int order_refund;		// 반품/환불/취소 요청
	private String order_date;		// 주문일자
	private String order_mobile;	// 연락처
	private int order_price;		// 구매가격
	private int order_point;		// 적립금 사용
	
	// 기본생성자
	public OrderVO(){
		
	}

	// 오버로드 생성자
	public OrderVO(int order_code, String fk_userid, String order_name ,String order_address, int order_ship, String order_memo,
			int order_refund, String order_date, String order_mobile, int order_price,int order_point) {
		super();
		this.order_code = order_code;
		this.fk_userid = fk_userid;
		this.order_name = order_name;
		this.order_address = order_address;
		this.order_ship = order_ship;
		this.order_memo = order_memo;
		this.order_refund = order_refund;
		this.order_date = order_date;
		this.order_mobile = order_mobile;
		this.order_price = order_price;
		this.order_point = order_point;
	}

	
	public int getOrder_code() {
		return order_code;
	}

	public void setOrder_code(int order_code) {
		this.order_code = order_code;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	
	public int getOrder_point() {
		return order_point;
	}

	public void setOrder_point(int order_point) {
		this.order_point = order_point;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public int getOrder_ship() {
		return order_ship;
	}

	public void setOrder_ship(int order_ship) {
		this.order_ship = order_ship;
	}

	public String getOrder_memo() {
		return order_memo;
	}

	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}

	public int getOrder_refund() {
		return order_refund;
	}

	public void setOrder_refund(int order_refund) {
		this.order_refund = order_refund;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getOrder_mobile() {
		return order_mobile;
	}

	public void setOrder_mobile(String order_mobile) {
		this.order_mobile = order_mobile;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	
	
	
}
