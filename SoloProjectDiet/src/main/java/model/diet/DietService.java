package model.diet;

import java.util.List;

import model.userInfo.UserInfoVO;

public interface DietService {

	List<DietVO> selectAll(UserInfoVO vo);
	DietVO selectOne(DietVO vo);
	void insertDiet(DietVO vo);
	void updateDiet(DietVO vo);
	void deleteDiet(DietVO vo);
	
}
