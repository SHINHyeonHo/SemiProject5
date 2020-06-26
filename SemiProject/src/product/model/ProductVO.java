package product.model;

public class ProductVO {

    private String prod_code;
    private String prod_category;
    private String prod_name;
    private int prod_cost;
    private int prod_price;
    private int prod_stock;
    private String prod_color;
    private String prod_mtl;
    private String prod_size;
    private int prod_status;

    private int totalPrice;         // 판매당시의 제품판매가 * 주문량
    
	// 기본 생성자
    public ProductVO(){

    }

    // 오버로드 생성자
    public ProductVO(String prod_code, String prod_category, String prod_name, int prod_cost, int prod_price, int prod_stock, String prod_color, String prod_mtl, String prod_size, int prod_status) {
        this.prod_code = prod_code;
        this.prod_category = prod_category;
        this.prod_name = prod_name;
        this.prod_cost = prod_cost;
        this.prod_price = prod_price;
        this.prod_stock = prod_stock;
        this.prod_color = prod_color;
        this.prod_mtl = prod_mtl;
        this.prod_size = prod_size;
        this.prod_status = prod_status;
    }

    public String getProd_code() {
        return prod_code;
    }

    public void setProd_code(String prod_code) {
        this.prod_code = prod_code;
    }

    public String getProd_category() {
        return prod_category;
    }

    public void setProd_category(String prod_category) {
        this.prod_category = prod_category;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public int getProd_cost() {
        return prod_cost;
    }

    public void setProd_cost(int prod_cost) {
        this.prod_cost = prod_cost;
    }

    public int getProd_price() {
        return prod_price;
    }

    public void setProd_price(int prod_price) {
        this.prod_price = prod_price;
    }

    public int getProd_stock() {
        return prod_stock;
    }

    public void setProd_stock(int prod_stock) {
        this.prod_stock = prod_stock;
    }

    public String getProd_color() {
        return prod_color;
    }

    public void setProd_color(String prod_color) {
        this.prod_color = prod_color;
    }

    public String getProd_mtl() {
        return prod_mtl;
    }

    public void setProd_mtl(String prod_mtl) {
        this.prod_mtl = prod_mtl;
    }

    public String getProd_size() {
        return prod_size;
    }

    public void setProd_size(String prod_size) {
        this.prod_size = prod_size;
    }

    public int getProd_status() {
		return prod_status;
	}

	public void setProd_status(int prod_status) {
		this.prod_status = prod_status;
	}
	
	/////////////////////////////////////////////////
	// *** 제품의 총판매가(실제판매가 * 주문량) 구해오기 ***
	public void setTotalPriceTotalPoint(int cart_stock) {   
	// int oqty 이 주문량이다.
	
	totalPrice = prod_price * cart_stock; // 판매당시의 제품판매가 * 주문량
	}
	
	public int getTotalPrice() {
	return totalPrice;
	}

}
