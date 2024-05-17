<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
<%
    String memberid = (String) session.getAttribute("memberid");
    if (memberid == null) {
%>
    <h2>접근 불가</h2>
    <p>로그인 후 게시물을 작성할 수 있습니다.</p>
    <a href="login.jsp">로그인 페이지로 이동</a>
<%
    } else {
%>
    <h1>게시물 작성</h1>
    <form action="px2.jsp" method="post">
        제목: <input type="text" name="title"><br>
        내용: <textarea name="content"></textarea><br>
        <input type="submit" value="저장">
    </form>
<%
    }
%>
</body>
</html>
