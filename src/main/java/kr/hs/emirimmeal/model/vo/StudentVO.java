package kr.hs.emirimmeal.model.vo;

public class StudentVO {
	private int no;
	private String name;
	private String passcode;
	private String isdorm;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	public String getIsdorm() {
		return isdorm;
	}
	public void setIsdorm(String isdorm) {
		this.isdorm = isdorm;
	}
	
	@Override
	public String toString() {
		return "StudentVO [no=" + no + ", name=" + name + ", passcode=" + passcode + ", isdorm=" + isdorm + "]";
	}
}
