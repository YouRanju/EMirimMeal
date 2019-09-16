package kr.hs.emirimmeal.model.vo;

import java.sql.Date;

public class MealSettingVO {
	private int breakfast;
	private int lunch;
	private int dinner;
	private Date starttime;
	private Date endtime;
	private int applydate;
	
	public int getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(int breakfast) {
		this.breakfast = breakfast;
	}
	public int getLunch() {
		return lunch;
	}
	public void setLunch(int lunch) {
		this.lunch = lunch;
	}
	public int getDinner() {
		return dinner;
	}
	public void setDinner(int dinner) {
		this.dinner = dinner;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public int getApplydate() {
		return applydate;
	}
	public void setApplydate(int applydate) {
		this.applydate = applydate;
	}
	@Override
	public String toString() {
		return "MealSettingVO [breakfast=" + breakfast + ", lunch=" + lunch + ", dinner=" + dinner + ", starttime="
				+ starttime + ", endtime=" + endtime + ", applydate=" + applydate + "]";
	}
	
	
}
