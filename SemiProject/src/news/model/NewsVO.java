package news.model;

public class NewsVO {

	 private String news_no;
	 private String news_title;
	 private String news_writer;
	 private String news_content;
	 private String regdate;
	 private int hit;
	 private String files;
	 private String is_post;
	 
	 
	public NewsVO() {}
	 
	
	public NewsVO(String news_no, String news_title, String news_writer, String news_content, String regdate, int hit,
			String files, String is_post) {
		this.news_no = news_no;
		this.news_title = news_title;
		this.news_writer = news_writer;
		this.news_content = news_content;
		this.regdate = regdate;
		this.hit = hit;
		this.files = files;
		this.is_post=is_post;
	}
	
	public NewsVO(String news_no, String news_title, String news_writer, String regdate, int hit, String is_post) {
		this.news_no = news_no;
		this.news_title = news_title;
		this.news_writer = news_writer;
		this.regdate = regdate;
		this.hit = hit;
		this.is_post=is_post;
	}
	
	public NewsVO(String news_no, String news_title, String news_writer, String news_content, String regdate, int hit,
			String files) {
		this.news_no = news_no;
		this.news_title = news_title;
		this.news_writer = news_writer;
		this.news_content = news_content;
		this.regdate = regdate;
		this.hit = hit;
		this.files = files;
		
	}
	
	
	public String getNews_no() {
		return news_no;
	}

	public void setNews_no(String news_no) {
		this.news_no = news_no;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public String getNews_writer() {
		return news_writer;
	}

	public void setNews_writer(String news_writer) {
		this.news_writer = news_writer;
	}

	public String getNews_content() {
		return news_content;
	}

	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}


	public String getIs_post() {
		return is_post;
	}


	public void setIs_post(String is_post) {
		this.is_post = is_post;
	}
	
	
	 
	 
	
	
	
	
	
	
	
	
	
}
