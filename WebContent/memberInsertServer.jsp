<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String paswword = request.getParameter("password");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phonekine = request.getParameter("phonekine");
		String gender = request.getParameter("gender");
		String local = request.getParameter("local");
		String phoneno = request.getParameter("phoneno");
		
		//1. dbms����̺� �ε�
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//int 		a   = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		// java�� ���ؼ� db ����
		// url �ּ�(dbms ���� �ٸ�) 
		try{
			String url = "jdbc:mysql://localhost:3306/exo?serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=UTF-8";
		//���̵�
		String dbid = "root";
		//�н�����
		String dbpw = "1234";
		
		//db Ŀ�ؼ�
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		
		//sql���� �ۼ�
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
		
		//db Ŀ�ؼǰ� sql������ �����ϴ� PreparedStatement�� Ŭ������ ����
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, id);//ù��° ����ǥ���� ����ڰ� �Է��� ���� id���� ����
		pstmt.setString(2, paswword);//�ι�° ����ǥ���� ����ڰ� �Է��� ���� password���� ����
		pstmt.setString(3, email);//����° ����ǥ���� ����ڰ� �Է��� ���� email���� ����
		pstmt.setString(4, name);//�׹�° ����ǥ���� ����ڰ� �Է��� ���� name���� ����
		pstmt.setString(5, birth);//�ټ���° ����ǥ���� ����ڰ� �Է��� ���� birth���� ����
		pstmt.setString(6, phonekine);//������° ����ǥ���� ����ڰ� �Է��� ���� phonkine���� ����
		pstmt.setString(7, gender);//�ϰ���° ����ǥ���� ����ڰ� �Է��� ���� gender���� ����
		pstmt.setString(8, local);//������° ����ǥ���� ����ڰ� �Է��� ���� local���� ����
		pstmt.setString(9, phoneno);//��ȩ��° ����ǥ���� ����ڰ� �Է��� ���� phoneno���� ����
		
		// ������ �ۼ��� sql ������ ����(crtl + enter)
		pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			pstmt.close();
			conn.close();
		}
	%> 
</body>
</html>