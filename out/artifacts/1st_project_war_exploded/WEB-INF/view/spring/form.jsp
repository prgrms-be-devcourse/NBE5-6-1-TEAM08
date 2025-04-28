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
    <form:form modelAttribute="urlEncodedForm" class="col s12" action="/form" method="post">
        <div class="row">
            <div class="input-field col s7 ">
                <i class="material-icons prefix">account_circle</i>
                <form:input path="userId" id="userId" name="userId" type="text" placeholder="userId"
                            class="validate"/>
                <form:errors path="userId" cssClass="helper-text"/>
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

</body>
</html>