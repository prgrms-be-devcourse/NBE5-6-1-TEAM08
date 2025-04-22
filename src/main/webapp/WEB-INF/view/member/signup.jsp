<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/page.jsp" %>
<html>
<head>
    <title>Grepp</title>
    <%@include file="/WEB-INF/view/include/static.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/view/include/header.jsp" %>
<%@include file="/WEB-INF/view/include/sidenav.jsp" %>
<main class="container">
    <form:form modelAttribute="signupForm" class="col s12" action="/member/signup" method="post" id="signupForm">
        <div class="row">
            <div class="input-field col s7 ">
                <i class="material-icons prefix">account_circle</i>
                <form:input path="userId" id="userId" name="userId" type="text" placeholder="userId"
                            class="validate"/>
                <form:errors path="userId" cssClass="helper-text"/>
                <span class="helper-text" id="idCheckMsg" style="display: none"></span>
            </div>
            <div class="input-field col s7 ">
                <i class="material-icons prefix">account_circle</i>
                <form:input path="password" id="password" name="password" type="password"
                            placeholder="password"
                            class="validate"/>
                <form:errors path="password" cssClass="helper-text"/>
            </div>
            <div class="input-field col s7 ">
                <i class="material-icons prefix">email</i>
                <form:input path="email" id="email" name="email" type="email" placeholder="email"
                            class="validate"/>
                <form:errors path="email" cssClass="helper-text"/>
            </div>
            <div class="input-field col s7 ">
                <i class="material-icons prefix">phone</i>
                <form:input path="tel" id="tel" name="tel" type="tel" placeholder="tel"
                            class="validate"/>
                <form:errors path="tel" cssClass="helper-text"/>
            </div>
        </div>
        <button class="btn waves-effect waves-light offset-s1" type="submit" name="action">
            Submit
            <i class="material-icons right">send</i>
        </button>
    </form:form>

</main>
<%@include file="/WEB-INF/view/include/footer.jsp" %>

<script>
        const validElement = document.querySelector('#idCheckMsg');
        document.querySelector('#userId').addEventListener('focusout', async ev => {
          const id = ev.target.id;
          if (!id) return;
          const response = await fetch('/api/member/exist/' + id);
          const data = await response.json();

          console.log(data);
          validElement.style.display = 'block';
          validElement.textContent = data.data ? '사용이 불가능한 아이디입니다.' : '사용 가능한 아이디입니다.';
        });

        document.querySelector('#signupForm').addEventListener('submit', async ev => {
          // form tag 의 기본 이벤트 차단
          ev.preventDefault();
          const id = document.querySelector('#userId').value;
          if (!id) return;
          const response = await fetch('/api/member/exist/' + id);
          const data = await response.json();

          if (data.data) {
            document.querySelector('#userId').focus();
            validElement.textContent = '사용이 불가능한 아이디입니다.';
            return;
          }

          ev.target.submit();
        });
</script>

</body>
</html>