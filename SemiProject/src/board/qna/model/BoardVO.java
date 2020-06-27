package board.qna.model;

public class BoardVO {
	
	private String fk_userid;
	private String fk_prod_code;
	private String qna_category;
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_passwd;
	private String qna_write_date;
	private int qna_count;
	private String qna_answer;
	private int qna_is_done;
	private int qna_status;
	private int qna_seq;

	public BoardVO() {}

	public BoardVO(String fk_userid, String fk_prod_code, String qna_category, int qna_no, String qna_title,
			String qna_content, String qna_passwd, String qna_write_date, int qna_count, String qna_answer,
			int qna_is_done, int qna_status, int qna_seq) {
		
		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.qna_category = qna_category;
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_passwd = qna_passwd;
		this.qna_write_date = qna_write_date;
		this.qna_count = qna_count;
		this.qna_answer = qna_answer;
		this.qna_is_done = qna_is_done;
		this.qna_status = qna_status;
		this.qna_seq = qna_seq;
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
	
	public int getQna_status() {
		return qna_status;
	}

	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}

	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	
}
