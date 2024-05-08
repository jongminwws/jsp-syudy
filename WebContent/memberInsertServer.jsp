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
		
		//1. dbms드라이브 로딩
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//int 		a   = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		// java언어를 통해서 db 연결
		// url 주소(dbms 마다 다름) 
		try{
			String url = "jdbc:mysql://localhost:3306/exo?serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=UTF-8";
		//아이디
		String dbid = "root";
		//패스워드
		String dbpw = "1234";
		
		//db 커넥션
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		
		//sql문장 작성
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
		
		//db 커넥션과 sql문장을 실행하는 PreparedStatement두 클래스를 연결
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, id);//첫번째 물음표에는 사용자가 입력한 실제 id값을 대입
		pstmt.setString(2, paswword);//두번째 물음표에는 사용자가 입력한 실제 password값을 대입
		pstmt.setString(3, email);//세번째 물음표에는 사용자가 입력한 실제 email값을 대입
		pstmt.setString(4, name);//네번째 물음표에는 사용자가 입력한 실제 name값을 대입
		pstmt.setString(5, birth);//다섯번째 물음표에는 사용자가 입력한 실제 birth값을 대입
		pstmt.setString(6, phonekine);//여섯번째 물음표에는 사용자가 입력한 실제 phonkine값을 대입
		pstmt.setString(7, gender);//일곱번째 물음표에는 사용자가 입력한 실제 gender값을 대입
		pstmt.setString(8, local);//여덟번째 물음표에는 사용자가 입력한 실제 local값을 대입
		pstmt.setString(9, phoneno);//아홉번째 물음표에는 사용자가 입력한 실제 phoneno값을 대입
		
		// 위에서 작성한 sql 문장을 실행(crtl + enter)
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