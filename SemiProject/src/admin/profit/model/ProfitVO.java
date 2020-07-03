package admin.profit.model;

public class ProfitVO {

	
	private String fk_order_code;
	private String fk_name;
	private int fk_order_price;
	private int fk_cost_sum;
	private String fk_order_date;
	private String cal_date;
	private int commission;
	private int cal_price;
	private int is_complete;
	private int profit;
	
	// 기본 생성자
	public ProfitVO(){
		
	}
	
	
	// 오버로드 생성자
	public ProfitVO(String fk_order_code, String fk_name, int fk_order_price, int fk_cost_sum, String fk_order_date,
			String cal_date, int commission, int cal_price, int is_complete, int profit) {
		super();
		this.fk_order_code = fk_order_code;
		this.fk_name = fk_name;
		this.fk_order_price = fk_order_price;
		this.fk_cost_sum = fk_cost_sum;
		this.fk_order_date = fk_order_date;
		this.cal_date = cal_date;
		this.commission = commission;
		this.cal_price = cal_price;
		this.is_complete = is_complete;
		this.profit = profit;
	}


	public String getFk_order_code() {
		return fk_order_code;
	}
	public void setFk_order_code(String fk_order_code) {
		this.fk_order_code = fk_order_code;
	}
	public String getFk_name() {
		return fk_name;
	}
	public void setFk_name(String fk_name) {
		this.fk_name = fk_name;
	}
	public int getFk_order_price() {
		return fk_order_price;
	}
	public void setFk_order_price(int fk_order_price) {
		this.fk_order_price = fk_order_price;
	}
	public int getFk_cost_sum() {
		return fk_cost_sum;
	}
	public void setFk_cost_sum(int fk_cost_sum) {
		this.fk_cost_sum = fk_cost_sum;
	}
	public String getFk_order_date() {
		return fk_order_date;
	}
	public void setFk_order_date(String fk_order_date) {
		this.fk_order_date = fk_order_date;
	}
	public String getCal_date() {
		return cal_date;
	}
	public void setCal_date(String cal_date) {
		this.cal_date = cal_date;
	}
	public int getCommission() {
		return commission;
	}
	public void setCommission(int commission) {
		this.commission = commission;
	}
	public int getCal_price() {
		return cal_price;
	}
	public void setCal_price(int cal_price) {
		this.cal_price = cal_price;
	}
	public int getIs_complete() {
		return is_complete;
	}
	public void setIs_complete(int is_complete) {
		this.is_complete = is_complete;
	}
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}
	
	
}
