<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@include file="/WEB-INF/view/include/page.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Grids & Circle - 장바구니</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
    <style>
      body {
        margin: 0;
        font-family: 'sans-serif';
        background-color: #e3ded5;
      }

      header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 30px;
        background-color: #e3ded5;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        height:6vh;
      }

      .logo {
        transform: translateX(-50%);
        position: absolute;
        left: 50%;
      }

      .logo img {
        height: 60px;
      }

      .step-indicator {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 60px 0 40px;
        gap: 200px;
        font-size: 16px;
      }

      .step {
        display: flex;
        align-items: center;
        position: relative;
        color: #888;
        font-weight: bold;
      }

      .step.active {
        color: #000;
      }

      .step::after {
        content: "";
        width: 150px;
        height: 2px;
        background-color: #ccc;
        margin: 0 20px;
        position: absolute;
        top: 50%;
        left: 100%;
        transform: translateY(-50%);
        z-index: -1;
      }

      .step:last-child::after {
        display: none;
      }

      /*좌우 박스 분리*/
      .container {
        display: flex;
        gap: 20px;
        padding: 20px;
      }

      .left-box {
        flex: 2;
        background-color: #ffffff;
        padding: 20px;
        box-shadow: 0 1px 4px rgba(0,0,0,0.1);
      }

      .right-boxes {
        flex: 1;
        margin-left: auto;
        display: flex;
        flex-direction: column;
        gap: 10px;
      }

      .right-box {
        background-color: #ffffff;
        padding: 50px;

        box-shadow: 0 1px 4px rgba(0,0,0,0.1);
      }

      /*장바구니 담은 내역*/
      .cart-item {
        display: flex;
        align-items: center;
        gap: 15px;
        border-bottom: 1px solid #eee;
        padding: 15px 0;
      }

      .cart-item img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 5px;
      }

      .cart-info {
        flex: 1;
        display: flex;
        justify-content: space-between;
        flex-direction: column;
        position: relative;
        height: 100px;
      }

      .product-name {
        font-size: 18px;
        font-weight: bold;
      }

      .small-info {
        font-size: 13px;
        line-height: 2;
        color: #555;
      }

      .price-info {
        position: absolute;
        bottom: 0;
        right: 0;
        font-weight: bold;
        color: #000;
        font-size: 14px;
      }


      .summary {
        margin-top: 20px;
        font-size: 14px;
        text-align: right;
      }

      .summary div {
        margin: 5px 0;
      }

      .summary strong {
        font-size: 16px;
        color: #000;
      }

      .quantity-box {
        display: flex;
        align-items: center;
        gap: 5px;
      }

      .quantity-box input {
        width: 40px;
        text-align: center;
        font-size: 12px;
        border: 1px solid #ccc;
        padding: 5px;
      }

      .remove-btn {
        background: transparent;
        border: none;
        color: #888;
        font-size: 14px;
        margin-left: 10px;
        cursor: pointer;
        transition: color 0.2s;
      }

      .remove-btn:hover {
        color: #e74c3c;
      }

      /*결제하기 버튼*/
      .actions {
        display: flex;
        gap: 20px;
      }

      .actions button {
        padding: 12px 40px;
        margin-right : auto;
        font-size: 16px;
        border: 1px solid #333;
        border-radius: 8px;
        background-color: #e3ded5;
        cursor: pointer;
        transition: all 0.2s;
      }

      .actions button:hover {
        background-color: #000000;
        color: #edede9;
      }
      /*개인정보(마이페이지로 이동) 수정하기 버튼*/
      .mypage btn {
        position: absolute;
        top: 20px;
        right: 20px;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        background-color: #e3ded5;
        border: none;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: background-color 0.3s;
      }

      .mypage btn:hover {
        background-color: #000;
        color: #fff;
      }

      .mypage btn i {
        font-size: 16px;
        color: #333;
      }
    </style>
</head>

<body>

    <header>
        <div class="logo">
            <a href="index.jsp"><img src="img/logo.png" alt="Grids & Circle 로고"></a>
        </div>
    </header>

    <div class="step-indicator">
        <div class="step active">장바구니</div>
        <div class="step">결제하기</div>
        <div class="step">확인</div>
    </div>

    <c:set var="total" value="0"/>
    <div class="container">
        <!-- 장바구니 목록 -->
        <div class="left-box">
            <div class="left-panel">
