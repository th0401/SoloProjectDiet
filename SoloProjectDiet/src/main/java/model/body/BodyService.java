package model.body;

import java.util.List;

import model.userInfo.UserInfoVO;

public interface BodyService {

	List<BodyVO> selectAll(UserInfoVO vo);
	BodyVO selectOne(BodyVO vo);
	void insertBody(BodyVO vo);
	void updateBody(BodyVO vo);
	void deleteBody(BodyVO vo);
	
}
