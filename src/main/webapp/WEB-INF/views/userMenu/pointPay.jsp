<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>



        <main class="pointPayMain">
            <section class="pointPayContent">
                <div class="Paybox">
                    <h2>{$이름}님</h2>
                    <h2>보유포인트 {$포인트}원</h2><br>

                    <div class="container" style="margin-top: 10px;">
                        <h2>포인트 충전</h2>

                        <div class="btn-group">
                            <form action="/member/pointCharge" method="post" name="updatePoint" th:object="${member}">

                                <input type="hidden" name="memberId" id="memberId" th:value="${member.memberId}">
                                <input type="hidden" name="pointType" id="pointType" value="포인트 충전">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="10000" name="pointPoint"
                                        th:value="10000" checked>
                                    <label class="form-check-label" for="10000">
                                        10,000p
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="pointPoint" id="50000"
                                        th:value="50000">
                                    <label class="form-check-label" for="50000">
                                        50,000p
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="pointPoint" id="100000"
                                        th:value="100000">
                                    <label class="form-check-label" for="100000">
                                        100,000p
                                    </label>
                                </div>

                                <input class="btn" type="button" onclick="requestPay()" value="포인트 충전">
                            </form>
                        </div>
                    </div>

                </div>
                <div class="right-wrap">
                    <div class="top-side">
                        <h3>결제수단</h3>
                        <br><input type="radio" name="pay" value="계좌 간편결제">계좌 간편결제
                        <br><input type="radio" name="pay" value="카드 간편결제">카드 간편결제
                        <br><input type="radio" name="pay" value="일반결제">일반결제

                        <div class="pay-btn">
                            <button>취소</button>
                            <button class="btn-open-popup">결제</button>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <div class="modal hidden">
            <div class="pointModal-container">
                <form action="#" method="get" class="chargeForm">
                    <h2>포인트 충전하기</h2>
                    <br>
                    <label for="">비밀번호</label>
                    <input type="text" size="20" placeholder="비밀번호">
                    <br>
                    <label for="">카드번호</label>
                    <input type="text" placeholder="카드번호">
                    <br>
                    <label for="">이메일 주소</label>
                    <input type="text" placeholder="이메일 주소">
                    <button type="button">인증하기</button>
                    <br>
                    <label for="">인증번호</label>
                    <input type="text" placeholder="인증번호">
                    <button class="pointModal-btn" type="submit">완료</button>
                    <button type="button" class="close" id="pointModal-Cancelbtn">취소</button>
                </form>
            </div>
        </div>

<%@ include file="../include/footer.jsp"%>

<script>
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');
    const close = document.querySelector(".close");

    btnOpenPopup.addEventListener("click", function () {
        modal.classList.remove("hidden");
    });
    close.addEventListener("click", function () {
        modal.classList.add("hidden")
    });
</script>