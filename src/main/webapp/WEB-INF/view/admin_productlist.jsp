<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null || !"admin".equals(username)) {
    response.sendRedirect("index.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Admin - 상품 목록 관리</title>
  <link rel="stylesheet" href="admin_productlist.css">
</head>
<body>

<header>
  <div class="logo">
    <a href="index.jsp">
      <img src="img/logo.png" alt="Grids & Circle 로고">
    </a>
  </div>
  <div class="buttons">
    <a href="logout.jsp">로그아웃</a>
  </div>
</header>

<div class="container">
  <div class="order-panel">
    <h1>상품 목록 관리 (Admin 전용)</h1>

    <div class="add-btn-wrap">
      <button class="add-btn" onclick="addProductRow()">+ 새 제품 추가</button>
    </div>

    <table class="order-table">
      <thead>
      <tr>
        <th>이미지</th>
        <th>제품명</th>
        <th>수량</th>
        <th>제품코드</th>
        <th>가격</th>
        <th>관리</th>
      </tr>
      </thead>
      <tbody id="productTableBody">
      <tr>
        <form method="post" action="save-product" onsubmit="return validateForm(this)">
          <td><input type="text" name="productImage" placeholder="이미지 URL" required></td>
          <td><input type="text" name="productTitle" placeholder="제품명" required></td>
          <td><input type="number" name="productQuantity" min="0" placeholder="수량" required></td>
          <td><input type="text" name="productCode" placeholder="제품코드" required></td>
          <td><input type="number" name="productPrice" min="0" placeholder="가격" required></td>
          <td>
            <button type="submit" class="action-btn confirm">확인</button>
            <button type="button" class="action-btn delete" onclick="deleteProduct(this)">삭제</button>
          </td>
        </form>
      </tr>
      </tbody>
    </table>
  </div>
</div>

<script>
  function deleteProduct(button) {
    if (confirm('정말 삭제하시겠습니까?')) {
      const form = button.closest('form');
      form.action = 'delete-product';
      form.submit();
    }
  }

  function addProductRow() {
    const tbody = document.getElementById('productTableBody');
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <form method="post" action="save-product" onsubmit="return validateForm(this)">
        <td><input type="text" name="productImage" placeholder="이미지 URL" required></td>
        <td><input type="text" name="productTitle" placeholder="제품명" required></td>
        <td><input type="number" name="productQuantity" min="0" placeholder="수량" required></td>
        <td><input type="text" name="productCode" placeholder="제품코드" required></td>
        <td><input type="number" name="productPrice" min="0" placeholder="가격" required></td>
        <td>
          <button type="submit" class="action-btn confirm">확인</button>
          <button type="button" class="action-btn delete" onclick="deleteProduct(this)">삭제</button>
        </td>
      </form>
    `;
    tbody.appendChild(tr);
  }

  function validateForm(form) {
    const inputs = form.querySelectorAll('input');
    for (let input of inputs) {
      if (!input.value.trim()) {
        alert('모든 항목을 입력해 주세요.');
        input.focus();
        return false;
      }
    }
    return true;
  }
</script>

</body>
</html>
