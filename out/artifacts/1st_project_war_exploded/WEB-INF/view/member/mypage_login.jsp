<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>mypage_main</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap">
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
      height: 6vh;
      position: relative;
    }

    .logo {
      transform: translateX(-50%);
      position: absolute;
      left: 50%;
    }

    .logo img {
      height: 60px;
    }

    .main-container {
      display: flex;
      gap: 40px;
      margin-top: 100px;
      margin-left: 160px;
      margin-right: auto;
      justify-content: flex-start;
      width: 80%;
    }

    .left-panel{
      background-color: transparent;
      width:130px;
      height: 500px;
    }

    .left-panel h3 {
      margin-top: 38px;
      margin-bottom: 10px;
      font-size: 20px;
      border-bottom: 1px;
      padding-bottom: 10px;

    }

    .left-panel ul {
      list-style: none;
      padding: 0;
      margin : 0;

    }
    .left-panel li {
      margin-bottom: 38px;
    }


    .left-panel a{
      text-decoration: none;
      color: black;
      font-weight: normal;
      font-size: 16px;
    }

    .goto-link {
      text-decoration: none;
      color: black;
    }
    .goto-link:hover {
      text-decoration: underline;
    }


    .right-panel {
      background-color: white;
      width: 1000px;
      height: 500px;

      padding: 20px;
    }
    .right-panel h1 {
      margin-top: 4px;
    }


  </style>
</head>
<body>

<header>
  <div class="logo">
    <a href="main"><img src="img/logo.png" alt="Grids & Circle 로고"></a>
  </div>
</header>

<div class="main-container">
<!-- nav -->
<div class="left-panel">
  <h3>마이페이지</h3>
  <h6>   </h6>
  <ul>

    <li><a class = "goto-link" onclick="loadPage('userOrderlist')">주문 내역 확인 </a></li>
    <li><a class = "goto-link" onclick="loadPage('paymentSet')">결제 수단 등록</a></li>
    <li><a class = "goto-link" onclick="loadPage('cs')">1 : 1 문의 내역</a></li>
    <li><a class = "goto-link" onclick="loadPage('userEdit')">개인 정보 수정</a></li>

  </ul>
  <h3> </h3>
  <h3> </h3>
  <h3> </h3>
<div  class = "goto-link">
  <a href = "main">홈으로</a>
  </div>
  <!-- 동적 데이터 삽입 예정 -->


</div>
<div class="right-panel">
  <iframe id="iframee" width="100%" height="100%" style="border: none;"></iframe>
  <!-- 동적 데이터 삽입 예정 -->
</div>
</div>
</body>
<script>
  function loadPage(pageUrl) {
    document.getElementById('iframee').src = pageUrl;
  }

  /*처음에 보이는게 주문내역확인이라면*/
  window.onload = function () {
    loadPage('userOrderlist');
  };

</script>
</html>
