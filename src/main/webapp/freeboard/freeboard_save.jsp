<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--  필요한 라이브러리 import -->
    <%@ page import = "java.sql.*, java.util.*" %>
    <!-- DB include -->
    <%@ include file = "conn_oracle.jsp" %>
    <!--  form에서 넘어오는 값의 한글 처리-->
    <% request.setCharacterEncoding("UTF-8"); %>
    
    <!-- form에서 넘어오는 데이터는 모두 String 으로 넘어온다.
    	Integer.parseInt()
     -->
     <!--  form에서 넘어오는 변수의 값을 받아서 새로운 변수에 할당 -->
     <%
     	String na = request.getParameter("name");
     	String em = request.getParameter("email");
     	String sub = request.getParameter("subject");
     	String cont = request.getParameter("content");
     	String pw = request.getParameter("password");
     	
     	int id = 1;		// id에 처음 값을 할당할 때 기본값으로 1을 할당
     					// 다음부터는 테이블의 id 컬럼에서 max값을 가져와서 +1해서 처리
     					
		// 날짜 처리
		java.util.Date yymmdd = new java.util.Date();
      	
     	SimpleDateFormat myformat = new SimpleDateFormat("yy-mm-d h:m:a");
     	//out.println(yymmdd); //Thu Jan 12 11:18:11 KST 2023
     	String ymd = myformat.format(yymmdd);
     	//out.println(ymd); //23-18-12 11:18:오전
     	
     	//DB에 값을 처리할 변수 선언 : Connection <== iclude
     	String sql = null;
     	Statement stmt = null;
     	ResultSet rs = null;		//id 컬럼의 최대값을 select
     	
     	try {
     	// connection 객체 생성
     	stmt = conn.createStatement();
     	sql="select max(id) from freeboard";	//id : Primary Key
     	
     	rs = stmt.executeQuery(sql);

     	// 테이블의 id 컬럼의 값을 적용 : 최대값을 가져와서 +1
     	if (!(rs.next())){	//테이블의 값이 존재하지 않는 경우
     		id =1;

     	}else{  //테이블의 값이 존재하는 경우
     		
         	//	id = rs.getString("id");
     		id = rs.getInt(1)+1;
     	}
     	
     	// Statement 객체는 변수값을 처리하는 것이 복잡하다. PreparedStatement를 사용한다.
     	// 폼에서 넘겨받은 값을 DB에 insert하는 쿼리 (주의 : masterid : id컬럼에 들어오는 값으로 처리해야 함)
     	sql="insert into freeboard (id, name, password, email, subject, content, inputdate, masterid, readcount, replaynum, step)";
     	sql = sql + " values ('" + id + "', '" + na + "' , '" + pw + "', '" + em + "' , '" + sub + "' , '" +  cont + "' ,  ";
     	sql = sql + " '" + ymd + "' , '"+ id +"', " + "  0 , 0, 0 )";
     	
     	//out.println(sql);
     	//if(true) return;	// 프로그램을 중지 시킴. 디버깅할때 사용함
     	
     	stmt.executeUpdate(sql); // DB 저장완료, commit을 자동으로 처리
     	
     	// try catch블락으로 프로그램이 종료되지 않도록 처리 후 객체 제거
     	} catch (Exception e){
     		out.println("예상치 못한 오류가 발생되었습니다. <p/>");
     		out.println("고객 센처 : 02 - 1111 - 1111 <p/>");
     		
     	} finally {
     		if( conn != null) conn.close();
     		if( stmt != null) stmt.close();
     		if(rs != null ) rs.close();
     	}

     %>
     
     <!-- 
     	페이지 이동 : 
     		respons.sendRedirect : 클라이언트에서 페이지를 재요청
     		forward : 서버에서 페이지를 이동
     		
     		
        -->
    
	<% // response.sendRedirect("freeboard_list.jsp"); %>
    <jsp:forward page = "freeboard_list.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>