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
<title>Insert title here</title>
</head>
<body>

[ <a href= "list02.jsp?go=<%= request.getParameter("page") %>"> 
	회원 목록 으로이동  </a>]
	
<%
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int page1 = Integer.parseInt(request.getParameter("page"));
	String pw = request.getParameter("pass");
	
	try {
		sql = "select * from mbTbl where idx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		rs = pstmt.executeQuery();
		
		out.println("회원정보가 삭제되었습니다.");
		
		if (!(rs.next())){	// rs의 값이 없을 때
			out.println("해당 값이 존재하지 않습니다.");
		
		} else { // rs의 값이 존재할 때 비밀번호 일치하는 지 확인.
			String pwd = rs.getString("pass");
				
				if(pwd.equals(pw)){
					sql = "delete mbTbl where idx=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, idx);
					pstmt.executeUpdate();
				} else{
					out.println("패스워드가 다릅니다.");
				}
		}
	} catch(Exception e){
		out.println("DB오류로 인해서 삭제를 실패했습니다.");
		e.printStackTrace();
		
	} finally{
		if( conn != null){conn.close();}
		if( pstmt != null){pstmt.close();}
		if( rs != null){rs.close();}
		
	}



%>

</body>
</html>