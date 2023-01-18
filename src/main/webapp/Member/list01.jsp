<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*, java.util.*" %>
<%@ include file = "conn_oracle.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UT-8">
<title>DB의 내용을 가져와서 출력 하기 </title>
</head>
<body>
	<center>
<P>
<P align=center><FONT face=굴림 size=3><STRONG>회원정보 리스트</STRONG></FONT></P> 
<P>
<table width = "800" border="1" cellpadding=4 cellspacing=0> 
	<tr align="center"> 
		<th width="42" bgcolor="#DFEDFF"> No. </th> 
		<th width="200" bgcolor="#DFEDFF"> 아이디 </th> 
		<th width="200" bgcolor="#DFEDFF"> 비밀번호 </th> 
		<th width="150" bgcolor="#DFEDFF"> 이름 </th> 
		<th width="350" bgcolor="#DFEDFF"> email</th> 
		<th width="100" bgcolor="#DFEDFF"> city</th>
		<th width="350" bgcolor="#DFEDFF"> phone</th>  
	</tr>
  	
  	<%
  		String sql = null;
  		Statement stmt = null;
  		ResultSet rs = null;
  		
  		sql = "select * from mbTbl order by id desc";
  		stmt = conn.createStatement();
  		rs = stmt.executeQuery(sql);
  		
  		if(rs.next()){
  			do{
  				 	
  	%>			
			<tr> 
				<td> <%= rs.getInt("idx") %> </td> 
				<td> <a href="read01.jsp?id=<%= rs.getString("idx") %>"> <%= rs.getString("id") %></a></td>
				<td> <%= rs.getString("pass") %> </td> 
				<td> <%= rs.getString("name") %> </td> 
				<td> <%= rs.getString("email") %> </td> 
				<td> <%= rs.getString("city") %> </td> 
				<td> <%= rs.getString("phone") %> </td> 
				 
			</tr>			
			
			<%	
  			} while (rs.next());
  			
  		} else {
  			out.println("DB에 값이 존재하지 않습니다.");
  		}
  		
	
		%>

</table>
</center> 
</body>
</html>