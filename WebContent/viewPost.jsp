<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>
<h1>게시물 목록</h1>
<%
    // DB 연결 정보
    String jdbcUrl = "jdbc:mysql://localhost:3306/exx?serverTimezone=Asia/Seoul";
    String dbUser = "root";
    String dbPass = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
        String sql = "SELECT id, memberid, title, content, created_at FROM posts ORDER BY created_at DESC";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String memberid = rs.getString("memberid");
            String title = rs.getString("title");
            String content = rs.getString("content");
            Timestamp createdAt = rs.getTimestamp("created_at");
%>
            <div>
                <h2><%= title %></h2>
                <p>작성자: <%= memberid %></p>
                <p>작성일: <%= createdAt %></p>
                <p><%= content %></p>
            </div>
            <hr>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <h2>오류 발생</h2>
        <p>게시물을 불러오는 중 오류가 발생했습니다.</p>
        <pre><%= e.getMessage() %></pre>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</body>
</html>
