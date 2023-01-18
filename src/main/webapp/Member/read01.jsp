<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*, java.util.*" %>
<%@ include file = "conn_oracle.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<%
	String sql = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	int idx = Integer.parseInt(request.getParameter("idx")) ; 
	
	out.println(idx);
	
	if(true) return;

	sql = "select * from mbTbl where idx= " + idx  ;
	 
	stmt = conn.createStatement(); 
	rs = stmt.executeQuery(sql);
	
	
	if(rs.next()){


%>
<table>

<P>
<P align=center><FONT face=굴림 size=3><STRONG>회원 정보</STRONG></FONT></P> 
<P>
<tr align='center'>
	<td>회원번호</td>
	<td><%= rs.getString("idx") %></td>
</tr>
<tr align='center'>
	<td>아이디</td>
	<td><%= rs.getString("id") %></td>
</tr>
<tr align='center'>
	<td>비밀번호</td>
	<td><%= rs.getString("pass") %></td>
</tr>
<tr align='center'>
	<td>이름</td>
	<td><%= rs.getString("name") %></td>
</tr>
<tr align='center'>
	<td>이메일</td>
	<td><%= rs.getString("email") %></td>
</tr>
<tr align='center'>
	<td>도시</td>
	<td><%= rs.getString("city") %></td>
</tr>
<tr align='center'>
	<td>전화번호</td>
	<td><%= rs.getString("phone") %></td>
</tr>


</table>

<%

}else{
	out.println("해당 레코드는 존재하지 않습니다. "); 
}



%>

</body>
</html>