package model.userInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired
	private SpringUserInfoDAO userInfoDAO;
	
	@Override
	public UserInfoVO login(UserInfoVO vo) {
		return userInfoDAO.login(vo);
	}

	@Override
	public void insertUser(UserInfoVO vo) {
		userInfoDAO.insertUser(vo);
		
	}

	@Override
	public void updateUser(UserInfoVO vo) {
		userInfoDAO.updateUser(vo);
		
	}

	@Override
	public void deleteUser(UserInfoVO vo) {
		userInfoDAO.deleteUser(vo);
		
	}

	@Override
	public void updateProfile(UserInfoVO vo) {
		userInfoDAO.updateProfile(vo);
		
	}
}
