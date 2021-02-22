package jspexp.z01_vo;

public class Member {
	private String id;
	private String pass;
	private int point;
	private String name;
	private String auth;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Member(String id, int point) {
		super();
		this.id = id;
		this.point = point;
	}


	public Member(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}

	public Member(String id, String pass, String name, String auth) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
	}

	public Member(String id, String pass, int point, String name, String auth) {
		super();
		this.id = id;
		this.pass = pass;
		this.point = point;
		this.name = name;
		this.auth = auth;
	}
	public Member(String id) {
		super();
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}

	
}