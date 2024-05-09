<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id=request.getParameter("memberid");
    	String pass=request.getParameter("pass");
    	
    	//로그인 성공
    	if(id!=null && id.equals("madvirus")) {
    		response.sendRedirect("index.jsp");
    	}else { // 로그인 실패
    		response.sendRedirect("login.jsp");
    	}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>