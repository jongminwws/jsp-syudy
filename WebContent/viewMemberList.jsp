<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
Member 테이블의 내용
<table width="100" border="1">
<tr>
    <td>이름</td><td>아이디</td><td>이메일</td>
</tr>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        //1. JDBC 드라이버 로딩
        Class.forName("com.mysql.cj.jdbc.Driver");

        //2. 데이터베이스 연결
        String url = "jdbc:mysql://localhost:3306/exx?serverTimezone=Asia/Seoul";
        String dbid = "root";
        String dbpw = "1234";
        conn = DriverManager.getConnection(url, dbid, dbpw);

        //3. 쿼리 실행
        String query = "select * from member order by memberid";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);

        //4. 쿼리 실행 결과 표시
        while(rs.next()) {
%>
<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("memberid") %></td>
    <td><%= rs.getString("email") %></td>
</tr>
<%
        }
    } catch(SQLException ex) {
        ex.printStackTrace();
    } catch(ClassNotFoundException ex) {
        ex.printStackTrace();
    } finally {
        //5. 자원 해제
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
</table>
</body>
</html>
