package jspexp.z01_vo;

public class jobSalary {
	private String job;
	private int cnt;
	private int avgsal;
	public jobSalary() {
		super();
		// TODO Auto-generated constructor stub
	}
	public jobSalary(String job, int cnt, int avgsal) {
		super();
		this.job = job;
		this.cnt = cnt;
		this.avgsal = avgsal;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getAvgsal() {
		return avgsal;
	}
	public void setAvgsal(int avgsal) {
		this.avgsal = avgsal;
	}

}
