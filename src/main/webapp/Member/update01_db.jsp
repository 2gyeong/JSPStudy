<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*" %>
<%@ include file = "conn_oracle.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String p = request.getParameter("page");
	
	
	String id = request.getParameter("id");
	String pa = request.getParameter("pass");
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String ci = request.getParameter("city");
	String ph = request.getParameter("phone");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

[<A href = "list01.jsp?page=<%= page %>">게시판 목록으로</A>]
<%
	String sql = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	
	
	sql = "select*from mbTbl where idx = " + idx ;
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql); 
	
	try{
		if(!(rs.next())){
			out.println("DB에 해당 내용이 존재하지 않습니다.");
			
		}else {
			String pw = rs.getString("pass");
			// pw : DB에서 넘겨받은 pass
			// pa : form에서 넘겨받은 pass
			
			if(pw.equals(pa)){
				sql = "update mbtbl set id '"+ id +"', '" + pa+"', ";
				sql += "'"+na+"','"+em+"','"+ci+"','"+ph+"') ";
	
				out.println("<p/> 내용이 잘 수정되었습니다.");
			} else {
				
				out.println("패스워드가 일치하지 않습니다.");
			}
		}
		
	} catch(Exception e) {
		out.println("DB 저장 시 오류가 발생되었습니다.");
		e.printStackTrace();
		
	} finally {
		if(conn != null) conn.close();
		if (stmt != null) stmt.close();
		if (rs != null) rs.close();
	}


%>

</body>
</html>