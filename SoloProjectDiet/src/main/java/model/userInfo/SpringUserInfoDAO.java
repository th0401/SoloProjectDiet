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
						// oracle , mysql ����
	private final String sql_LOGIN="SELECT * FROM userInfo WHERE ID=? AND PW=?";
	private final String sql_INSERT="INSERT INTO userInfo (ID,PW,NAME,GENDER,PATH) VALUES(?,?,?,?,?)";
	private final String sql_UPDATE="UPDATE userInfo SET PW=?,NAME=?,GENDER=? WHERE ID=?";
	private final String sql_DELETE="DELETE FROM userInfo WHERE ID=?";
	private final String sql_UPDATE_PROFILE="UPDATE userInfo SET PATH=? WHERE ID=?";
	private final String sql_CHECKID = "SELECT * FROM userInfo WHERE ID=?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public UserInfoVO login(UserInfoVO vo) {
		//System.out.println("jdbcTemplate���� loginDAO");
		Object[] args= {vo.getId(),vo.getPw()};

		try {
			return jdbcTemplate.queryForObject(sql_LOGIN,args,new UserInfoRowMapper());
		 }
		 catch(DataAccessException e){
			 
			 return null;
		 }		
		
	}
	
	public void insertUser(UserInfoVO vo) {
		//System.out.println("jdbcTemplate�� insertUserInfo");
		
		Object[] args= {vo.getId(),vo.getPw(),vo.getName(),vo.getGender(),vo.getPath()};
		jdbcTemplate.update(sql_INSERT,args);
	}
	
	public void updateUser(UserInfoVO vo) {
		//System.out.println("jdbcTemplate�� updateUserInfo");
		Object[] args= {vo.getPw(),vo.getName(),vo.getGender(),vo.getId()};
		jdbcTemplate.update(sql_UPDATE,args);
		
	}
	
	public void deleteUser(UserInfoVO vo) {
		//System.out.println("jdbcTemplate�� deleteUserInfo");
		jdbcTemplate.update(sql_DELETE,vo.getId());
	}
	
	public void updateProfile(UserInfoVO vo) {
		System.out.println("jdbcTemplate�� updateProfile");
		Object[] args= {vo.getPath(),vo.getId()};
		jdbcTemplate.update(sql_UPDATE_PROFILE,args);
	}
	
	public boolean checkID(String id) {
		//System.out.println("jdbcTemplate�� checkID");
		//System.out.println("����ȣ : "+id);
		boolean exist=false; // id�ߺ� Ȯ��
		
		Object[] args= {id};
		
		try {
			jdbcTemplate.queryForObject(sql_CHECKID,args,new UserInfoRowMapper());
			
			exist = true;   // ������ null�� �ƴϸ� id�� �����ϱ⿡ true
		 }
		 catch(DataAccessException e){	
			// �����Ͱ� ���� ������ �߻��� ��� ó���ϱ� ���� �۾� �̰� ���ϸ� �޼��� �۵��� �����Ǿ� ���� ȥ���� ��.
			// �޼��� �۵��� �����Ǵ� �ٰŷδ� �α��� �۵����� ���� ���� ���α׷��� ���������� ���ư��ٸ� �α��� �Ǿ���ϴµ�
			// ����� ���� ��밡���� ���̵� �� ��ϵ��� ���� id�� ��� nulló���� �ƴ� ������ �޾Ƶ��̴°����� ����.	 
			 
			 return exist;  
		 }		
		
		return exist; // ������ null�̸� false
	}

}


