package board.qna.model;

public class BoardVO {
	
	private String fk_userid;
	private String fk_prod_code;
	private String qna_category;
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_write_date;
	private int qna_count;
	private String qna_answer;
	private int qna_is_done;
	private int qna_status;
	private int qna_seq;
	private int qna_secret;
	
	private int re_ref;
	private int re_seq;
	private int re_lev;

	public BoardVO() {}

	public BoardVO(String fk_userid, String fk_prod_code, String qna_category, int qna_no, String qna_title,
			String qna_content, String qna_write_date, int qna_count, String qna_answer,
			int qna_is_done, int qna_status, int qna_seq, int qna_secret, int re_ref, int re_seq, int re_lev) {
		
		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.qna_category = qna_category;
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_write_date = qna_write_date;
		this.qna_count = qna_count;
		this.qna_answer = qna_answer;
		this.qna_is_done = qna_is_done;
		this.qna_status = qna_status;
		this.qna_seq = qna_seq;
		this.qna_secret = qna_secret;
		
		this.re_ref = re_ref;
		this.re_seq = re_seq;
		this.re_lev = re_lev;		
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

	public int getQna_secret() {
		return qna_secret;
	}

	public void setQna_secret(int qna_secret) {
		this.qna_secret = qna_secret;
	}

	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	public int getRe_ref() {
		return re_ref;
	}

	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	
	
	
}
