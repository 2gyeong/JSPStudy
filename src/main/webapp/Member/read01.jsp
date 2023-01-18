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
<style>
body{
	margin-top : 150px;
}
 .t1 {
 	border : 1px solid black;
 	border-collapse: collapse;
 	padding:2%;
 }
 .t1 tr {
 	border : 1px solid black;
 	border-collapse: collapse;
 	padding:2%;
 }
 .t1 td {
 	border : 1px solid black;
 	border-collapse: collapse;
 	padding:2%;
 }
 
 

</style>
</head>
<body>
<%
	String sql = null; 
	Statement stmt = null; 
	PreparedStatement pstmt = null; 	
	ResultSet rs = null; 
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	sql = "select * from mbTbl where idx= " + idx  ; 
	stmt = conn.createStatement(); 
	rs = stmt.executeQuery(sql);

	
	
	if(rs.next()){


%>
<center>
<table class="t1">

<P>
<P align=center>
<FONT face=굴림 size=3 color='blue'><STRONG><%= rs.getString("name") %></STRONG></FONT>
<FONT face=굴림 size=3><STRONG>의 회원 정보</STRONG></FONT></P> 
<P>
<tr align='center'>
	<td width=100>회원번호</td>
	<td width=200 align='left' ><%= rs.getString("idx") %></td>
</tr>
<tr align='center'>
	<td>아이디</td>
	<td align='left'><%= rs.getString("id") %></td>
</tr>
<tr align='center'>
	<td>비밀번호</td>
	<td align='left'><%= rs.getString("pass") %></td>
</tr>
<tr align='center'>
	<td>이름</td>
	<td align='left'><%= rs.getString("name") %></td>
</tr>
<tr align='center'>
	<td>이메일</td>
	<td align='left'><%= rs.getString("email") %></td>
</tr>
<tr align='center'>
	<td>도시</td>
	<td align='left'><%= rs.getString("city") %></td>
</tr>
<tr align='center'>
	<td>전화번호</td>
	<td align='left'><%= rs.getString("phone") %></td>
</tr>
</table>
<%

}else{
	out.println("해당 레코드는 존재하지 않습니다. "); 
}


%>

<table width="200" border="0" cellpadding="0" cellspacing="5">
	<tr> 
		<td align="right"  ><A href="list01.jsp? go=<%= request.getParameter("page")%>"><img src="image/list.jpg" border=0></a></td>
		<td align="right"  ><A href="update01.jsp?id=<% request.getParameter("idx"); %>&page=<% request.getParameter("page"); %>"></A> <img src="image/reply.jpg" border=0></A></td>
		<td align="right" ><A href="update01.jsp?<id=<%= idx %>&page=1"><img src="image/edit.jpg" border=0></A></td>
		<td align="right" ><A href="delete01.jsp?<id=<%= idx %>&page=1"><img src="image/del.jpg"  border=0></A></td>
	</tr>
</table>


</center>
</body>
</html>