<%--                <p>${orderCount}개의 상품이 장바구니에 담겨 있습니다.</p>--%>
                <p>${fn:length(orderInfos)}개의 상품이 장바구니에 담겨 있습니다.</p>
            </div>
            <c:forEach var="order" items="${orderInfos}" >
                <div class="cart-item">
                    <img src="/assets/img/coffee/coffee1.png" alt="상품 이미지">
                    <div class="cart-info">
                        <div class="product-name">
                            ${order.productName}

                            <button type="button" class="remove-btn"
                                    data-product-name="${order.productName}" data-email="${order.email}">
                                <i class="fas fa-times"></i>
                            </button>

                        </div>
                        <div class="small-info">상품코드: ${order.productId}</div>

<%--                            <div class="quantity-box">--%>
<%--                                <input type="hidden" name="productId" value="12345">--%>
<%--                                <input type="number" name="quantity" value="${order.orderCnt}" min="1">--%>
<%--                            </div>--%>
                        <div class="quantity-box">
                            <input type="hidden" class="productName" value="${order.productName}">
                            <input type="hidden" class="email" value="${order.email}">
                            <input type="hidden" class="userId" value="${order.userId}">
                            <input type="number" class="orderCnt" value="${order.orderCnt}" min="1">
                        </div>


                        <div class="price-info">${order.price * order.orderCnt}원</div>
                    </div>
                </div>

<%--                총합 누적 --%>
                <c:set var="total" value="${total + (order.price * order.orderCnt)}"/>
            </c:forEach>
            <c:set var="deliveryCharge" value="3000"/>
            <div class="summary">
                <div>소계: ${order.price * order.orderCnt}원</div>
                <div>배송비: ${deliveryCharge}원</div>
                <div><strong>총액: ${total + deliveryCharge}원</strong></div>
            </div>
        </div>

        <!-- 우측: 사용자 정보 + 결제 버튼 -->
        <div class="right-boxes">
            <div class="right-box" style="position: relative;">
                <h4>배송 정보</h4>
<%--                <% if (user != null) { %>--%>
                <div class="small-info">이름: 도라에몽</div>
                <div class="small-info">이메일: dora@dora.com</div>
                <div class="small-info">연락처: 010-3333-7777</div>
                <div class="small-info">배송지: LA 콴다시티 4번길 12-3</div>
<%--                <button class="mypage-btn" onclick="location.href='mypage.jsp'">--%>
<%--                    <i class="fas fa-user-edit"></i>--%>
<%--                </button>--%>
<%--                <% } else { %>--%>
<%--                <div class="small-info">로그인 후 배송정보가 표시됩니다.</div>--%>
<%--                <% } %>--%>
            </div>

            <div class="right-box">
                <div class="actions">
                    <form action="payment.jsp" method="get">
                        <button type="submit">결제하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
      // 모든 수량 input에 대해 이벤트 추가, 수량 변경에 따른 update, put요청
      document.querySelectorAll('.orderCnt').forEach((input, index) => {
        input.addEventListener('change', function () {
          const quantity = input.value;  // 현재 input의 값
          const productName = document.querySelectorAll('.productName')[index].value;  // 같은 인덱스의 상품명
          const email = document.querySelectorAll('.email')[index].value;  // 추가
          const userId = document.querySelectorAll('.userId')[index].value;  // 추가

          console.log('변경된 수량:', quantity);
          console.log('상품명:', productName);
          console.log('이메일:', email);
          console.log('유저아이디:', userId);

          fetch('/api/update-cart', {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
              productName: productName,
              email: email,
              userId: userId,
              orderCnt: Number(quantity)
            }),
          })
          .then(res => res.json())
          .then(data => alert('수량이 서버에 반영되었습니다!'))
          .catch(err => console.error('업데이트 실패', err));
        });
      });

      // x버튼 클릭 이벤트 발생시 delete 요청으로 상품 삭제
      document.querySelectorAll('.remove-btn').forEach((button) => {
        button.addEventListener('click', function () {
          const productName = this.dataset.productName;
          const email = this.dataset.email;

            fetch(`/api/remove-cart`, {
              method: 'DELETE',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify({
                productName: productName,
                email: email,
              }),
            })
            .then(res => {
              if (res.ok) {
                location.href = '/cart/man'; // 삭제 성공 후 리다이렉트
              } else {
                alert('삭제 실패!');
              }
            })
            .catch(err => console.error('삭제 에러', err));

        });
      });

    </script>
</body>
</html>
