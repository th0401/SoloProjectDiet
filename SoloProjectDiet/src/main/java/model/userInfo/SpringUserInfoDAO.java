package model.userInfo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.common.JDBC;





class UserInfoRowMapper implements RowMapper<UserInfoVO>{

	@Override
	public UserInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		UserInfoVO data = new UserInfoVO();
		data.setId(rs.getString("id"));
		data.setName(rs.getString("name"));
		data.setPw(rs.getString("pw"));
		data.setGender(rs.getString("gender"));
		data.setPath(rs.getString("path"));
	
		return data;
	}
}

@Repository
public class SpringUserInfoDAO {
						// oracle , mysql 공통
	private final String sql_LOGIN="SELECT * FROM userInfo WHERE ID=? AND PW=?";
	private final String sql_INSERT="INSERT INTO userInfo (ID,PW,NAME,GENDER,PATH) VALUES(?,?,?,?,?)";
	private final String sql_UPDATE="UPDATE userInfo SET PW=?,NAME=?,GENDER=? WHERE ID=?";
	private final String sql_DELETE="DELETE FROM userInfo WHERE ID=?";
	private final String sql_UPDATE_PROFILE="UPDATE userInfo SET PATH=? WHERE ID=?";
	private final String sql_CHECKID = "SELECT * FROM userInfo WHERE ID=?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public UserInfoVO login(UserInfoVO vo) {
		//System.out.println("jdbcTemplate으로 loginDAO");
		Object[] args= {vo.getId(),vo.getPw()};

		try {
			return jdbcTemplate.queryForObject(sql_LOGIN,args,new UserInfoRowMapper());
		 }
		 catch(DataAccessException e){
			 
			 return null;
		 }		
		
	}
	
	public void insertUser(UserInfoVO vo) {
		//System.out.println("jdbcTemplate로 insertUserInfo");
		
		Object[] args= {vo.getId(),vo.getPw(),vo.getName(),vo.getGender(),vo.getPath()};
		jdbcTemplate.update(sql_INSERT,args);
	}
	
	public void updateUser(UserInfoVO vo) {
		//System.out.println("jdbcTemplate로 updateUserInfo");
		Object[] args= {vo.getPw(),vo.getName(),vo.getGender(),vo.getId()};
		jdbcTemplate.update(sql_UPDATE,args);
		
	}
	
	public void deleteUser(UserInfoVO vo) {
		//System.out.println("jdbcTemplate로 deleteUserInfo");
		jdbcTemplate.update(sql_DELETE,vo.getId());
	}
	
	public void updateProfile(UserInfoVO vo) {
		System.out.println("jdbcTemplate로 updateProfile");
		Object[] args= {vo.getPath(),vo.getId()};
		jdbcTemplate.update(sql_UPDATE_PROFILE,args);
	}
	
	public boolean checkID(String id) {
		//System.out.println("jdbcTemplate로 checkID");
		//System.out.println("이태호 : "+id);
		boolean exist=false; // id중복 확인
		
		Object[] args= {id};
		
		try {
			jdbcTemplate.queryForObject(sql_CHECKID,args,new UserInfoRowMapper());
			
			exist = true;   // 정보가 null이 아니면 id가 존재하기에 true
		 }
		 catch(DataAccessException e){	
			// 데이터가 없어 오류가 발생할 경우 처리하기 위한 작업 이걸 안하면 메서드 작동이 중지되어 값에 혼란이 옴.
			// 메서드 작동이 중지되는 근거로는 로깅이 작동되질 않음 만약 프로그램이 정상적으로 돌아간다면 로깅이 되어야하는데
			// 도출된 값이 사용가능한 아이디 즉 등록되지 않은 id일 경우 null처리가 아닌 오류로 받아들이는것으로 보임.	 
			 
			 return exist;  
		 }		
		
		return exist; // 정보가 null이면 false
	}

}


