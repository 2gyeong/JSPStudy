<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<% request.setCharacterEncoding("utf-8"); %>
<HTML>
<HEAD><TITLE>게시판(검색모드)</TITLE>
</HEAD>
<BODY>
<%@ include file = "conn_oracle.jsp" %>
<P>
<P align=center>
 <FONT color=#0000ff face=굴림 size=3>
 <STRONG>자유 게시판(검색모드)</STRONG>
 </FONT>
</P> 
<FORM method=post name=search action="freeboard_search.jsp"> <!-- 자기 자신을 출력 -->
 <TABLE border=0 width=95%>
  <TR>
   <TD align=left width=30% valign=bottom>
    [<A href="freeboard_list03.jsp">자유 게시판(일반모드)</A>]</TD>
   <TD align=right width=70% valign=bottom>
    <FONT size=2 face=굴림>
<!-- stype에 넘어오는 value 값에 따라서 다르게 출력 -->
    <SELECT name=stype >
    <OPTION value=1 >이름 </OPTION>
    <OPTION value=2 >제목 </OPTION>
    <OPTION value=3 >내용 </OPTION>
    <OPTION value=4 >이름+제목 </OPTION>
    <OPTION value=5 >이름+내용 </OPTION>
    <OPTION value=6 >제목+내용 </OPTION>
    <OPTION value=7 >이름+제목+내용 </OPTION>

<% 
      //jsp 코드 블락 : <option> 넘어오는 변수에 따라서 해당 내용을 출력
      String cond = null;	// SQL 쿼리를 담는 변수 : stype : 1
      int what = 1; // stype에 넘어오는 변수 int 형으로 변환해서 담는 변수
       		// 2 : 제목 , 3 : 내용, 4 : 이름 + 제목
       String val = null; // val : 에서 넘어오는 검색어를 담는 변수 
       
       what = Integer.parseInt(request.getParameter("stype")) ; // 옵션
       val = request.getParameter("sval"); // 검색어
       
         
       if(what == 1){
    		out.println("<OPTION value=1 selected >이름</OPTION>");
    		cond = "where name like '%" + val + "%' or subject like '%" + val + "%'";
       } else {
    	   out.println("<OPTION value=1 >이름</OPTION>");   
       }  
       if(what == 2){
    		out.println("<OPTION value=2 selected >제목</OPTION>");   
    		cond = "where name like '%" + val + "%' or subject like '%" + val + "%'";
       } else {
    	   out.println("<OPTION value=2 >제목</OPTION>");   
       }
       if(what == 3){
    		out.println("<OPTION value=3 selected >내용</OPTION>"); 
    		cond = "where name like '%" + val + "%' or subject like '%" + val + "%'";
       } else {
    	   out.println("<OPTION value=3 >내용</OPTION>");   
       }
       if(what == 4){
    		out.println("<OPTION value=4 selected >이름+제목</OPTION>");   
    		cond = "where name like '%" + val + "%' or subject like '%" + val + "%'";
       } else {
    	   out.println("<OPTION value=4 >이름+제목</OPTION>");   
       }
       if(what == 5){
    		out.println("<OPTION value=5 selected >이름+내용</OPTION>");   
    		cond = "where name like '%" + val + "%' or subject like '%" + val + "%'";
       } else {
    	   out.println("<OPTION value=5 >이름+내용</OPTION>");   
       }
       if(what == 6){
    		out.println("<OPTION value=6 selected >제목+내용</OPTION>");  
    		cond = "where name like '%" + val + "%' or subject like '%" + val + "%'";
       } else {
    	   out.println("<OPTION value=6 >제목+내용</OPTION>");   
       }
       if(what == 7){
    		out.println("<OPTION value=7 selected >이름+제목+내용</OPTION>");   
    		cond = "where name like '%" + val + "%' or subject like '%" + val + "%'";
    		cond += "or content like '%"+ val + "%'";
       } else {
    	   out.println("<OPTION value=7 >이름+제목+내용</OPTION>");   
       }

