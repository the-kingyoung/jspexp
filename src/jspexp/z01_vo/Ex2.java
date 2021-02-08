package jspexp.z01_vo;

public class Ex2 {
	private String ename;
	private String year;
	private String month;
	private String weekyear;
	private String day;
	public Ex2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ex2(String ename, String year, String month, String weekyear, String day) {
		super();
		this.ename = ename;
		this.year = year;
		this.month = month;
		this.weekyear = weekyear;
		this.day = day;
	}
	public Ex2(String weekyear) {
		super();
		this.weekyear = weekyear;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getWeekyear() {
		return weekyear;
	}
	public void setWeekyear(String weekyear) {
		this.weekyear = weekyear;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	

}
