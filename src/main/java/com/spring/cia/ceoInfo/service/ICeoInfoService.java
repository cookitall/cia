package com.spring.cia.ceoInfo.service;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.CeoInfoVO;
import com.spring.cia.command.ShopVO;

public interface ICeoInfoService {

	//회원가입 아이디 중복체크
	int ceoIdChk(String ceoId);
	
	//사업자회원가입
	void ceoJoin(CeoInfoVO vo);
	
	//사업자 로그인
	CeoInfoVO ceoLogin(@Param("ceoId") String ceoId, @Param("ceoPw") String ceoPw);
	
	//사업자 수정 비밀번호 확인
	String ceoPwChk(String ceoId);
	
	//정보 가져오기
	CeoInfoVO ceoInfoGet(String ceoId);
	
	//사업자 정보수정
	void ceoModify(CeoInfoVO vo);
	
	//사업자 탈퇴
	void ceoDelete(String CeoId);
	
}
