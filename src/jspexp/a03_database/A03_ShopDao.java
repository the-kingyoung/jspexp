package jspexp.a03_database;
//jspexp.a03_database.A03_ShopDao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import jspexp.z01_vo.*;

public class A03_ShopDao {
      private Connection con;
      private Statement stmt;
      private PreparedStatement pstmt;
      private ResultSet rs;
      public void setCon() throws SQLException {
         try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         }
         String info = "jdbc:oracle:thin:@localhost:1521:xe";
         con = DriverManager.getConnection(info, "scott", "tiger");
         System.out.println("접속 성공 !!! ^^ ㅎㅎ");
      }
      
		// 조회 메서드
		public ArrayList<Product2> shopList(Product2 sch) {
			ArrayList<Product2> list = new ArrayList<Product2>();
			try {
				setCon();
				String sql = "SELECT * FROM product2\r\n" + "WHERE name LIKE '%'||'" + sch.getName() + "'||'%'\r\n"
						+ "AND price BETWEEN " + sch.getFr_price() + " AND " + sch.getTo_price() + "\r\n"
						+ "ORDER BY pno desc";
				System.out.println("조회 리스트");
				System.out.println(sql);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					list.add(new Product2(rs.getInt(1),rs.getString(2),
							rs.getInt(3),rs.getInt(4), rs.getDate(5),rs.getString(6),rs.getDate(7),rs.getString(8)
							));
				}
				System.out.println("총건수:"+list.size());
				rs.close();
				stmt.close();
				con.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("DB 에러 : " + e.getMessage());
			} catch (Exception e) {
				System.out.println("일반 에러 : " + e.getMessage());
			}
			return list;
		}

		// 등록 메서드
		public void insertProduct(Product2 ins) {
			try {
				setCon();
				con.setAutoCommit(false);
				String sql = "INSERT INTO product2 values(prod2_seq.nextval, '" + ins.getName() + "'," + ins.getPrice()
						+ "," + ins.getCnt() + ",sysdate,'" + ins.getCompany() + "',sysdate,'" + ins.getInmanager()
						+ "')";
				System.out.println("등록 처리");
				System.out.println(sql);
				stmt=con.createStatement();
				stmt.executeUpdate(sql);
				con.commit();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("입력 에러 : "+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}catch(Exception e) {
				System.out.println("일반 에러 : " + e.getMessage());
			}
		}
      
      // 단일데이터 메서드
		public Product2 getProd(int prono) {
			Product2 pro = null;
			try {
				setCon();
				String sql = "SELECT * FROM product2 WHERE pno=" + prono;
				System.out.println("상세조회");
				System.out.println(sql);
				stmt=con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					pro = new Product2(rs.getInt(1),rs.getString(2),
							rs.getInt(3),rs.getInt(4), rs.getDate(5),
							rs.getString(6),rs.getDate(7),rs.getString(8)
							);
					
				}
				rs.close();
				stmt.close();
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("상세 조회 에러 : "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반 예외 : "+e.getMessage());
			}
			return pro;
		}
      
   public static void main(String[] args) {
      A03_ShopDao dao = new A03_ShopDao();
      dao.shopList(new Product2("사과",1000,9999));

      dao.insertProduct(new Product2(0,"딸기",12000,50,null,"딸기마을",null,"딸기맨"));
      dao.getProd(10000);
   }
}