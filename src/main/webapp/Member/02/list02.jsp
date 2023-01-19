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
		<th width="150" bgcolor="#DFEDFF"> 회원번호 </th> 
		<th width="150" bgcolor="#DFEDFF"> 아이디 </th> 
		<th width="150" bgcolor="#DFEDFF"> 비밀번호 </th> 
		<th width="150" bgcolor="#DFEDFF"> 이름 </th> 
		<th width="300" bgcolor="#DFEDFF"> email</th> 
		<th width="100" bgcolor="#DFEDFF"> city</th>
		<th width="350" bgcolor="#DFEDFF"> phone</th>  
	</tr>
  	
  	<%
  		// Vector 변수 선언
  		Vector id = new Vector();
  		Vector pass = new Vector();
  		Vector name = new Vector();
  		Vector email = new Vector();
  		Vector city = new Vector();
  		Vector phone = new Vector();
  		Vector step = new Vector();
  		Vector keyid = new Vector();
  		

	
  	// 페이징 처리 시작
  		
  		int where = 1 ; 

  		int totalgroup = 0 ; 		
  		int maxpages = 4; 			
  		int startpage = 1; 
  		int endpage = startpage + maxpages -1 ; 
  		int wheregroup = 1; 
  		
  		if(request.getParameter("go") != null ){
  			where = Integer.parseInt(request.getParameter("go"));
  			wheregroup = (where -1) / maxpages + 1;
  			startpage = (wheregroup -1) * maxpages + 1;
  			endpage = startpage + maxpages - 1;
  		} else if (request.getParameter("gogroup") != null ){
  			wheregroup = Integer.parseInt(request.getParameter("gogroup"));
  			startpage = (wheregroup -1) * maxpages + 1;
  			where = startpage;
  			endpage = startpage + maxpages -1;
  		}
  		
  		int nextgroup = wheregroup +1;
  		int priorgroup = wheregroup -1;
  		
  		int nextpage = where + 1;
  		int priorpage = where -1;
  		int startrow = 0;
  		int endrow = 0;
  		int maxrow = 5;
  		int totalrows = 0;
  		int totalpages = 0;
  		
  	// 페이징 변수 선언 끝
  	
  	int idx = 0 ; 	// DB의  id 컬럼의 값을 가져오는 변수 
		
	  	String sql = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		sql = "select * from mbTbl order by idx desc";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
  	
  	
  		if(!(rs.next())){
  			out.println("회원정보가 없습니다.");
  		} else{
  			
  			do{
  				keyid.addElement(new Integer(rs.getString("idx")));
  				id.addElement(rs.getString("id"));
  				pass.addElement(rs.getString("pass"));
  				name.addElement(rs.getString("name"));
  				email.addElement(rs.getString("email"));
  				city.addElement(rs.getString("city"));
  				phone.addElement(rs.getString("phone"));
  				
  			} while (rs.next());
  		}
  		
  		totalrows = id.size();
  		totalpages = (totalrows-1) / maxrow + 1;
  		startrow = (where -1) * maxrow;
  		endrow = startrow + maxrow -1 ;
  		
  		totalgroup = (totalpages -1) / maxpages + 1;
  		  	
  			//endrow 가 totalrows보다 크면 totalrows -1로 처리해야함.
		if ( endrow >= totalrows) {
			endrow = totalrows -1 ; 
		}
		if (endpage > totalpages){
			endpage = totalpages; 
		}
				
		
		for ( int j = startrow ; j <= endrow ; j++){
  	%>			
			<tr> 
				<td> <%= keyid.elementAt(j) %> </td> 
				<td> <a href="read02.jsp?idx=<%= keyid.elementAt(j)  %>&page=<%= where %>">
					<%= id.elementAt(j) %></a></td>
				<td> <%= pass.elementAt(j) %> </td> 
				<td> <%= name.elementAt(j) %> </td> 
				<td> <%= email.elementAt(j) %> </td> 
				<td> <%= city.elementAt(j) %> </td> 
				<td> <%= phone.elementAt(j) %> </td> 
				
			</tr>			
			
			<%					
  		}
  		%>
 <tr ><td colspan='7' align='right'><A href="Insert01.jsp"><img src="image/write.gif" border="0"></A></td></tr>
</table>	


<%
//[처음] [이전]
if (wheregroup > 1){
	out.println ("[<a href='list01.jsp?gogroup=1'>처음</a>]");
	out.println ("[<a href='list01.jsp?gogroup="+priorgroup +"'>이전</a>]");
} else {
	out.println("[처음]");
	out.println("[이전]");
	
}

if (id.size() != 0){
for(int jj = startpage; jj <= endpage; jj++){
	if(jj == where){
		out.println("["+jj+"]");
	} else {
		out.println ("[<a href=list01.jsp?go="+ jj + ">" +jj+ "</a>]");
	}
}
}

//[다음] [마지막]
if (wheregroup < totalgroup){
	out.println ("[<A href=list01.jsp?gogroup="+ nextgroup + ">다음</A>]"); 
	out.println ("[<A href=list01.jsp?gogroup="+ totalgroup + ">마지막]</A>"); 
} else {
	out.println("[다음]");
	out.println("[마지막]");
	
	
}

out.println("<p/> 총 회원 수 : "+totalrows);


%>


</center>
 
</body>
</html>