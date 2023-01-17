<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    
        <!--  
    	java.sql.* 패키지 하위의 모든 클래스를 import 
   		Connection 객체	: DataBase(Oracle, MSSQL, MySQL....)
   		Statement 객체	: CRUD 를 사용 해서 Insert, UPDATE, Delete,
   		PreparedStatement 객체 : Statement 객체의 업그레이드 버젼, 성능개선, 구문이 간략
   		ResultSet 객체 : DB에서 Select한 결과를 저장하는 객체
    -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSSQL DB Connection</title>
</head>
<body>
<%
	// 변수 초기화
	Connection conn = null;
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;databaseName=myDB;encrypt=false";
	//jdk11을 지원하는 mssql 드라이버 버전(10.2이상)부터 기본적으로 암호화를 사용하도록 변경됨.
	Boolean connect = false;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"sa","1234");
		connect = true;
		conn.close();
	}catch(Exception e){
		connect = false;
		e.printStackTrace();
	}

	if(connect == true){
		out.println("MSSQL DB 연결이 잘 되었습니다.");
	} else {
		out.println("MSSQL DB 연결이 실패했습니다.");
	}


%>

</body>
</html>