<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  필요한 라이브러리 Import -->
<%@ page import = "java.sql.*,java.util.*,java.text.*" %>
<!-- DB include -->
<%@ include file ="conn_oracle.jsp" %>
<!-- form 에서 넘어오는 값의 한글 처리  -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// Form에서 넘겨주는 변수를 받아서 새로운 변수에 담기  
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	String pw = request.getParameter("password");
	
	int mid =  Integer.parseInt(request.getParameter("mid")) ;
		// ㄴ DB : masterid -> 동일글(글과 답글)의 그룹핑 
				// 처음글, 답변글 일 때 , 동일한 
	int rnum =  Integer.parseInt(request.getParameter("rnum"));
		// ㄴ DB : replaynum
	int step =  Integer.parseInt(request.getParameter("step"));		// 답변의 깊이를 나타내는 컬럼 step
		// ㄴ DB : step : 글의 깊이를 처리하는 컬럼
			// 처음글 : 0, 답변글 : 1, 답변글의 답변 : 2
			// 답변 글에 대한 순번 : 0, 1, 2
		
	// 날짜를 한국 포맷에 맞도록 변환해서 저장함.
	java.util.Date yymmdd = new java.util.Date(); // 날짜 객체 생성
	SimpleDateFormat myformat = new SimpleDateFormat("yy-mm-dd h:m:a");	// format 바꿈.
	String ymd = myformat.format(yymmdd);
	
	int id = 0;		// DB의 ID 컬럼의 최대값을 가져와서 + 1해서 저장함.

/* 	// form에서 넘어온 변수가 잘 들어오는 지 출력 test
	out.println(na + "<p/>");
	out.println(em+ "<p/>");
	out.println(sub+ "<p/>");
	out.println(cont+ "<p/>");
	out.println(pw+ "<p/>");
	
	out.println(mid + "<p/>");
	out.println(rnum + "<p/>");
	out.println(step + "<p/>");
	out.println(ymd + "<p/>");
	
	
	if(true) return; */
	
	// DB에 저장할 쿼리 
	
	String sql = null;
	Statement stmt =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 글을 넣기 위해서 DB의 ID 값의 MAX 값을 가져온 후 +1으로 처리
	
	sql = "select max(id) from freeboard";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	if(! (rs.next())){			// 테이블에 저장된 레코드가 없다. (처음글 작성)
		id = 1;
		out.println("해당 내용이 없습니다.");
	} else {  // 레코드가 존재할 때 (최대값을 가지고 옴)
		id = rs.getInt(1) + 1 ;
		
	}
	// out.println(id);
	
	
	// step
	// 답변 글이므로 step 값을 + 1
	//step : 글의 깊이를 처리하는 컬럼
		// 처음글 : 0, 답변글 : 1, 답변의 답변 : 2
	step += 1 ; //step = step + 1;

	if ( step == 1 ){
		sql = "select max(replaynum) from freeboard where masterid = " + mid;
		rs = stmt.executeQuery(sql); // sql 쿼리 담기
		
		if(!(rs.next())){		// rs의 값이 비어있을 때
			rnum = 1;
		} else {
			rnum = rs.getInt(1) + 1;
		}
	}
	
	// 모든 변수가 처리된 내용을 DB에 저장함.
	// !! 공백 처리 주의
	// statement 객체로 처리
	sql = "insert into freeboard (id, name, password, email, subject, ";
	sql += "content, inputdate, masterid, readcount, replaynum, step) ";
	sql += "values (" + id + ",'"+ na + "','" + pw + "','" + em ;
	sql += "','" + sub + "','" + cont + "','"+ ymd + "'," + mid ;
	sql += ",0,"+ rnum +","+ step+")";
	
//	out.println(sql);
	
	int result = 0 ;		//0 : insert 실패 , 1 : insert 성공
	result = stmt.executeUpdate(sql);
	
/* 	if(result >= 1){
		out.println("DB에 Insert가 되었습니다.");
	} else {
		out.println(" Insert 실패 ");
	}  */
	
	
	//PreparedStatement 처리
	// DB에 저장 후 freeboard_list03.jsp 페이지로 이동, go 변수에 page 번호를 넣어서 이동
	response.sendRedirect("freeboard_list03.jsp?go="+ request.getParameter("page"));

%>

</body>
</html>