package kr.hs.emirimmeal.model.vo;

public class StudentMealStateVO2 {
	private int no;
	private String name;
	private String applymeal;
	
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
	public String getApplymeal() {
		return applymeal;
	}
	public void setApplymeal(String applymeal) {
		this.applymeal = applymeal;
	}

	@Override
	public String toString() {
		return "StudentMealStateVO2 [no=" + no + ", name=" + name + ", applymeal=" + applymeal + "]";
	}
	

}
