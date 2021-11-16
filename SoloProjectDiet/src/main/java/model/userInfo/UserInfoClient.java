package model.userInfo;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class UserInfoClient {

	public static void main(String[] args) {
		AbstractApplicationContext factory=new GenericXmlApplicationContext("applicationContext.xml");

		UserInfoService ms=(UserInfoService)factory.getBean("userInfoService");

		UserInfoVO vo=new UserInfoVO();
		vo.setId("admin");
		vo.setPw("1234");
		UserInfoVO data=ms.login(vo);

		if(data!=null) {
			// 로그인 성공
			System.out.println("로그인 성공!");
		}
		else {
			// 로그인 실패
			System.out.println("로그인 실패!");
		}

		factory.close();
	}

}
