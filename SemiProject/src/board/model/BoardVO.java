package board.model;

public class BoardVO {
	
	private String qna_userid;
	private String qna_prod_code;
	private String qna_category;
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_passwd;
	private String qna_write_date;
	private int qna_count;
	private String qna_answer;
	private int qna_is_done;
	
	public BoardVO() {}

	public BoardVO(String qna_userid, String qna_prod_code, String qna_category, int qna_no, String qna_title,
			String qna_content, String qna_passwd, String qna_write_date, int qna_count, String qna_answer,
			int qna_is_done) {

		this.qna_userid = qna_userid;
		this.qna_prod_code = qna_prod_code;
		this.qna_category = qna_category;
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_passwd = qna_passwd;
		this.qna_write_date = qna_write_date;
		this.qna_count = qna_count;
		this.qna_answer = qna_answer;
		this.qna_is_done = qna_is_done;
	}

	public String getQna_userid() {
		return qna_userid;
	}

	public void setQna_userid(String qna_userid) {
		this.qna_userid = qna_userid;
	}

	public String getQna_prod_code() {
		return qna_prod_code;
	}

	public void setQna_prod_code(String qna_prod_code) {
		this.qna_prod_code = qna_prod_code;
	}

	public String getQna_category() {
		return qna_category;
	}

	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_passwd() {
		return qna_passwd;
	}

	public void setQna_passwd(String qna_passwd) {
		this.qna_passwd = qna_passwd;
	}

	public String getQna_write_date() {
		return qna_write_date;
	}

	public void setQna_write_date(String qna_write_date) {
		this.qna_write_date = qna_write_date;
	}

	public int getQna_count() {
		return qna_count;
	}

	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public int getQna_is_done() {
		return qna_is_done;
	}

	public void setQna_is_done(int qna_is_done) {
		this.qna_is_done = qna_is_done;
	}
	

}
