<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	public int multiplay(int a, int b) {
	int c = a* b;
	return  c;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
10 *25 = <%= multiplay(10,25) %>
</body>
</html>