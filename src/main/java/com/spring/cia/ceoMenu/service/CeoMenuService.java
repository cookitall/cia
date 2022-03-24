package com.spring.cia.ceoMenu.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cia.ceoMenu.mapper.ICeoMenuMapper;
import com.spring.cia.command.CouponVO;
import com.spring.cia.command.DeliveryVO;
import com.spring.cia.command.OrderVO;
import com.spring.cia.command.PaymentVO;
import com.spring.cia.command.ReplyVO;
import com.spring.cia.command.ReviewVO;
import com.spring.cia.util.PageVO;

@Service
public class CeoMenuService implements ICeoMenuService {

	@Autowired
	private ICeoMenuMapper mapper;
	
	/*
	 * couponList
	 */
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

	@Override
	public void deleteLine(String couponCode) {
		mapper.deleteLine(couponCode);
	}



	/*
	 * couponList 끝
	 */

	/*
	 * menuList
	 */
	@Override
	public int insertMenu(Map<String, Object> map) {
		System.out.println(map.toString());
		
		return mapper.insertMenu(map);
	}

	@Override
	public Map<String, Object> getByteImage() {
		return mapper.getByteImage();
	}

	@Override
	public List<Map<String, Object>> getByteImageList() {
		return mapper.getByteImageList();
	}
	

	/*
	 * menuList 끝
	 */
	

	/*
	 * orderList
	 */
	

	/*
	 * orderList 끝
	 */
	

	/*
	 * saleHistory
	 */
	public OrderVO saleHis(String shopName, String daySta, String dayEnd) {
		String temp1 = daySta.substring(2);
		StringBuilder sb1 = new StringBuilder(temp1);
		sb1.setCharAt(2, '/');
		sb1.setCharAt(5, '/');
		String dayStart = sb1.toString();
		System.out.println(dayStart);

		String temp2 = dayEnd.substring(2);
		StringBuilder sb2 = new StringBuilder(temp2);
		sb2.setCharAt(2, '/');
		sb2.setCharAt(5, '/');
		String dayEnds = sb2.toString();
		System.out.println(dayEnds);


		List<OrderVO> dayList = mapper.saleHis(shopName, dayStart, dayEnds);
		System.out.println("맵퍼 호출" + dayList.toString());

		OrderVO order = new OrderVO();
		PaymentVO pvo = new PaymentVO();
		DeliveryVO dvo = new DeliveryVO();

		order.setHisCount(dayList.size());
		int op = 0;
		int cd = 0;
		int de = 0;
		int odp = 0;
		for(OrderVO ovo : dayList) {
			op += ovo.getPay().getOriginalPrice();
			cd += ovo.getPay().getCouponDiscount();
			de += ovo.getDeli().getDeliveryPrice();
			odp += ovo.getPay().getOrderPrice();
		}
		pvo.setOriginalPrice(op);
		pvo.setCouponDiscount(cd);
		pvo.setOrderPrice(odp);
		dvo.setDeliveryPrice(de);
		order.setPay(pvo);
		order.setDeli(dvo);
		return order;
	 }

	/*
	 * saleHistory 끝
	/*
	 * shopReviewList
	 */
	public List<ReviewVO> reivewList(@Param("shopName")String shopName, @Param("pvo")PageVO pvo){
		return mapper.reivewList(shopName, pvo);
	}
	public int getReviewTotal(String shopName) {
		return mapper.getReviewTotal(shopName);
	}

	public ReplyVO replyContent(int reviewNum) {
		return mapper.replyContent(reviewNum);
	}

	public void replyWrite(int writeReviewNum, String writeShopName, String writeReplyContent) {
		mapper.replyWrite(writeReviewNum, writeShopName, writeReplyContent);
		mapper.reviewReply(writeReviewNum);
	}
	public void replyDelete(int replyNum, int reviewNum) {
		mapper.replyDelete(replyNum);
		mapper.revewiReplyDel(reviewNum);
	}
	public void replyModify(int replyNum, String replyContent) {
		mapper.replyModify(replyNum, replyContent);
	}
	/*
	 * shopReviewList 끝
	 */

}
