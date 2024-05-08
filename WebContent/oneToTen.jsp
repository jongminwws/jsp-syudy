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
	int sum = 0;
	for(int i=1; i<= 10; i++) {
		sum = sum + i;
	}
%>
1부터 10까지의 합은 <%= sum %> 이다
<br>
1부터 10까지의 합은 
<%= 1+2+3+4+5+6+7+8+9+10 %> 이다
</body>
</html>