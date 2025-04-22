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
    <form:form action="${context}/book/regist" method="post" enctype="multipart/form-data" modelAttribute="bookRegistForm">
        <div class="file-field input-field">
            <div class="btn">
                <span>File</span>
                <input type="file" name="thumbnail">
            </div>
            <div class="file-path-wrapper">
                <input class="file-path validate" type="text">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <i class="material-icons prefix">mode_edit</i>
                <form:textarea path="title" name="title" id="icon_prefix2" class="materialize-textarea" />
                <form:errors path="title" />
                <label for="icon_prefix2">Title</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <i class="material-icons prefix">mode_edit</i>
                <form:textarea path="author" name="author" id="icon_prefix2" class="materialize-textarea"/>
                <form:errors path="author" />
                <label for="icon_prefix2">Author</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <i class="material-icons prefix">mode_edit</i>
                <form:textarea path="info" name="info" id="icon_prefix2" class="materialize-textarea"/>
                <form:errors path="info" />
                <label for="icon_prefix2">Info</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <select name="category">
                    <c:forEach items="${category}" var="cate">
                        <option value="${cate}">${cate}</option>
                    </c:forEach>
                </select>
                <label>Materialize Select</label>
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