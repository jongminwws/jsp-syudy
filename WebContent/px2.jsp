<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 저장</title>
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
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // DB 연결 정보
        String jdbcUrl = "jdbc:mysql://localhost:3306/exx?serverTimezone=Asia/Seoul";
        String dbUser = "root";
        String dbPass = "1234";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            String sql = "INSERT INTO posts (memberid, title, content) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberid);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
%>
            <h2>게시물 저장 완료</h2>
            <p>게시물이 성공적으로 저장되었습니다.</p>
            <a href="px1.jsp">게시물 작성 페이지로 이동</a> <br>
            <a href="viewPost.jsp">게시물 목록 이동</a>
<%
        } catch (Exception e) {
            e.printStackTrace();
%>
            <h2>오류 발생</h2>
            <p>게시물을 저장하는 중 오류가 발생했습니다.</p>
            <a href="px1.jsp">다시 시도</a>
<%
        }
    }
%>
</body>
</html>
