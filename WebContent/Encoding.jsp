<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String value = "자바";
    String encodedValue = URLEncoder.encode(value, "UTF-8");
    response.sendRedirect("index.jsp?name=" + encodedValue);
%>
</body>
</html>
