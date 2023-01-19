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

Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (8,'eee','1','신형만','eee@eee.com','목포','010-7777-7777');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (13,'jjj','1','흰둥이','jjj@jjj.com','서울','010-4545-4545');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (2,'bbb','1','김철수','bbb@bbb.com','경기','010-1111-1111');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (4,'ddd','1','맹구','ddd@ddd.com','부산','010-9999-9999');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (3,'ccc','1','신짱아','ccc','대전','010-1234-1234');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (1,'aaa','1','신짱구','aaa@aaa.com','서울','010-1234-1234');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (5,'fff','1','유리','fff@fff.com','속초','010-8888-8888');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (16,'ppp','1','신돌식','ppp@ppp.com','서산','010-5548-5548');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (12,'sss','1','수지','sss@sss.com','서울','010-5553-5553');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (14,'chch','1','채성아','chch@chch.com','경기','010-8989-8989');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (18,'sdsd','1','봉선달','sdsd@sdsd.com','광주','010-5588-5588');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (20,'psps','1','봉미자','psps@psps.com','강릉','010-7766-7766');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (6,'ggg','1','훈이','ggg@ggg.com','부산','010-5555-5555');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (7,'hhh','1','봉미선','hhh@hhh.com','경주','010-6666-6666');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (10,'mmm','1','이슬','mmm@mmm.com','대구','010-2222-5555');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (9,'iii','1','나미리','iii@iii.com','인천','010-7788-8877');
Insert into MBTBL (IDX,ID,PASS,NAME,EMAIL,CITY,PHONE) values (11,'kkk','1','오수','kkk@kkk.com','익산','010-3222-2233');