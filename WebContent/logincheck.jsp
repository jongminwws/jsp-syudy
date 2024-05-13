<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.Cookies" %>
<%
    Cookies cookies = new Cookies(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    Cookie authCookie = cookies.getCookie("AUTH");
    if (authCookie != null) {
        String username = authCookie.getValue();
%>
    아이디 "<%= username %>" 로 로그인 한 상태
<%
    } else {
%>
    로그인 하지 않은 상태
<%
    }
%>
</body>
</html>
