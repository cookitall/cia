package com.spring.cia.userInfo.sevice;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.UserInfoVO;

public interface IUserInfoService {
	//회원가입 아이디 중복체크
	int userIdChk(String userId);
	
	//유저 회원가입
	void userJoin(UserInfoVO vo);

	
	//유저 로그인
	UserInfoVO userLogin(@Param("userId")String userId,@Param("userPw")String userPw);
	
	//정보수정 비밀번호 체크
	String userPwChk(String userId);
	
	//유저 정보 가져오기
	UserInfoVO userInfoGet(String userId);
	
	//유저 정보수정
	void userModify(UserInfoVO vo);
	
	//유저 탈퇴
	void userDelete(String userId);
}
