package admin.review.model;

public class BoardVO {
	
	private String fk_userid;
	private String fk_prod_code;
	private int rev_no;
	private String rev_title;
	private String rev_content;
	private String rev_write_date;
	private int rev_count;
	private int rev_status;
	private int rev_seq;
	
	public BoardVO() {}

	public BoardVO(String fk_userid, String fk_prod_code, int rev_no, String rev_title,
			String rev_content, String rev_write_date, int rev_count, int rev_status, int rev_seq) {

		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.rev_no = rev_no;
		this.rev_title = rev_title;
		this.rev_content = rev_content;
		this.rev_write_date = rev_write_date;
		this.rev_count = rev_count;
		this.rev_status = rev_status;
		this.rev_seq = rev_seq;
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

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public String getRev_title() {
		return rev_title;
	}

	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public String getRev_write_date() {
		return rev_write_date;
	}

	public void setRev_write_date(String rev_write_date) {
		this.rev_write_date = rev_write_date;
	}

	public int getRev_count() {
		return rev_count;
	}

	public void setRev_count(int rev_count) {
		this.rev_count = rev_count;
	}
	
	public int getRev_status() {
		return rev_status;
	}

	public void setRev_status(int rev_status) {
		this.rev_status = rev_status;
	}

	public int getRev_seq() {
		return rev_seq;
	}

	public void setRev_seq(int rev_seq) {
		this.rev_seq = rev_seq;
	}
}
