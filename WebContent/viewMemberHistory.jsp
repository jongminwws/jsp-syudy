<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.Reader"%> 
    <%@ page import="java.io.IOException" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 히스토리</title>
</head>
<body>
    <%
    String memberid = request.getParameter("memberid");
%>
    <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String history = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/exx?serverTimezone=Asia/Seoul";
        String dbid = "root";
        String dbpw = "1234";
        conn = DriverManager.getConnection(url, dbid, dbpw);

        String query = "select * from member_History where memberid = '" + memberid + "'";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);
        if(rs.next()) {
        
%>
    <table border="1">
        <tr>
            <td>아이디</td>
            <td><%= memberid %></td>
        </tr>
        <tr>
            <td>히스토리</td>
            <td>
                <%
                Reader reader = null;
                try {
                    reader = rs.getCharacterStream("History");
                    if(reader != null) {
                        StringBuilder buff = new StringBuilder();
                        char[] ch = new char[512];
                        int len = -1;
                        while ((len = reader.read(ch)) != -1 ) {
                            buff.append(ch,0,len);
                        }
                        history = buff.toString();
                    }
                } catch(IOException ex) {
                    out.println("익셉션 발생:" + ex.getMessage());
                } finally {
                    if (reader != null) try { reader.close(); } catch(IOException ex) {}
                }
                %> <%= history %>
            </td>
        </tr>
    </table>
    <%
        } else {
%>
    <%= memberid %> 회원의 히스토리가 없습니다.
    <%
        }
    } catch (SQLException ex) {
%>
    에러 발생:
    <%= ex.getMessage() %>
    <%
    } catch (ClassNotFoundException ex) {
%>
    에러 발생: 드라이버를 찾을 수 없습니다.
    <%
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
</body>
</html>
