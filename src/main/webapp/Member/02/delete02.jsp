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
<SCRIPT language = "javascript"> 
	function check () {
		with(document.wwdel){
			if ( pass.value.length==0){
				alert ("비밀번호를 입력해 주세요!!"); 
				pass.focus();
				return false; 
			}
			document.wwdel.submit();
		}	
	}
</SCRIPT>
<title>회원정보 삭제 페이지</title>
</head>
<body>
<P>
<P align=center>
<FONT face=굴림 size=3><STRONG>회원 정보를 삭제하겠습니까?</STRONG></FONT></P> 
<P>
	<form name="wwdel" method = "post" action = "delete02_db.jsp">
	<input type="hidden" name = "idx" value = "<%= request.getParameter("idx") %>"> 
   	<input type="hidden" name = "page" value = "<%= request.getParameter("page") %>">
	
	<table>
		<tr>
			<td>비밀번호</td>
			<td><input type = "password" name = "pass"> </td>
		</tr>
	
	</table>
	
	<table>
	<tr>
	<td width = "8%"> 
		<a href = "list02.jsp?go=<%= request.getParameter("page") %>" > 
			<img src = "image/list.jpg" width="48" height="19" border="0">
		</a>
	</td>
	<td><a href = "#" onClick= "check(this.form)"  >
				<img src = "image/del.jpg" width="46" height="19" border = "0" ></a></td>
	
	</tr>
	
	</table>

	</form>

</body>
</html>

