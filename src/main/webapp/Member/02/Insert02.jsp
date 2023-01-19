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
</head>
<body>
	<form name="wwrite" method = "post" action = "save02.jsp"> 
	<table>
	<P>
	<P >
	<FONT face=굴림 size=3><STRONG>회원 가입</STRONG></FONT></P> 
	<P>
	<tr><td>아 이 디 </td>
		<td><input type = "text" name = "id"></td>
	</tr>
	<tr><td>패스워드 </td>
		<td><input type = "password" name = "pass"> </td>
	</tr>
		<tr><td>이  름 </td>
		<td><input type = "text" name = "name"> </td>
	</tr>
		<tr><td>이 메 일  </td>
		<td><input type = "text" name = "email"></td>
	</tr>
		<tr><td>도  시 </td>
		<td><input type = "text" name = "city"></td>
	</tr>
		<tr><td>전화번호</td>
		<td><input type = "text" name = "phone"></td>
	</tr>	
	<td colspan='2' align='right'>
	<a href="#" onClick="history.go(-1)"><img src="image/cancle.gif">
	<a href="#" onClick="check();"><img src="image/ok.gif"></a></td>
	</tr>
	</table>
	</form>

</body>
</html>

