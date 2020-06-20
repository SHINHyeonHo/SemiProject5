package product.model;

public class CartVO {

	private int cart_num;
	private String fk_userid;
	private String fk_prod_code;
	private String fk_prod_name;
	private int cart_stock;
	private String cart_date;
	private int cart_price;
	
	public CartVO() { }
	
	public CartVO(int cart_num,String fk_userid,String fk_prod_code,String fk_prod_name,int cart_stock,String cart_date,int cart_price) {
		this.cart_num = cart_num;
		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.fk_prod_name = fk_prod_name;
		this.cart_stock = cart_stock;
		this.cart_date = cart_date;
		this.cart_price = cart_price;
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

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	
	public int getCart_stock() {
		return cart_stock;
	}

	public void setCart_stock(int cart_stock) {
		this.cart_stock = cart_stock;
	}

	public String getCart_date() {
		return cart_date;
	}

	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}

	public int getCart_price() {
		return cart_price;
	}

	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
}