%>
     </SELECT>
	</FONT>
    <INPUT type=text name="sval" value="<%=request.getParameter("sval")%>"> <!-- sval : 검색어를 넣는 변수 -->
    <INPUT type=submit value="검색">
   </TD>
  </TR>
 </TABLE>
</FORM>
<CENTER>

<% 
/* out.println(what+ "<p/>");
out.println(val + "<p/>");

if (true) return;  */
%>

<TABLE border=0 width=600 cellpadding=4 cellspacing=0>
 <tr align="center"> 
  <td colspan="5" height="1" bgcolor="#1F4F8F"></td>
 </tr>
 <tr align="center" bgcolor="#87E8FF"> 
  <td width="42" bgcolor="#DFEDFF"><font size="2">번호</font></td>
  <td width="340" bgcolor="#DFEDFF"><font size="2">제목</font></td>
  <td width="84" bgcolor="#DFEDFF"><font size="2">등록자</font></td>
  <td width="78" bgcolor="#DFEDFF"><font size="2">날짜</font></td>
  <td width="49" bgcolor="#DFEDFF"><font size="2">조회</font></td>
 </tr>
 <tr align="center"> 
  <td colspan="5" bgcolor="#1F4F8F" height="1"></td>
 </tr>
 
 <% // 검색된 내용을 출력하는 블락
 	
 String sql = null;
 Statement stmt = null;
 ResultSet rs = null;
 
 //cond : option에 선택자에 따라서 다른 쿼리가 변수로 들어옴
 sql = "select * from freeboard " + cond ;
 sql += " order by id desc";
 // 공백 중요
 
 
 /* 출력되는 sql 내용 */
  out.println (sql);
