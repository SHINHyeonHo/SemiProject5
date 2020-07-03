package board.review.model;

public class CommentVO extends BoardVO {

	private String fk_cmt_userid;
	private String cmt_content;
	private String cmt_write_date;
	private int fk_rev_no;
	private int cmt_no;
	
	private int cmt_count;

	public int getCmt_count() {
		return cmt_count;
	}

	public void setCmt_count(int cmt_count) {
		this.cmt_count = cmt_count;
	}

	public CommentVO() {};
	
	public CommentVO(String fk_cmt_userid, String fk_prod_code, int rev_no, String rev_title, String rev_content, 
					 String rev_write_date, int rev_count, int rev_status, int rev_seq, int cmt_count) { 
		super(fk_cmt_userid, fk_prod_code, rev_no, rev_title, rev_content, rev_write_date, rev_count, rev_status, rev_seq);
		this.cmt_count = cmt_count;
	}
	
	public CommentVO(int cmt_no, String fk_cmt_userid, String cmt_content, String cmt_write_date, int fk_rev_no) {

		this.fk_cmt_userid = fk_cmt_userid;
		this.cmt_content = cmt_content;
		this.cmt_write_date = cmt_write_date;
		this.fk_rev_no = fk_rev_no;
		this.cmt_no = cmt_no;
	}

	public String getFk_cmt_userid() {
		return fk_cmt_userid;
	}

	public void setFk_cmt_userid(String fk_cmt_userid) {
		this.fk_cmt_userid = fk_cmt_userid;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public String getCmt_write_date() {
		return cmt_write_date;
	}

	public void setCmt_write_date(String cmt_write_date) {
		this.cmt_write_date = cmt_write_date;
	}

	public int getFk_rev_no() {
		return fk_rev_no;
	}

	public void setFk_rev_no(int fk_rev_no) {
		this.fk_rev_no = fk_rev_no;
	}

	public int getCmt_no() {
		return cmt_no;
	}

	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}
	
	
	
}
