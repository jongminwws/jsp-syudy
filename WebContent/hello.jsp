<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="memberInsertServer.jsp" method="post">
<table>
    <tr>
        <td>아이디</td>
        <td><input type="text" name="id"></td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td><input type="password" name="password"></td>
    </tr>
    <tr>
        <td>이메일</td>
        <td><input type="text" name="email"></td>
    </tr>
    <tr>
        <td>이름</td>
        <td><input type="text" name="name"></td>
    </tr>
    <tr>
        <td>생년월일</td>
        <td><input type="text" name="birth"></td>
    </tr>
    <tr>
        <td>통신사</td>
        <td>
            <select name="phonekine">
                <option value="skt">skt</option>
                <option value="lg">lg</option>
                <option value="kt">kt</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>성별</td>
        <td>
            <input type="radio" value="f" name="gender">남
            <input type="radio" value="m" name="gender">여
        </td>
    </tr>
    <tr>
        <td>내/외국인</td>
        <td>
            <input type="radio" value="l" name= "local">외국인
            <input type="radio" value="f" name= "local">내국인
        </td>
    </tr>
    <tr>
        <td>연락처</td>
        <td><input type="text" name="phoneno"></td>
    </tr>
    <tr>
        <td><input type="submit" value="회원가입"></td>
    </tr>
</table>
</form>
</body>
<script>
</script>

</html>
