package model.userInfo;

public interface UserInfoService {
	UserInfoVO login(UserInfoVO vo);
	void insertUser(UserInfoVO vo);
	void updateUser(UserInfoVO vo);
	void deleteUser(UserInfoVO vo);
	void updateProfile(UserInfoVO vo);
}
