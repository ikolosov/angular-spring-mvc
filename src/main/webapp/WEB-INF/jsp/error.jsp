<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring MVC with AngularJS: Error Page</title>
</head>
<body>
Smth. went wrong...<br><br>
URL: ${url}<br>
Exception: ${exception.message}<br>
<c:forEach items="${exception.stackTrace}" var="stLine">
    ${stLine}
</c:forEach>
</body>
</html>
