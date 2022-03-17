package com.spring.cia.ceoMenu.couponList.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cia.ceoMenu.couponList.mapper.ICouponListMapper;
import com.spring.cia.command.CouponVO;

@Service
public class CouponListService implements ICouponListService {

	@Autowired
	private ICouponListMapper mapper;
	
	@Override
	public String generateCoupon(CouponVO couponVO) {

		Random rand = new Random();
		StringBuffer sb = new StringBuffer();
		
		//for문으로 10자리까지
		for (int i = 0; i < 16; i++) {
			//랜덤 0~2값을 index에 넣기
			int index = rand.nextInt(3);
			switch (index) {
			case 0:
				//대문자
				sb.append((char) (rand.nextInt(26) + 97));
				break;
			case 1:
				//소문자
				sb.append((char) (rand.nextInt(26) + 65));
				break;
			case 2:
				//숫자
				sb.append(rand.nextInt(10));
				break;
			}
		}
		System.out.println("생성된 쿠폰코드 값");
		System.out.println("=> " + sb);
		//CouponCode를 생성된 쿠폰값 넣기
		couponVO.setCouponCode(sb.toString());
		System.out.println("코드 생성된 후의 객체 상태");
		System.out.println("=> " + couponVO);
		mapper.generateCoupon(couponVO);
		return couponVO.getCouponCode();
	}

	@Override
	public List<CouponVO> getList() {
		return mapper.getList();
	}

}
