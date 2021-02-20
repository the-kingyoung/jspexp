package jspexp.z01_vo;

public class groupProducts {
	
	private String product_name;
	private int product_id;
	private String product_category;
	private int product_price;
	private int product_stock;
	private int product_weight;
	private int product_capacity;
	private String product_img_src;
	private String packing_type;
	public groupProducts() {
		super();
		// TODO Auto-generated constructor stub
	}
	public groupProducts(String product_name, int product_id, String product_category, int product_price,
			int product_stock, int product_weight, int product_capacity, String product_img_src, String packing_type) {
		super();
		this.product_name = product_name;
		this.product_id = product_id;
		this.product_category = product_category;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_weight = product_weight;
		this.product_capacity = product_capacity;
		this.product_img_src = product_img_src;
		this.packing_type = packing_type;
	}
	public groupProducts(String product_name, String product_category, int product_price, String product_img_src) {
		super();
		this.product_name = product_name;
		this.product_category = product_category;
		this.product_price = product_price;
		this.product_img_src = product_img_src;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public int getProduct_weight() {
		return product_weight;
	}
	public void setProduct_weight(int product_weight) {
		this.product_weight = product_weight;
	}
	public int getProduct_capacity() {
		return product_capacity;
	}
	public void setProduct_capacity(int product_capacity) {
		this.product_capacity = product_capacity;
	}
	public String getProduct_img_src() {
		return product_img_src;
	}
	public void setProduct_img_src(String product_img_src) {
		this.product_img_src = product_img_src;
	}
	public String getPacking_type() {
		return packing_type;
	}
	public void setPacking_type(String packing_type) {
		this.packing_type = packing_type;
	}
}
