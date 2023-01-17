<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 변수 초기화
	Connection conn = null;
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mydb";
	Boolean connect = false;

	try{
		Class.forName(driver);	//오라클 드라이버를 로드함
		conn = DriverManager.getConnection (url, "root", "1234");
	
		connect = true;
		conn.close();
	}catch (Exception e) {
		connect=false;
		e.printStackTrace();
	}
	
	if(connect == true) {
		out.println ("MySQL DB에 잘 연결 되었습니다");
	}else {
		out.println("MySQL DB에 연결을 실패 했습니다.");
	}
%>
</body>
</html>