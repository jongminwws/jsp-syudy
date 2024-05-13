<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="member" scope="request" class = "javaexample.memberinfo"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= member.getname() %> (<%= member.getId() %>) 회원님 안녕하세여
</body>
</html>