package com.spring.cia.userInfo.sevice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cia.command.UserInfoVO;
import com.spring.cia.userInfo.mapper.IUserInfoMapper;

@Service
public class UserInfoService implements IUserInfoService {

	@Autowired
	private IUserInfoMapper mapper;
	
	@Override
	public int userIdChk(String userId) {
		return mapper.userIdChk(userId) ;
	}

	@Override
	public void userJoin(UserInfoVO vo) {
		mapper.userJoin(vo);
	}

	@Override
	public UserInfoVO userLogin(String userId, String userPw) {
		return mapper.userLogin(userId, userPw) ;
	}

	@Override
	public String userPwChk(String userId) {
		return mapper.userPwChk(userId) ;
	}

	@Override
	public UserInfoVO userInfoGet(String userId) {
		return mapper.userInfoGet(userId) ;
	}

	@Override
	public void userModify(UserInfoVO vo) {
		mapper.userModify(vo);
	}

	@Override
	public void userDelete(String userId) {
		mapper.userDelete(userId);
	}

}
