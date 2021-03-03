package jspexp.z01_vo;
//jspexp.z01_vo.Product2
//  fr_price  to_price
import java.util.Date;

public class Product2 {
	
	private int pno;
	private String name;
	private int price;
	private int fr_price;
	private int to_price;
	private int cnt;
	private Date credte;
	private String credteS;
	private String company;
	private Date incomedate;
	private String incomedateS;
	private String inmanager;
	public Product2() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Product2(int pno, String name) {
		super();
		this.pno = pno;
		this.name = name;
	}

	public Product2(int pno, String name, int price, int cnt, Date credte, String company, Date incomedate,
			String inmanager) {
		super();
		this.pno = pno;
		this.name = name;
		this.price = price;
		this.cnt = cnt;
		this.credte = credte;
		this.company = company;
		this.incomedate = incomedate;
		this.inmanager = inmanager;
	}
	
	public Product2(int pno, String name, int price, int cnt, String credteS, String company, String incomedateS,
			String inmanager) {
		super();
		this.pno = pno;
		this.name = name;
		this.price = price;
		this.cnt = cnt;
		this.credteS = credteS;
		this.company = company;
		this.incomedateS = incomedateS;
		this.inmanager = inmanager;
	}
	public Product2(String name, int fr_price, int to_price) {
		super();
		//name, fr_price, to_price
		this.name = name;
		this.fr_price = fr_price;
		this.to_price = to_price;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getFr_price() {
		return fr_price;
	}
	public void setFr_price(int fr_price) {
		this.fr_price = fr_price;
	}
	public int getTo_price() {
		return to_price;
	}
	public void setTo_price(int to_price) {
		this.to_price = to_price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getCredte() {
		return credte;
	}
	public void setCredte(Date credte) {
		this.credte = credte;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Date getIncomedate() {
		return incomedate;
	}
	public void setIncomedate(Date incomedate) {
		this.incomedate = incomedate;
	}
	public String getInmanager() {
		return inmanager;
	}
	public void setInmanager(String inmanager) {
		this.inmanager = inmanager;
	}
	public String getCredteS() {
		return credteS;
	}
	public void setCredteS(String credteS) {
		this.credteS = credteS;
	}
	public String getIncomedateS() {
		return incomedateS;
	}
	public void setIncomedateS(String incomedateS) {
		this.incomedateS = incomedateS;
	}
	
	
}
