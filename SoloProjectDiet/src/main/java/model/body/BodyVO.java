package model.body;

import java.sql.Date;

public class BodyVO {

	private int bnum;
	private float weight;
	private float height;
	private Date bdate;
	private String b_user;
	
	
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public float getHeight() {
		return height;
	}
	public void setHeight(float height) {
		this.height = height;
	}
	public String getB_user() {
		return b_user;
	}
	public void setB_user(String b_user) {
		this.b_user = b_user;
	}
	@Override
	public String toString() {
		return "BodyVO [bnum=" + bnum + ", weight=" + weight + ", height=" + height + ", bdate=" + bdate + ", b_user="
				+ b_user + "]";
	}
	
	
	
	
}
