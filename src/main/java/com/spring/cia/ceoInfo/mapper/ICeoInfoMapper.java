package com.spring.cia.ceoInfo.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.cia.command.CeoInfoVO;

public interface ICeoInfoMapper {

	//회원가입 아이디 중복체크
	int ceoIdChk(String ceoId);
	
	//사업자회원가입
	void ceoJoin(CeoInfoVO vo);
	
	//사업자 로그인
	CeoInfoVO ceoLogin(@Param("ceoId")String ceoId, @Param("ceoPw")String Pw);
	
	//사업자 정보수정
	void ceoModify(CeoInfoVO vo);
	
}
