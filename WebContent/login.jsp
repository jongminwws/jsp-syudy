<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<h1>로그인 페이지</h1>
<form action="loginsever.jsp" method="get">
    아이디 : <input type="text" name="memberid"> <br>
    비밀번호 : <input type="password" name="pass"> <br>
    <input type="submit" value="로그인"><br>
    <a href="http://localhost:8080/jspexample/membershipForm.jsp">회원가입</a>
</form>
</body>
</html>
