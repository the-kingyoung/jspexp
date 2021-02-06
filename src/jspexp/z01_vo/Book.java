package jspexp.z01_vo;
/*

[jsp]
[하] 1. 자바로 Book객체를 만들고, 도서명 가격 저자를 화면에 출력하세요. 
*/
public class Book {
	
	private String bname;
	private int price;
	private String author;
	public Book(String bname, int price, String author) {
		super();
		this.bname = bname;
		this.price = price;
		this.author = author;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	

}
