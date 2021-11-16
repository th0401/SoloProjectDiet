package model.body;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.userInfo.UserInfoVO;



class BodyRowMapper implements RowMapper<BodyVO>{

	@Override
	public BodyVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		BodyVO data = new BodyVO();
		data.setBnum(rs.getInt("bnum"));
		data.setHeight(rs.getFloat("height"));
		data.setWeight(rs.getFloat("weight"));
		data.setBdate(rs.getDate("bdate"));
		data.setB_user(rs.getString("b_user"));
		return data;
	}
}
@Repository
public class SpringBodyDAO {

	private final String sql_SELECT_ALL = "SELECT * FROM BODY WHERE B_USER=? ORDER BY BNUM DESC";
	private static String sql_SELECT_ONE = "SELECT * FROM BODY WHERE BNUM=?";
	private final String sql_INSERT="INSERT INTO BODY (BNUM,HEIGHT,WEIGHT,BDATE,B_USER) VALUES((SELECT NVL(MAX(BNUM),0) + 1 FROM BODY),?,?,SYSDATE,?)";
	private final String sql_UPDATE="UPDATE BODY SET HEIGHT=?,WEIGHT=? WHERE BNUM=?";
	private final String sql_DELETE="DELETE BODY WHERE BNUM=?";
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<BodyVO> selectAll(UserInfoVO vo) {
		//System.out.println("jdbcTemplate으로 bodySelectAllDAO");
		Object[] args= {vo.getId()};
			return jdbcTemplate.query(sql_SELECT_ALL,args, new BodyRowMapper());
			
	}
	
	public BodyVO selectOne(BodyVO vo) {
		//System.out.println("jdbcTemplate으로 bodySelectOneDAO");
		
		Object[] args= {vo.getBnum()};
		
			return jdbcTemplate.queryForObject(sql_SELECT_ONE, args, new BodyRowMapper());
		
	}
	
	
	public void insertBody(BodyVO vo) {
		//System.out.println("jdbcTemplate로 insertBody");
		
		Object[] args= {vo.getHeight(),vo.getWeight(),vo.getB_user()};
		jdbcTemplate.update(sql_INSERT,args);
	}
	
	public void updateBody(BodyVO vo) {
		//System.out.println("jdbcTemplate로 updateBody");
		Object[] args= {vo.getHeight(),vo.getWeight(),vo.getBnum()};
		jdbcTemplate.update(sql_UPDATE,args);
		
	}
	
	public void deleteBody(BodyVO vo) {
		//System.out.println("jdbcTemplate로 deleteBody");
		jdbcTemplate.update(sql_DELETE,vo.getBnum());
	}
	
	
}
