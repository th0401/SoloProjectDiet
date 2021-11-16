package model.body;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.userInfo.UserInfoVO;

@Service("bodyService")
public class BodyServiceImpl implements BodyService{

	@Autowired
	private SpringBodyDAO bodyDAO;

	@Override
	public List<BodyVO> selectAll(UserInfoVO vo) {
		
		return bodyDAO.selectAll(vo);
	}

	@Override
	public BodyVO selectOne(BodyVO vo) {
		
		return bodyDAO.selectOne(vo);
	}

	@Override
	public void insertBody(BodyVO vo) {
		bodyDAO.insertBody(vo);
		
	}

	@Override
	public void updateBody(BodyVO vo) {
		bodyDAO.updateBody(vo);
		
	}

	@Override
	public void deleteBody(BodyVO vo) {
		bodyDAO.deleteBody(vo);
		
	}
	
	
	
	
	
	
	
	
	
}
