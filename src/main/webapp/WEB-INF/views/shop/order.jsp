<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<title>주문하기</title>

    <div class="content-wrap">
        <section class="pay-container">
          <div class="pay-title">결제하기</div>

          <form class="pay-content">
            <div class="info">
              <div class="pay-sub-title">배달정보</div>
              <label for="user-address">주소</label>
              <div class="address-wrap">
                <input
                  type="text"
                  name="user-address"
                  id="user-address"
                  placeholder="검색을 통해 입력하세요"
                  readonly
                  required
                />
                <button class="address-check" type="button">검색</button>
              </div>

              <label for="user-address-detail">상세 주소</label>
              <input
                type="text"
                name="user-address-detail"
                id="user-address-detail"
                placeholder="상세 주소(필수)"
                required
              />

              <label for="user-phone">휴대폰 번호</label>
              <input
                type="tel"
                name="user-phone"
                id="user-phone"
                placeholder="휴대전화 번호 입력(필수)"
                required
              />
            </div>
            
            <!-- 요청사항 -->
            <div class="request">
              <div class="pay-sub-title">주문시 요청사항</div>
              <textarea
                name="user-request"
                rows="3"
                maxlength="100"
                placeholder="요청사항을 남겨주세요"
              ></textarea>
            </div>
            
            <!-- 결제수단 선택 -->
            <div class="pay-method">
              <div class="pay-sub-title">결제수단 선택</div>
              <div class="pay-wrap">
                <strong>온라인결제</strong> <small>웹에서 미리 결제</small>
                <div>
                  <label class="">온라인 결제</label>
                  <input
                    type="radio"
                    name="payment"
                    value="online-card"
                    required="required"
                  />신용카드
                  
                  <input
                    type="radio"
                    name="payment"
                    value="online-point"
                    required="required"
                  />포인트
               
                </div>
                <hr />
                <strong>현장결제</strong> <small>음식받고 직접 결제</small>
                <small>* 온라인 결제시에만 할인 혜택을 받을 수 있습니다.</small>
                <div>
                  <label class="">오프라인 결제</label>
                  <input
                    type="radio"
                    name="payment"
                    value="offline-card"
                    required="required"
                  />신용카드
                  <input
                    type="radio"
                    name="payment"
                    value="offline-card"
                    required="required"
                  />만나서 현금결제
                </div>
              </div>
            </div>

            <!-- 할인방법 선택 -->
            <div class="pay-sub-title">할인방법 선택</div>
            <label for="discount">쿠폰</label>
            <div class="discount-wrap">
              <input
                type="text"
                name="user-address"
                id="user-address"
                placeholder="쿠폰 코드를 입력하세요"
                readonly
                required
              />
              <button class="address-check" type="button">검색</button>
            </div>
          </form>
        </section>

        <section class="order-table">
          <h2 class="title">주문내역</h2>
          <ul class="order-list">
            <li>
              <span class="menu">페페로니 피자</span>
              <span class="count">X 2</span>
              <span class="price">19,900원</span>
            </li>
            <li>
              <span class="menu">하와이안 피자</span>
              <span class="count">X 1</span>
              <span class="price">11,900원</span>
            </li>
            <li class="delivery">
              <span class="menu">배달료</span>
              <span class="price">3,000원</span>
            </li>
          </ul>
          <div class="total-price">
            <span class="menu">총 결제 금액</span>
            <span class="price">24,000원</span>
          </div>
          <p>개인정보 제3자 제공 내용 확인하였으며 결제에 동의합니다.</p>
          <button class="pay-btn" type="button" onclick="<c:url value='/shop/payment' />">결제하기</button>
        </section>
      </div>


<%@ include file="../include/footer.jsp"%>