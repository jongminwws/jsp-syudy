<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException, java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
    String memberid = request.getParameter("memberid");
    String name = request.getParameter("name");
    
    int updateCount = 0;
    
    Connection conn = null;
    Statement stmt = null;
    
    try {
        String url = "jdbc:mysql://localhost:3306/exx?serverTimezone=Asia/Seoul";
        String dbid = "root";
        String dbpw = "1234";
        
        String query = "update member set name = '"+name+"' where memberid = '"+memberid+"'";
        conn = DriverManager.getConnection(url, dbid, dbpw);
        stmt = conn.createStatement();
        updateCount = stmt.executeUpdate(query);
    	} finally {
        	if (stmt != null) try{ stmt.close(); } catch(SQLException ex) {}
        	if (conn != null) try{ conn.close(); } catch(SQLException ex) {}
    	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(updateCount > 0) { %>
<%= memberid %>의 이름을 <%= name %>으로 변경
<% } else { %>
<%= memberid %> 아이디가 존재하지 않음
<% } %>
</body>
</html>
