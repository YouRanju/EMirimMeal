package kr.hs.emirimmeal.model.vo;

public class AdminVO {
	private String adminid;
	private String adminpw;
	private String adminname;
	private String admintel;
	
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpw() {
		return adminpw;
	}
	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdmintel() {
		return admintel;
	}
	public void setAdmintel(String admintel) {
		this.admintel = admintel;
	}
	
	@Override
	public String toString() {
		return "AdminVO [adminid=" + adminid + ", adminpw=" + adminpw + ", adminname=" + adminname + ", admintel="
				+ admintel + "]";
	}
}