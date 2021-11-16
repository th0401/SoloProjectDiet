package model.diet;

import java.sql.Date;

public class DietVO {
	
	private int dnum;
	private String breakfast;
	private String lunch;
	private String diner;
	private String another;
	private int breakfastCalorie;
	private int lunchCalorie;
	private int dinerCalorie;
	private int anotherCalorie;
	private int dayCalorie;
	private Date ddate;
	private String d_user;
	
	
	
	
	
	@Override
	public String toString() {
		return "DietVO [dnum=" + dnum + ", breakfast=" + breakfast + ", lunch=" + lunch + ", diner=" + diner
				+ ", another=" + another + ", breakfastCalorie=" + breakfastCalorie + ", lunchCalorie=" + lunchCalorie
				+ ", dinerCalorie=" + dinerCalorie + ", anotherCalorie=" + anotherCalorie + ", dayCalorie=" + dayCalorie
				+ ", ddate=" + ddate + ", d_user=" + d_user + "]";
	}
	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getLunch() {
		return lunch;
	}
	public void setLunch(String lunch) {
		this.lunch = lunch;
	}
	public String getDiner() {
		return diner;
	}
	public void setDiner(String diner) {
		this.diner = diner;
	}
	public String getAnother() {
		return another;
	}
	public void setAnother(String another) {
		this.another = another;
	}
	public int getBreakfastCalorie() {
		return breakfastCalorie;
	}
	public void setBreakfastCalorie(int breakfastCalorie) {
		this.breakfastCalorie = breakfastCalorie;
	}
	public int getLunchCalorie() {
		return lunchCalorie;
	}
	public void setLunchCalorie(int lunchCalorie) {
		this.lunchCalorie = lunchCalorie;
	}
	public int getDinerCalorie() {
		return dinerCalorie;
	}
	public void setDinerCalorie(int dinerCalorie) {
		this.dinerCalorie = dinerCalorie;
	}
	public int getAnotherCalorie() {
		return anotherCalorie;
	}
	public void setAnotherCalorie(int anotherCalorie) {
		this.anotherCalorie = anotherCalorie;
	}
	public int getDayCalorie() {
		return dayCalorie;
	}
	public void setDayCalorie(int dayColorie) {
		this.dayCalorie = dayColorie;
	}
	
	public String getD_user() {
		return d_user;
	}
	public void setD_user(String d_user) {
		this.d_user = d_user;
	}
	
	
	
	
	
	
}
