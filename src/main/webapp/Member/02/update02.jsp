<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" import="java.sql.*" %>
<%@ include file ="conn_oracle.jsp" %>

<%  
	String sql = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String p = request.getParameter("page");
	
/* 	out.println(idx);
	if(true) return; */
	
	
	
	
	try{
		sql = "select * from mbTbl where idx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		rs = pstmt.executeQuery();
		
		if (!(rs.next())){
			
			out.println("해당 내용이 DataBase에 존재하지 않습니다.");
		} else {
			



%>
<!DOCTYPE html>
<html>
<head>
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
 	border-collapse:collapse;
 	padding:2%;
 }
 
 

</style>
<script language="javascript">
function check(){                                         
    with(document.wwrite){                      
     if(id.value.length == 0){                  
      alert("아이디를 입력해 주세요!!");                       
      id.focus();                           
      return false;                             
     }                                         
     if(pass.value.length == 0){                   
      alert("비밀번호를 입력해 주세요!!");                  
      pass.focus();                              
      return false;                                  
     }                                         
     if(name.value.length == 0){              
      alert("이름을 입력해 주세요!!");              
      name.focus();                            
      return false;                               
     }                                        
     if(email.value.length == 0){                    
      alert("이메일을 입력해주세요!!");                   
      email.focus();                         
      return false;                           
     }       
     if(city.value.length == 0){                    
       alert("도시를 입력해주세요!!");                   
       city.focus();                         
       return false;                           
      }    
     if(phone.value.length == 0){                    
       alert("전화번호를 입력해주세요!!");                   
       phone.focus();                         
       return false;                           
      }   
     document.wwrite.submit();                       
    }                                          
   }                   
</script>

<meta charset="UTF-8">
<title>Update 를 통한 데이터 수정 </title>

</style>


</head>
<body>
<center>
	<form name="wwrite" method = "post" action = "update02_db.jsp">
		<input type="hidden" name = "idx" value = "<%= idx %>">
		<input type="hidden" name = "page" value = "<%= p %>">
	<table class='t1'>
	<tr><td>아 이 디 </td>
		<td><input type = "text" name = "id" value="<%= rs.getString("id") %>"></td>
	</tr>

		<tr><td>이  름 </td>
		<td><input type = "text" name = "name" value="<%= rs.getString("name") %>"> </td>
	</tr>
		<tr><td>이 메 일  </td>
		<td><input type = "text" name = "email" value="<%= rs.getString("email") %>"></td>
	</tr>
		<tr><td>도  시 </td>
		<td><input type = "text" name = "city" value="<%= rs.getString("city") %>"></td>
	</tr>
		<tr><td>전화번호</td>
		<td><input type = "text" name = "phone" value="<%= rs.getString("phone") %>"></td>
	</tr>
		</tr>
		<tr><td width=100>비밀번호</td>
		<td width=300><input type = "password" name = "pass"><br>(비밀번호가 일치해야 수정이 됩니다.)</td>
	</tr>
	<table>
	<td ><a href="#" onClick="check();"><img src="image/ok.gif" border="0"></a></td>
     <td ><a href="#" onClick="history.go(-1)"><img src="image/cancle.gif"  border="0"></td>
     <td ><A href="list02.jsp?go=<%= request.getParameter("page")%>"><img src="image/list.jpg" border=0></a></td>
	</tr>
	</table>
	</table>
	</form>
	
	<%
	
	
} // if문 End

} catch(Exception e){
	e.printStackTrace();
} finally {
	if (conn != null) conn.close();
	if (stmt != null) stmt.close();
	if(pstmt != null) pstmt.close();
	if (rs != null) rs.close();
	
}
	
	%>
</center>
</body>
</html>