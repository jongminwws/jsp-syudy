<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sh.USER.UserMgr" %>
<%@ page import="sh.USER.UserDTO" %>

<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String email = request.getParameter("email");

    UserMgr um = new UserMgr();
    String user_id = um.id_search2(name, email); // 이름과 이메일로 아이디 찾기

    if (user_id != null) {
        out.println(user_id); // 아이디가 있으면 해당 아이디 출력
    } else {
        out.println("아이디를 찾을 수 없습니다."); // 아이디가 없으면 메시지 출력
    }
%>
