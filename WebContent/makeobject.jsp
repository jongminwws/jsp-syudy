<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="member" scope="request" class = "javaexample.memberinfo">
    <%
    	member.setId("madvirus");
    	member.setname("홍길동");
    %>
    <jsp:forward page="/useobject.jsp"/>
    </jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>