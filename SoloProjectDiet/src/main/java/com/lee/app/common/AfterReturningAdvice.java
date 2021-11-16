package com.lee.app.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

import model.userInfo.UserInfoVO;

@Service
@Aspect
public class AfterReturningAdvice {
	
	@AfterReturning(pointcut="PointcutCommon.cPointcut()",returning="obj")
	public void printLog(JoinPoint jp,Object obj) {
		String name=jp.getSignature().getName();
		System.out.println("메서드명: "+name);
		if(obj instanceof UserInfoVO) {
			UserInfoVO data=(UserInfoVO)obj;
			if(data.getGender().equals("ADMIN")) {
				System.out.println("관리자 로그인");
			}
			else {
				System.out.println("일반사용자 로그인");
			}
		}
		System.out.println("get()와 조합되는 returning");
	}
}
