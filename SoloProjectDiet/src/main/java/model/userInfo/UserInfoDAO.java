package model.userInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import model.common.JDBC;

@Repository("UserInfoDAO")
public class UserInfoDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String loginSQL="select * from Userinfo where id=? and pw=?";
	private final String insertSQL="insert into Userinfo (id,pw,name,gender) values(?,?,?,?)";
	private final String updateSQL="update Userinfo set pw=?,name=? ,gender=? where id=?";
	private final String deleteSQL="delete Userinfo where id=?";
	
	public boolean insertUser(UserInfoVO vo) {
		System.out.println("dao로 insertUserinfo");
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(insertSQL);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			JDBC.close(conn, pstmt);
		}
		return true;
	}
	public boolean updateUser(UserInfoVO vo) {
		System.out.println("dao로 updateUserinfo");
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(updateSQL);
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getId());
			pstmt.setString(4, vo.getGender());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			JDBC.close(conn, pstmt);
		}
		return true;
	}
	
	public boolean deleteUser(UserInfoVO vo) {
		System.out.println("dao로 deleteUserinfo");
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(deleteSQL);
			pstmt.setString(1, vo.getId());			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			JDBC.close(conn, pstmt);
		}
		return true;
	}
	
	
	
	public UserInfoVO login(UserInfoVO vo) {
		// 로그인에 성공한다면, Member123VO 객체가 리턴(반환)
		// 실패한다면, 리턴이 null
		UserInfoVO data=null;
		
		System.out.println("UserinfoDAO로 get");

		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(loginSQL);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new UserInfoVO();
				data.setId(rs.getString("id"));
				data.setName(rs.getString("name"));
				data.setPw(rs.getString("pw"));
				data.setGender(rs.getString("gender"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			JDBC.close(conn, pstmt, rs);
		}
		
		return data;
	}
}
