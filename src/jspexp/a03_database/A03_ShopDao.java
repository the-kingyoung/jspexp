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
      
		// 조회 메서드============================================================================================================================
		public ArrayList<Product2> shopList(Product2 sch) {
			//null에 대한 default처리..
			if(sch.getName()==null) sch.setName("");
			if(sch.getTo_price()==0) sch.setTo_price(9999999);
			
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

		// 등록 메서드============================================================================================================================
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
      
      // 단일데이터 메서드============================================================================================================================
		public Product2 getProd(int pno) {
			Product2 pro = null;
			try {
				setCon();
				String sql = "SELECT * FROM product2 WHERE pno=" + pno;
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
// 수정 메서드============================================================================================================================
		public void updateProduct(Product2 upt) {
			try {
				setCon();
				con.setAutoCommit(false);
				String sql = "UPDATE PRODUCT2 \r\n"
						+ "SET	name=?,\r\n"
						+ "	price=?,\r\n"
						+ "	cnt=?,\r\n"
						+ "	credte=to_date(?,'YYYY-MM-DD'),\r\n"
						+ "	company=?,\r\n"
						+ "	incomedate=to_date(?,'YYYY-MM-DD'),\r\n"
						+ "	inmanager = ?\r\n"
						+ "WHERE pno=?";
				
				System.out.println("등록 처리");
				System.out.println(sql);
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,upt.getName());
				pstmt.setInt(2,upt.getPrice());
				pstmt.setInt(3,upt.getCnt());
				pstmt.setString(4,upt.getCredteS());
				pstmt.setString(5,upt.getCompany());
				pstmt.setString(6,upt.getIncomedateS());
				pstmt.setString(7,upt.getInmanager());
				pstmt.setInt(8,upt.getPno());

				pstmt.executeUpdate();
			
				
				con.commit();
				
				pstmt.close();
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
// 수정 메서드============================================================================================================================
		public void deleteProduct(int pno) {
			try {
				setCon();
				con.setAutoCommit(false);
				String sql = "DELETE FROM product2 WHERE pno=?";
				
				System.out.println("### 물품 삭제 처리 ###");
				System.out.println(sql);
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pno);
		
				pstmt.executeUpdate();
			
				
				con.commit();
				
				pstmt.close();
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
		
		//public ArrayList<Product2> shopList(Product2 sch) {
		   public ArrayList<Product2> proList(String name, String company){
		      ArrayList<Product2> plist = new ArrayList<Product2>();
		      // 1. 공통메서드 호출
		      try {
		         setCon();
		      // 2. Statement 객체 생성 (연결객체 - Connection)
		         String sql = "SELECT *\r\n"
		         		+ "FROM PRODUCT2\r\n"
		         		+ "WHERE name like'%'||'"+name+"'||'%'\r\n"
		         		+ "AND company like '%'||'"+company+"'||'%'\r\n"
		         		+ "ORDER BY pno desc";
		         stmt = con.createStatement();
		      // 3. ResultSet 객체 생성 (대화객체 - Statement)
		         rs = stmt.executeQuery(sql);
		         while(rs.next()) {
		        	 System.out.print(rs.getInt("pno")+"\t");
		        	 System.out.print(rs.getString("name")+"\t");
		        	 System.out.print(rs.getInt("price")+"\t");
		        	 System.out.print(rs.getInt("cnt")+"\t");
		        	 System.out.print(rs.getDate("credte")+"\t");
		        	 System.out.print(rs.getString("company")+"\t");
		        	 System.out.print(rs.getDate("incomedate")+"\t");
		        	 System.out.println(rs.getString("inmanager"));

		        	
		        	 //1. 객체 생성과 할당.
		        	 Product2 p = new Product2(rs.getInt(1),rs.getString(2),rs.getInt(3),
		        			 rs.getInt(4),rs.getDate(5),rs.getString(6),rs.getDate(7),
		        			 rs.getString(8));
		        	 //2. ArrayList에 할당.
		        	 plist.add(p);
		        	 
		         }
		         rs.close();
		         stmt.close();
		         con.close();
		      // 5. 예외 처리
		      } catch (SQLException e1) {
		         // TODO Auto-generated catch block
		         e1.printStackTrace();
		         System.out.println(e1.getMessage());
		      }catch(Exception e) {
		    	  System.out.println(e.getMessage());
		      }
		
		      String info = "jdbc:oracle:thin:@localhost:1521:xe";
		      try {
		         con = DriverManager.getConnection(info, "scott", "tiger");
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      System.out.println("접속 성공");
		      
		      return plist;
		   }

// 단일데이터 메서드============================================================================================================================
		public int getMaxPno() {
			int pno=0;
			try {
				setCon();
				String sql = "SELECT max(pno) FROM product2";
				System.out.println("최근 pno가져오기.");
				System.out.println("상세조회");
				System.out.println(sql);
				stmt=con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					pno = rs.getInt(1);					
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
			return pno;
		}

// 메인============================================================================================================================
   public static void main(String[] args) {
      A03_ShopDao dao = new A03_ShopDao();
      ArrayList<Product2> k = new ArrayList<Product2>(dao.proList("",""));
      System.out.println(k);
   }
}