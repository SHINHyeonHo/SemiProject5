package member.model;

public class PointVO {
	private String orderDate;
	private int point;
	private int orderCode;
	private String comment;
	private String userid;
	
	
	public PointVO() {}
	
	public PointVO(String orderDate, int point, int orderCode, String comment, String userid) {
		super();
		this.orderDate = orderDate;
		this.point = point;
		this.orderCode = orderCode;
		this.comment = comment;
		this.userid = userid;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderode) {
		this.orderCode = orderode;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	

}
