<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원님의 이름은 <%= request.getParameter("name") %> 입니다 <br>
회원님의 아이디는 <%= request.getParameter("id") %>, 비밀번호는 <%= request.getParameter("password")%>입니다 <br>
성별은 <%= request.getParameter("gender") %> 이며 직업은 <%= request.getParameter("job") %> 입니다 <br>
메일 수신 거부는  
<% 
	String[] values = request.getParameterValues("email");
	for(int i = 0;i<values.length;i++){
	%>
<%= values[i] %>
<%
	}
%>
하셨습니다
</body>
</html>