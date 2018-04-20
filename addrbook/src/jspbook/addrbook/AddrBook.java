package jspbook.addrbook;

public class AddrBook {
	// ¸â¹öº¯¼ö ¼±¾ð
	private int ab_id;
	private String ab_name;
	private String ab_email; 
	private String ab_tel;
	private String ab_birth;
	private String ab_comdept;
	private String ab_memo;
	
	// add
	private String ab_hakbun;
	private String ab_nickname;
	private String ab_hobby;
	
	public int getAb_id() {
		return ab_id;
	}
	public void setAb_id(int ab_id) {
		this.ab_id = ab_id;
	}
	public String getAb_name() {
		return ab_name;
	}
	public void setAb_name(String ab_name) {
		this.ab_name = ab_name;
	}
	public String getAb_email() {
		return ab_email;
	}
	public void setAb_email(String ab_email) {
		this.ab_email = ab_email;
	}
	public String getAb_tel() {
		return ab_tel;
	}
	public void setAb_tel(String ab_tel) {
		this.ab_tel = ab_tel;
	}
	public String getAb_birth() {
		return ab_birth;
	}
	public void setAb_birth(String ab_birth) {
		this.ab_birth = ab_birth;
	}
	public String getAb_comdept() {
		return ab_comdept;
	}
	public void setAb_comdept(String ab_comdept) {
		this.ab_comdept = ab_comdept;
	}
	public String getAb_memo() {
		return ab_memo;
	}
	public void setAb_memo(String ab_memo) {
		this.ab_memo = ab_memo;
	}
	// for hakbun
	public void setAb_hakbun(String s) {
		this.ab_hakbun = s;
	}
	
	public String getAb_hakbun() {
		return ab_hakbun;
	}

	// for nickname
	public String getAb_nickname() {
		return ab_nickname;
	}
	public void setAb_nickname(String s) {
		this.ab_nickname = s;
	}
	
	// for hobby
	public String getAb_hobby() {
		return ab_hobby;
	}
	public void setAb_hobby(String s) {
		this.ab_hobby = s;
	}
	
	
}