/*  if(true) return;  */
 
 
 stmt = conn.createStatement();
 rs = stmt.executeQuery(sql); 
 
 
 if(!(rs.next())){
	 out.println("해당 내용이 DB에 존재하지 않습니다.");
 } else { // 검색된 내용이 존재한다면

 
	 do {

 
 %>
<!--  tr를 db에서 가져와서 루프 돌리면서 출력 -->


 <tr align="center" bgcolor="#87E8FF"> 
  <td width="42" bgcolor="#DFEDFF"><font size="2"><%= rs.getInt("id") %></font></td>
  <td width="340" bgcolor="#DFEDFF"><font size="2"><%= rs.getString("subject") %></font></td>
  <td width="84" bgcolor="#DFEDFF"><font size="2"><%= rs.getString("name") %></font></td>
  <td width="78" bgcolor="#DFEDFF"><font size="2"><%= rs.getString("inputdate").substring(0,8) %></font></td>
  <td width="49" bgcolor="#DFEDFF"><font size="2"><%= rs.getString("readcount") %></font></td>
 </tr>
 


<% 
	 }
	while (rs.next());
	 

}
%>

 </TABLE>
 
  <!--  페이징 출력 부분 : [처음][이전] 1 2 3 4 5 [다음][마지막] -->
 
 <%
	Vector name = new Vector(); 	
	Vector inputdate = new Vector(); 
	Vector email = new Vector();
	Vector subject = new Vector();
	Vector readcount = new Vector();
	Vector step = new Vector();
	Vector keyid = new Vector();	//name 컬럼의 모든값을 저장하는 vector 
	// 페이징을 처리할 변수 선언  <<<시작>>> 
	
	int where = 1; 			//현재 위치한 페이징 변수 
	
	//  where = Integer.parseInt(request.getParameter("where"));  
		
	int totalgroup = 0 ; 		//출력할 페이징의 총 그룹수  
	int maxpages = 5; 			//하단의 페이지 출력 부분에서 출력할 최대 페이지 갯수 
	int startpage = 1; 
	int endpage = startpage + maxpages -1 ; 
	int wheregroup = 1; 		//현재 위치한 페이징 그룹 
	
	//go  : get 방식으로 해당 페이지 번호로 이동 하도록 설정하는 변수 

	//gogroup  : get 방식으로 해당 페이지 그룹으로 이동 하도록 
 
	
	//go 변수 를 넘겨 받아서 wheregroup, startpage, endpage 정보를 알아낼 수 있다. 
		//코드 블락
	if (request.getParameter("go") != null ){   
		where = Integer.parseInt(request.getParameter("go"));  
		wheregroup = (where - 1) / maxpages + 1 ;  //현재 내가 속한 그룹을 알수 있다.
		startpage = (wheregroup - 1) * maxpages +1 ; 
		endpage = startpage + maxpages -1 ; 
	
		
	//gogroup 변수를 넘겨 받아서 startpage, endpage, where 의 정보를 알아낼 수 있다. 
		//코드 블락 
	}else if (request.getParameter("gogroup") != null){  
		wheregroup = Integer.parseInt(request.getParameter("gogroup"));  //현재내가 위치한 그룹
		startpage = (wheregroup - 1) * maxpages +1 ; 
		where = startpage; 
		endpage = startpage + maxpages -1;  
	}
	
	int nextgroup = wheregroup +1 ; 
	int priorgroup = wheregroup -1 ; 
	
	int nextpage = where + 1 ;    // where : 현재 내가 위치한 페이지
	int priorpage = where -1 ; 
	int startrow = 0; 			//하나의 page에서 레코드 시작 번호 
	int endrow = 0; 			//하나의 page에서 레코드 마지막 번호 
	int maxrow = 5; 			//한페이지 내에 출력할 행의 갯수 (row, 행,레코드 갯수)
	int totalrows = 0; 			// DB에서 select 한 총 레코드 갯수 
	int totalpages = 0 ; 		// 총 페이지 갯수 
	
	// <<<페이징 처리할 변수 선언 끝>>>
	
	//페이징 출력 부분
	//  [처음][이전]
	if (wheregroup > 1){ 	//현재 나의 그룹이 1 이상일때 처음
		out.println ("[<a href='freeboard_search.jsp?gogroup=1");
		out.println ("&stype="+ what+"&sval=" + val + ">처음</a>");
		out.println ("[<a href='freeboard_search.jsp?gogroup="+priorgroup);
		out.println ("&stype="+ what+"&sval=" + val + ">이전</a>");
	}else {			// 현재 나의 페이지 그룹이 1일때는 
		out.println ("[처음]"); 
		out.println ("[이전]"); 
	}

	//페이징 갯수를 출력 : 1 2 3 4 5 
	
	if (name.size() != 0 ) {		//name.size() : 총 레코드의 갯수 가 0이 아니라면  
		for ( int jj = startpage; jj <= endpage ; jj++){
			if (jj == where) {		//jj 가 자신의 페이지 번호라면 링크 없이 출력
				out.println ("["+jj+"]"); 
			}else {		//jj가 현재 자신의 페이지 번호가 아니라면 링크를 걸어서 출력
				out.println ("[<a href=guestlab_list.jsp?go="+ jj);
				out.println ("&stype=" + what + "&sval=" +jj+ "</a>]");
			}
		}
	}
	
	// [다음][마지막]
	if (wheregroup < totalgroup ) {  //링크를 처리
		out.println ("[<A href=freeboard_search.jsp?gogroup="+ nextgroup);
		out.println ("&stype="+ what+"&sval=" + val+">다음</a>");
		out.println ("[<A href=freeboard_search.jsp?gogroup="+ totalgroup);
		out.println ("&stype="+ what+"&sval=" + val+">마지막</a>");
	}else {  // 마지막 페이지에 왔을때 링크를 해지 
		out.println ("[다음]"); 
		out.println ("[마지막]"); 
	}
	
	out.println("전체 글수 : " + totalrows); 
	
	%>
 
</BODY>
</HTML>