package kr.hs.emirimmeal.model.vo;

public class StudentMealStateVO {
	private int no;
	private String name;
	private String issave;
	private String checkmeal;
	private int total;
	
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
	public String getIssave() {
		return issave;
	}
	public void setIssave(String issave) {
		this.issave = issave;
	}
	
	public String getCheckmeal() {
		return checkmeal;
	}
	public void setCheckmeal(String checkmeal) {
		this.checkmeal = checkmeal;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "StudentMealStateVO [no=" + no + ", name=" + name + ", issave=" + issave + ", checkmeal=" + checkmeal
				+ ", total=" + total + "]";
	}
	

}
