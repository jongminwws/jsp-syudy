<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String memberid = request.getParameter("memberid");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/exx?serverTimezone=Asia/Seoul";
        String dbid = "root";
        String dbpw = "1234";
        String query = "select * from member where memberid = '"+memberid+"'";
        
        conn = DriverManager.getConnection(url, dbid, dbpw);
        stmt = conn.createStatement();
        
        rs = stmt.executeQuery(query);
        if(rs.next()) {
%>
<table border="1">
    <tr>
        <td>아이디</td><td><%= memberid %></td>
    </tr>
    <tr>
        <td>암호</td><td><%= rs.getString("password") %></td>
    </tr>
    <tr>
        <td>이름</td><td><%= rs.getString("name") %></td>
    </tr>
    <tr>
        <td>이메일</td><td><%= rs.getString("email") %></td>
    </tr>
</table>
<%
        } else {
%>
<%= memberid %>에 해당하는 정보가 존재하지 않습니다
<%
        }
    } catch(SQLException ex) {
%>
에러 발생: <%= ex.getMessage() %>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
</body>
</html>
