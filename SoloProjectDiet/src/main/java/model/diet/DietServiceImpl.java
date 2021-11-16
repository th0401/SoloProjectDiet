package model.diet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.userInfo.UserInfoVO;

@Service("dietService")
public class DietServiceImpl implements DietService{

	@Autowired
	private SpringDietDAO dietDAO;

	@Override
	public List<DietVO> selectAll(UserInfoVO vo) {

		return dietDAO.selectAll(vo);
	}

	@Override
	public DietVO selectOne(DietVO vo) {

		return dietDAO.selectOne(vo);
	}

	@Override
	public void insertDiet(DietVO vo) {
		
		dietDAO.insertDiet(vo);
	}

	@Override
	public void updateDiet(DietVO vo) {
		
		dietDAO.updateDiet(vo);
	}

	@Override
	public void deleteDiet(DietVO vo) {
		
		dietDAO.deleteDiet(vo);
	}

		
	
	
	
	
	
}
