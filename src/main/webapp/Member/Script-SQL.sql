/*회원 정보를 저장하는 테이블*/

create Table mbTbl(
	idx number not null, -- 행의 번호가 : 1씩 증가
	id varchar2(100) not null, -- 회원의 ID
	pass varchar2(100) not null, -- 회원의 password 정보를 저장
	name varchar2(100) not null, -- 회원의 이름
	email varchar2(100) not null, -- email 정보 저장
	city varchar2(100) not null,
	phone varchar2(100) not null

);

alter table mbTbl
add constraint mbTbl_id_PK primary key (id);

commit;

/*
 * 
 *	01 : Statement	/	02 : PreparedStatement
 *  insert01	: 사용자 정보를 입력
 *  list01.jsp	: 사용자 정보를 출력
 *  read01.jsp	: 사용자 정보를 출력
 * 	delete01.jsp : 사용자 정보를 삭제
 * 	update01.jsp : 사용자 정보를 수정
 * 	
 * 		
 */

Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (2,'bbb','1','김철수','bbb@bbb.com','경기','010-1111-1111');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (4,'ddd','1','맹구','ddd@ddd.com','부산','010-9999-9999');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (3,'ccc','1','신짱아','ccc','대전','010-1234-1234');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (1,'aaa','1','김짱구','aaa@aaa.com','서울','010-1234-1234');