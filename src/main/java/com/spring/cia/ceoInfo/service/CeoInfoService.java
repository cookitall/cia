package com.spring.cia.ceoInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cia.ceoInfo.mapper.ICeoInfoMapper;
import com.spring.cia.command.CeoInfoVO;
import com.spring.cia.command.ShopVO;

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
		mapper.shopJoin(vo.getShop());
	}

	@Override
	public CeoInfoVO ceoLogin(String ceoId, String ceoPw) {
		return mapper.ceoLogin(ceoId, ceoPw);
	}

	@Override
	public String ceoPwChk(String ceoId) {
		return mapper.ceoPwChk(ceoId);
	}
	
	@Override
	public void ceoModify(CeoInfoVO vo) {
		mapper.ceoModify(vo);
		mapper.shopModify(vo.getShop());
	}

	@Override
	public CeoInfoVO ceoInfoGet(String ceoId) {
		return mapper.ceoInfoGet(ceoId);
	}

	@Override
	public void ceoDelete(String CeoId) {
		mapper.ceoDelete(CeoId);
	}

}
