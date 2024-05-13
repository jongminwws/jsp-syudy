<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="memberinfo" class= "javaexample.memberinfo">
    <jsp:setProperty name="memberinfo" property="*" />
    <jsp:setProperty name="memberinfo" property="password" value="<%= memberinfo.getId()%>" />
    </jsp:useBean>
    <jsp:setProperty property="*" name="memberinfo"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="400" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td>아이디</td>
	<td>${memberinfo.id}</td>
	<td>암호</td>
	<td>${memberinfo.password}</td>
</tr>
<tr>
	<td>이름</td>
	<td>${memberinfo.name}</td>
	<td>이메일</td>
	<td>${memberinfo.email}</td>
</tr>
</table>
</body>
</html>