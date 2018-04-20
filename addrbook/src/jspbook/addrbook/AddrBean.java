package jspbook.addrbook;

import java.sql.*;
import java.util.*;

public class AddrBean { 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://dongmin2.oa.to:3306/practical"; 
	
	// DB¿¬°á ¸Þ¼­µå
	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url,"practical","practical");
		} catch (Exception e) {
			// System.out.print("connect error");
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// ¼öÁ¤µÈ ÁÖ¼Ò·Ï ³»¿ë °»½ÅÀ» À§ÇÑ ¸Þ¼­µå
	public boolean updateDB(AddrBook addrbook) {
		connect();
		
		String sql ="update addrbook set ab_name=?, ab_email=?, ab_birth=?, ab_tel=?, ab_comdept=?, ab_memo=?, ab_hakbun=?, ab_nickname=?,ab_hobby=? where ab_id=?";		
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,addrbook.getAb_name());
			pstmt.setString(2,addrbook.getAb_email());
			pstmt.setString(3,addrbook.getAb_birth());
			pstmt.setString(4,addrbook.getAb_tel());
			pstmt.setString(5,addrbook.getAb_comdept());
			pstmt.setString(6,addrbook.getAb_memo());
			
			// add
			pstmt.setString(7,addrbook.getAb_hakbun());
			pstmt.setString(8,addrbook.getAb_nickname());
			pstmt.setString(9,addrbook.getAb_hobby());
			
			pstmt.setInt(10,addrbook.getAb_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// Æ¯Á¤ ÁÖ¼Ò·Ï °Ô½Ã±Û »èÁ¦ ¸Þ¼­µå
	public boolean deleteDB(int gb_id) {
		connect();
		
		String sql ="delete from addrbook where ab_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gb_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// ½Å±Ô ÁÖ¼Ò·Ï ¸Þ½ÃÁö Ãß°¡ ¸Þ¼­µå
	public boolean insertDB(AddrBook addrbook) {
		connect();
		// sql ¹®ÀÚ¿­ , gb_id ´Â ÀÚµ¿ µî·Ï µÇ¹Ç·Î ÀÔ·ÂÇÏÁö ¾Ê´Â´Ù.
				
		String sql ="insert into addrbook(ab_name,ab_email,ab_birth,ab_tel,ab_comdept,ab_memo, ab_hakbun, ab_nickname, ab_hobby) values(?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,addrbook.getAb_name());
			pstmt.setString(2,addrbook.getAb_email());
			pstmt.setString(3, addrbook.getAb_birth());
			pstmt.setString(4,addrbook.getAb_tel());
			pstmt.setString(5,addrbook.getAb_comdept());
			pstmt.setString(6,addrbook.getAb_memo());
			
			// for hakbun
			pstmt.setString(7,addrbook.getAb_hakbun());
			// for nickname
			pstmt.setString(8,addrbook.getAb_nickname());
			// for hobby
			pstmt.setString(9,addrbook.getAb_hobby());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}

	// Æ¯Á¤ ÁÖ¼Ò·Ï °Ô½Ã±Û °¡Á®¿À´Â ¸Þ¼­µå
	public AddrBook getDB(int gb_id) {
		
		connect();
		
		String sql = "select * from addrbook where ab_id=?";
		AddrBook addrbook = new AddrBook();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			// µ¥ÀÌÅÍ°¡ ÇÏ³ª¸¸ ÀÖÀ¸¹Ç·Î rs.next()¸¦ ÇÑ¹ø¸¸ ½ÇÇà ÇÑ´Ù.
			rs.next();
			addrbook.setAb_id(rs.getInt("ab_id"));
			addrbook.setAb_name(rs.getString("ab_name"));
			addrbook.setAb_email(rs.getString("ab_email"));
			addrbook.setAb_birth(rs.getString("ab_birth"));
			addrbook.setAb_tel(rs.getString("ab_tel"));
			addrbook.setAb_comdept(rs.getString("ab_comdept"));
			addrbook.setAb_memo(rs.getString("ab_memo"));
			
			// for hakbun
			addrbook.setAb_hakbun(rs.getString("ab_hakbun"));
			// for nickname
			addrbook.setAb_nickname(rs.getString("ab_nickname"));
			//for hobby
			addrbook.setAb_hobby(rs.getString("ab_hobby"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return addrbook;
	}
	
	// ÀüÃ¼ ÁÖ¼Ò·Ï ¸ñ·ÏÀ» °¡Á®¿À´Â ¸Þ¼­µå
	public ArrayList<AddrBook> getDBList() {
		connect();
		ArrayList<AddrBook> datas = new ArrayList<AddrBook>();
		
		String sql = "select * from addrbook order by ab_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrBook addrbook = new AddrBook();
				
				addrbook.setAb_id(rs.getInt("ab_id"));
				addrbook.setAb_name(rs.getString("ab_name"));
				addrbook.setAb_email(rs.getString("ab_email"));
				addrbook.setAb_comdept(rs.getString("ab_comdept"));
				addrbook.setAb_birth(rs.getString("ab_birth"));
				addrbook.setAb_tel(rs.getString("ab_tel"));
				addrbook.setAb_memo(rs.getString("ab_memo"));
				
				// for hakbun
				addrbook.setAb_hakbun(rs.getString("ab_hakbun"));
				// for nickname
				addrbook.setAb_nickname(rs.getString("ab_nickname"));
				//for hobby
				addrbook.setAb_hobby(rs.getString("ab_hobby"));
				datas.add(addrbook);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
}
