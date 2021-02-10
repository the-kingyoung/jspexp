package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z01_vo.Member;

public class A02_Dao {
   
   private Connection con;
   private Statement stmt;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public void setCon() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      }
      String info = "jdbc:oracle:thin:@localhost:1521:xe";
      try {
         con = DriverManager.getConnection(info, "scott", "tiger");
         System.out.println("접속 성공");
      } catch (SQLException e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }
//==========================================================================================================================
   public ArrayList<Member> getMemberList(){
      ArrayList<Member> mlist = null;
      
      try {
         setCon();
         stmt = con.createStatement();
         String sql = "select * from member";
         rs = stmt.executeQuery(sql);
         
         while(rs.next()) {
            System.out.print(rs.getString("id")+"\t");
            System.out.print(rs.getString("civilnum")+"\t");
            System.out.print(rs.getString("auth")+"\t");
            System.out.print(rs.getInt("point")+"\t");
            System.out.print(rs.getString(1)+"\t");
            System.out.print(rs.getString(2)+"\t");
            System.out.print(rs.getString(3)+"\t");
            System.out.println(rs.getInt(4));
         }
         rs.close();
         stmt.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("DB 관련 예외: " + e.getMessage());
      } catch (Exception e) {
         System.out.println("기타 예외: " + e.getMessage());
      }
      
      return mlist;
   }
   
   
   public static void main(String[] args) {
      // TODO Auto-generated method stub
      A02_Dao dao = new A02_Dao();
      
      dao.getMemberList();
   }

}