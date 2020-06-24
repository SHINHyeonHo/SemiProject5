package member.model;

public class MemberVO {

   private int idx;
   private String userid;
   private String passwd;
   private String name;
   private String email;
   private String postcode;
   private String address1;
   private String address2;
   private String mobile1;
   private String mobile2;
   private String mobile3;
   private String is_sms;
   private String is_email;
   private int point;
   private String is_member;
   private String join_date;
   private String last_passwd_date;
   private String last_login_date;

   public MemberVO() {}
   
   public MemberVO(int idx, String userid, String passwd, String name, String email, String postcode, String address1, String address2, String mobile1, String mobile2, String mobile3
         , String is_sms, String is_email, int point, String is_member, String join_date, String last_passwd_date, String last_login_date) {
      this.userid = userid;
      this.passwd = passwd;
      this.name = name;
      this.email = email;
      this.postcode = postcode;
      this.address1 = address1;
      this.address2 = address2;
      this.mobile1 = mobile1;
      this.mobile2 = mobile2;
      this.mobile3 = mobile3;
      this.is_sms = is_sms;
      this.is_email = is_email;
      this.point = point;
      this.is_member = is_member;
      this.join_date = join_date;
      this.last_passwd_date = last_passwd_date;
      this.last_login_date = last_login_date;
      
   }
   public int getIdx() {
	return idx;
}

public void setIdx(int idx) {
	this.idx = idx;
}

public String getUserid() {
      return userid;
   }

   public void setUserid(String userid) {
      this.userid = userid;
   }

   public String getPasswd() {
      return passwd;
   }

   public void setPasswd(String passwd) {
      this.passwd = passwd;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPostcode() {
      return postcode;
   }

   public void setPostcode(String postcode) {
      this.postcode = postcode;
   }

   public String getAddress1() {
      return address1;
   }

   public void setAddress1(String address1) {
      this.address1 = address1;
   }

   public String getAddress2() {
      return address2;
   }

   public void setAddress2(String address2) {
      this.address2 = address2;
   }

   public String getMobile1() {
      return mobile1;
   }

   public void setMobile1(String mobile1) {
      this.mobile1 = mobile1;
   }

   public String getMobile2() {
      return mobile2;
   }

   public void setMobile2(String mobile2) {
      this.mobile2 = mobile2;
   }

   public String getMobile3() {
      return mobile3;
   }

   public void setMobile3(String mobile3) {
      this.mobile3 = mobile3;
   }

   public String getIs_sms() {
      return is_sms;
   }

   public void setIs_sms(String is_sms) {
      this.is_sms = is_sms;
   }

   public String getIs_email() {
      return is_email;
   }

   public void setIs_email(String is_email) {
      this.is_email = is_email;
   }

   public int getPoint() {
      return point;
   }

   public void setPoint(int point) {
      this.point = point;
   }

   public String getIs_member() {
      return is_member;
   }

   public void setIs_member(String is_member) {
      this.is_member = is_member;
   }

   public String getJoin_date() {
      return join_date;
   }

   public void setJoin_date(String join_date) {
      this.join_date = join_date;
   }

   public String getLast_passwd_date() {
      return last_passwd_date;
   }

   public void setLast_passwd_date(String last_passwd_date) {
      this.last_passwd_date = last_passwd_date;
   }

   public String getLast_login_date() {
      return last_login_date;
   }

   public void setLast_login_date(String last_login_date) {
      this.last_login_date = last_login_date;
   }
///////////////////////////////////
   public String getAllHp() {
      return mobile1+"-"+mobile2+"-"+mobile3;
   }
   
   
   
   
   
}