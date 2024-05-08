<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="server.jsp" method="post">
	이름 : <input type="text" name = "name"><br>
	아이디 : <input type="text" name = "id"> <br>
	패스워드 : <input type="password" name = "password"><br>
	성별 : <input type="radio" name= "gender" value="남성">남
		<input type="radio" name= "gender" value="여성">여 <br>
	
	메일수신거부 : <input type="checkbox" name = "email" value="공지 메일">공지 메일
	<input type="checkbox" name = "email" value="광고 메일">광고 메일
	<input type="checkbox" name = "email" value="배송 확인 메일">배송 확인 메일 <br>
	직업 : <select name = "job">
		<option>회사원</option>
		<option>학생</option>
		<option>무직</option>
	</select><br>
	<input type="submit" value="취소">
	<input type="submit" value="확인">
</form>
</body>
</html>