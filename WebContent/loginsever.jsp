<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<%
    String memberid = request.getParameter("memberid");
    String pass = request.getParameter("pass");
    boolean isValidUser = false;

    // DB 연결 정보
    String jdbcUrl = "jdbc:mysql://localhost:3306/exx?serverTimezone=Asia/Seoul";
    String dbUser = "root";
    String dbPass = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
        String sql = "SELECT * FROM member WHERE memberid = ? AND password = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, memberid);
        pstmt.setString(2, pass);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            isValidUser = true;
            session.setAttribute("memberid", memberid);
        }

        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (isValidUser) {
%>
        <h2>로그인 성공</h2>
        <p>환영합니다, <%= memberid %>님!</p>
        <a href="px1.jsp">게시물 작성하기</a>
<%
    } else {
%>
        <h2>로그인 실패</h2>
        <p>아이디 또는 비밀번호가 잘못되었습니다.</p>
        <a href="login.jsp">다시 시도</a>
<%
    }
%>
</body>
</html>
