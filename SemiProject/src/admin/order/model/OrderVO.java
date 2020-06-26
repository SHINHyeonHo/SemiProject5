package admin.order.model;

public class OrderVO {

	private int order_code;
	private String fk_userid;
	private String fk_prod_code;
	private String fk_prod_name;
	private String fk_name;
	private int order_num;
	private String order_address;
	private int order_ship;
	private String order_memo;
	private int order_refund;
	private String order_date;
	private String order_mobile;
	private int order_price;
	
	public OrderVO(){}
	
	public OrderVO(int order_code,String fk_userid, String fk_prod_code, String fk_prod_name, String fk_name, int order_num
			,String order_address, int order_ship, String order_memo, int order_refund, String order_date, String order_mobile, int order_price){
		this.order_code = order_code;
		this.fk_userid = fk_userid;
		this.fk_prod_code=fk_prod_code;
		this.fk_prod_name=fk_prod_name;
		this.fk_name=fk_name;
		this.order_num=order_num;
		this.order_address=order_address;
		this.order_ship=order_ship;
		this.order_memo=order_memo;
		this.order_refund=order_refund;
		this.order_date=order_date;
		this.order_mobile=order_mobile;
		this.order_price=order_price;
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

	public String getFk_name() {
		return fk_name;
	}

	public void setFk_name(String fk_name) {
		this.fk_name = fk_name;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
