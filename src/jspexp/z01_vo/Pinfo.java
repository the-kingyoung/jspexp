package jspexp.z01_vo;

import java.util.Date;

public class Pinfo {
	private int pnum;
	private String pname;
	private int price;
	private int pstock;
	private Date pnewreg;
	private String pcompany;
	private Date prereg;
	private String pdirector;
	public Pinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pinfo(int pnum, String pname, int price, int pstock, Date pnewreg, String pcompany, Date prereg,
			String pdirector) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.price = price;
		this.pstock = pstock;
		this.pnewreg = pnewreg;
		this.pcompany = pcompany;
		this.prereg = prereg;
		this.pdirector = pdirector;
	}
	public Pinfo(String pname, int price) {
		super();
		this.pname = pname;
		this.price = price;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public Date getPnewreg() {
		return pnewreg;
	}
	public void setPnewreg(Date pnewreg) {
		this.pnewreg = pnewreg;
	}
	public String getPcompany() {
		return pcompany;
	}
	public void setPcompany(String pcompany) {
		this.pcompany = pcompany;
	}
	public Date getPrereg() {
		return prereg;
	}
	public void setPrereg(Date prereg) {
		this.prereg = prereg;
	}
	public String getPdirector() {
		return pdirector;
	}
	public void setPdirector(String pdirector) {
		this.pdirector = pdirector;
	}
	
	

}
