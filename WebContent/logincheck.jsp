<%@page import="util.cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.cookies" %>
    <%
    	Cookie cookie = new Cookie(request);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(Cookie.getValue("AUTH")) {
%>

아이디 "<%= Cookie.getValue("AUTH") %>" 로 로그인 한 상태
<%
	}else {
%>
	로그인 하지 않은 상태
<% } %>
</body>
</html>