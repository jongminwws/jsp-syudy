<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="processJoining.jsp" method="post">
<h1>회원가입</h1>
<table>
<tr>
    <td>이메일</td>
    <td colspan="3"><input type="text" name="email" size="10"></td>
</tr>
<tr>
    <td>이름</td>
    <td><input type="text" name="name" size="10"></td>
</tr>
<tr>
    <td>비밀번호</td>
    <td><input type="password" name="password" size="10"></td>
</tr>
<tr>
    <td>비밀번호 확인</td>
    <td><input type="password" name="passwordcheck" size="10"></td>
</tr>
<tr>
    <td colspan="4" align="center">
    <input type="submit" value="회원가입">
    </td>
</tr>
</table>
</form>
</body>
</html>
