package com.spring.cia.ceoInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cia.ceoInfo.mapper.ICeoInfoMapper;
import com.spring.cia.command.CeoInfoVO;

@Service
public class CeoInfoService implements ICeoInfoService {

	@Autowired
	private ICeoInfoMapper mapper;
	
	@Override
	public int ceoIdChk(String ceoId) {
		return mapper.ceoIdChk(ceoId);
	}

	@Override
	public void ceoJoin(CeoInfoVO vo) {
		mapper.ceoJoin(vo);
	}

	@Override
	public CeoInfoVO ceoLogin(String ceoId, String ceoPw) {
		return mapper.ceoLogin(ceoId, ceoPw);
	}

	@Override
	public void ceoModify(CeoInfoVO vo) {
		mapper.ceoModify(vo);
	}

}
