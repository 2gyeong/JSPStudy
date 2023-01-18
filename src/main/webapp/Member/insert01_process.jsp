<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*, java.util.*" %>
<%@ include file = "conn_oracle.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int idx = 1;
	String id = request.getParameter("id");
	String pa = request.getParameter("pass");
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String ci = request.getParameter("city");
	String ph = request.getParameter("phone");
	

	String sql = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		stmt = conn.createStatement();
		sql = "select max(idx) from mbTbl";
		
		rs = stmt.executeQuery(sql);
		
		if(!(rs.next())){
			idx = 1;
		} else {
			idx = rs.getInt(1)+1; 
		}
		
		sql = "insert into mbTbl(idx, id, pass, name, email, city, phone) ";
		sql += "values ('"+ idx +"','"+ id +"','"+ pa + "','"+ na +"','"+ em + "',";
		sql += " '" + ci +"','" + ph +"')";
		
		stmt.executeUpdate(sql);
		
	} catch( Exception e) {
		out.print("오류 발생");
		
	} finally {
		if (conn!= null) conn.close();
		if (stmt != null) stmt.close();
		if (rs != null) rs.close();
	}
	
	response.sendRedirect("list01.jsp");

%>

