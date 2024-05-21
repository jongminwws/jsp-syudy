<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="login.MemberDAO" %>
<%@ page import="login.MemberVO" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");

MemberDAO md = new MemberDAO();
MemberVO mv = md.findID(name, email);

if (mv != null) {
    out.print(name + "님의 아이디는 " + mv.getId() + "입니다.");
} else {
    out.print("아이디가 존재하지 않습니다.");
}
%>
