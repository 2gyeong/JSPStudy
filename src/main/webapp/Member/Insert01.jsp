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
</head>
<script language="javascript">
	function check(){
		with(document.wwrite){
			if(id.value.lenght == 0){
				alert("아이디를 입력해 주세요");
				id.focus();
				return false;
			}
			if(pass.value.lenght == 0){
				alert("비밀번호를 입력해 주세요");
				pass.focus();
				return false;
			}
			if(name.value.lenght == 0){
				alert("이름를 입력해 주세요");
				name.focus();
				return false;
			}
			if(email.value.lenght == 0){
				alert("이메일를 입력해 주세요");
				email.focus();
				return false;
			}
			if(city.value.lenght == 0){
				alert("도시를 입력해 주세요");
				city.focus();
				return false;
			}
			if(phone.value.lenght == 0){
				alert("전화번호를 입력해 주세요");
				phone.focus();
				return false;
			}
			document.wwrite.submit();        
		}
		
	}

</script>
<body>
	<form name="wwrite" method = "post" action = "insert01_process.jsp"> 
		<p> 아 이 디 : <input type = "text" name = "id">
		<p> 패스워드 : <input type = "password" name = "pass"> 
		<p> 이  름 : <input type = "text" name = "name"> 
		<p> 이 메 일 : <input type = "text" name = "email">
		<p> 도  시 : <input type = "text" name = "city">
		<p> 전화번호 : <input type = "text" name = "phone">
		<p><a href="#" onClick="check();"><input type = "submit" value = "전송"></a> 
	</form>

</body>
</html>

