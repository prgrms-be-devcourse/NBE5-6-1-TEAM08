<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>주문 목록</title>
  <link rel="stylesheet" href="../../assets/css/mypage.css">


  <div class = "nav">
    <a class="logo", href="../main">CoffeeStore</a>
    <a href="user_Orderlist">주문상품조회</a>
    <a href = "userEdit">회원정보수정</a>
    <a href="cs">고객센터문의</a>
    <a href="signup">회원가입</a>
    <a>회원정보</a>
  </div>

</head>




<body>


  <!--주문목록-->
<div class="order-container">


  <h2>2025. 4. 22 주문</h2>
  <div class="order-card">
    <div class="order-image">
      <img src="https://via.placeholder.com/100" alt="상품 이미지">
    </div>
    <div class="order-info">
      <p class="delivery-status">배송상황
        <span class="green">도착날짜 4/24(요일) </span>(배송현황)</p>
      <p class="product-name"> (닌텐도 스위치2) </p>
      <p class="product-price"> (가격 갯수)</p>
      <div class="order-actions">
        <!--        <button>배송조회</button>-->
        <button>교환/반품 신청</button>
        <!--        <button>리뷰 작성하기</button>-->
      </div>
    </div>
  </div>

  <h2>2025. 4. 22 주문</h2>
  <div class="order-card">
    <div class="order-image">
      <img src="https://via.placeholder.com/100" alt="상품 이미지">
    </div>
    <div class="order-info">
      <p class="delivery-status">배송중   <span class="green">4/24(목)</span> 도착</p>
      <p class="product-name">닌텐도 스위치2 </p>
      <p class="product-price">650,000원   1개</p>
      <div class="order-actions">
<!--        <button>배송조회</button>-->
        <button>교환/반품 신청</button>
<!--        <button>리뷰 작성하기</button>-->
      </div>
    </div>
  </div>

  <h2>2025. 4. 21 주문</h2>
  <div class="order-card">
    <div class="order-image">
      <img src="https://via.placeholder.com/100" alt="상품 이미지">

    </div>
    <div class="order-info">
      <p class="delivery-status">배송완료   <span class="green">4/22(화)</span> 도착</p>
      <p class="product-name">독일 부직포 행주 랜덤 발송, 38x38cm, 20개</p>
      <p class="product-price">4,660원   1개</p>
      <div class="order-actions">
<!--        <button>배송조회</button>-->
        <button>교환/반품 신청</button>
<!--        <button>리뷰 작성하기</button>-->
      </div>
    </div>
  </div>
</div>




<!--  <ul id="slide-out" class="sidenav">-->
<!--    <li>-->
<!--      <div class="user-view">-->
<!--        <div class="background">-->
<!--&lt;!&ndash;          <img src="${context}/assets/img/flower1.PNG">&ndash;&gt;-->
<!--        </div>-->
<!--&lt;!&ndash;        <a href="#user"><img class="circle" src="${context}/assets/img/flower1.PNG"></a>&ndash;&gt;-->
<!--        <a href="#name"><span class="white-text name">회원정보수정</span></a>-->
<!--        <a href="#email"><span class="white-text email">jdandturk@gmail.com</span></a>-->
<!--      </div>-->
<!--    </li>-->
<!--    <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>-->
<!--    <li><a href="#!">Second Link</a></li>-->
<!--    <li>-->
<!--      <div class="divider"></div>-->
<!--    </li>-->
<!--    <li><a class="subheader">Subheader</a></li>-->
<!--    <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>-->
<!--  </ul>-->
</body>
</html>