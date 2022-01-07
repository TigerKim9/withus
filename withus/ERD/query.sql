-- SELECT
SELECT * FROM userdto;
SELECT * FROM seller;
SELECT * FROM project_funding;
SELECT * FROM funded;
SELECT * FROM delivery;
SELECT * FROM likes;
SELECT * FROM notice;
SELECT * FROM inquire;
SELECT * FROM inquire_answer;

SELECT f_prnum prnum FROM funded WHERE f_useremail = "1101@naver.com";
DELETE FROM funded WHERE f_fundingdate ="2021-10-04 01:36:32";

INSERT INTO delivery (dv_prnum, dv_num, dv_addr, dv_check, dv_useremail) VALUES (3, "1234567890", "주소", 0, "c@c.com");
INSERT INTO delivery (dv_prnum, dv_num, dv_addr, dv_check, dv_useremail) VALUES (4, "1", "주소", 0, "c@c.com");
INSERT INTO funded (f_prnum, f_useremail, f_fundingdate) VALUES (4, "c@c.com", now());
DESC delivery;
SELECT * FROM delivery d ;
select dv_prnum prnum, dv_num num, dv_useremail useremail
			from Delivery 
			where dv_prnum = "1";

-- 기본 INSERT
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("김30", "aaa", "ROLE_USER");

INSERT INTO seller VALUES ("c@c.c", "c", "c", "c", "c");

INSERT INTO project_funding (pf_selid, pf_title, pf_content, pf_itemprice, pf_price, pf_category, pf_startdate, pf_enddate)
VALUES ("dcc", "c", "c", 10, 10, "c", now(), now());

INSERT INTO funded values(3, "a@a.a", now());
INSERT INTO funded values(5, "a@a.a", now());
INSERT INTO funded values(5, "test", now());

INSERT INTO likes values(123, "a");


-- DAO 검사용
SELECT sum(p.pf_itemprice) FROM funded f, project_funding p WHERE f.f_prnum = p.pf_prnum GROUP BY (f.f_useremail) HAVING f.f_useremail = "test";
SELECT count(*) FROM likes GROUP BY lk_prnum HAVING lk_prnum = 123;
SELECT * FROM project_funding ;
SELECT count(*) FROM project_funding WHERE date_format(pf_regdate, '%Y-%m-%d') = "2021-09-27"; 
SELECT * FROM project_funding WHERE date_format(pf_regdate, '%Y-%m-%d') <= date_format(now(), '%Y-%m-%d'); 

INSERT INTO #seller(sel_useremail useremail, sel_business business, sel_jumin jumin, sel_selid selid, sel_name name)
		VALUES("test@nav.com", "3452", "203949","3409", "대표자");
		
SELECT f_prnum ,f_fundingdate FROM funded WHERE f_useremail = "김30";
SELECT pf_prnum, pf_title, pf_price, pf_category, pf_regdate, pf_startdate, pf_enddate from project_funding;
	
SELECT *FROM funded where f_useremail = "김30" ;
SELECT *FROM userdto ;
SELECT *FROM funded ;
SELECT *FROM project_funding ;
INSERT INTO funded VALUES (2,"1101@naver.com",now());
SELECT f_prnum, f_useremail,f_fundingdate FROM funded where f_useremail = "1101@naver.com";
SELECT f_prnum, f_useremail,f_fundingdate FROM funded where f_useremail = "rarz1176@daum.net";

SELECT *FROM delivery ;
SELECT *FROM funded where f_useremail = "1101@naver.com" ;
select * from funded f where f_useremail = "1101@naver.com" group by (f_useremail);
SELECT f_prnum FROM funded where f_useremail = "1101@naver.com" ;
INSERT INTO funded VALUES (2,"rarz1176@daum.net",now());
INSERT INTO funded VALUES (2,"1101@naver.com",now());
SELECT * FROM funded ;
SELECT * FROM project_funding ;


INSERT INTO Delivery VALUES(1,"1234567890","평택",1,"rarz1176@daum.net","배송컨택1");
INSERT INTO Delivery VALUES(2,"640663262611","한라",1,"rarz1176@daum.net","배송컨택");
INSERT INTO Delivery VALUES(2,"555983261782","청주",1,"1101@naver.com","청수배송컨택");
INSERT INTO Delivery VALUES(1,"551240698701","문산",0,"1101@naver.com","배송컨택1");

UPDATE Delivery
		SET dv_addr = "서울"
		WHERE dv_useremail = "1101@naver.com";
	
select dv_prnum  prnum, dv_num num, dv_useremail useremail from Delivery where dv_num = "1234567890";
		

	SELECT pf_prnum prnum,
         pf_selid selid,
         pf_title title,
         pf_content content,
         pf_viewcnt viewcnt,
         pf_itemprice itemprice,
         pf_price price, 
         pf_category category, 
         pf_filepath filepath, 
         pf_regdate regdate,
         pf_startdate startdate, 
         pf_enddate enddate,
         pf_newctn newctn
      FROM project_funding
      WHERE pf_selid = "test5657"
	order by pf_prnum desc;
select * from notice n ;

select * from inquire i ;

delete from inquire where in_num =17;

delete from notice where nt_num =11;

select * from funded f ;

select * from delivery d ;

INSERT INTO userdto (user_email, user_name, user_role) VALUES ("kims@mail.com", "kims", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("kams@mail.com", "kams", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("koms@mail.com", "koms", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("kums@mail.com", "kums", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("leee@mail.com", "leee", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("gee@mail.com", "gee", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("boy@mail.com", "boy", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("man@mail.com", "man", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("girl@mail.com", "girl", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("woman@mail.com", "woman", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("hey@mail.com", "hey", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("bye@mail.com", "bye", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("hi@mail.com", "hi", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("hello@mail.com", "hello", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("rarara@mail.com", "rarara", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("lalala@mail.com", "lalala", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("front@mail.com", "front", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("back@mail.com", "back", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("apis@mail.com", "apis", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("ckeditor@mail.com", "ckeditor", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("chartjs@mail.com", "chart", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("delivery@mail.com", "deliver", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("first@mail.com", "first", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("start@mail.com", "start", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("end@mail.com", "end", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("database@mail.com", "data", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("mysql@mail.com", "mysql", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("oracle@mail.com", "oracle", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("lol@mail.com", "lol", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("puge@mail.com", "puge", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("opgg@mail.com", "opgg", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("maple@mail.com", "maple", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("r2beat@mail.com", "r2beat", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("games@mail.com", "games", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("rpg@mail.com", "rpg", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("validation@mail.com", "vali", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("error@mail.com", "error", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("session@mail.com", "session", "ROLE_USER");
INSERT INTO userdto (user_email, user_name, user_role) VALUES ("min@mail.com", "min", "ROLE_USER");

select * from userdto u ;

select * from notice n ;

delete from notice where nt_num =9;


select pf_prnum prnum, pf_content as content , (sum(pf_viewcnt)/count(l.lk_likecnt))+count(l.lk_likecnt)*10 as popular from project_funding pf, likes l 
		where pf.pf_prnum =l.lk_prnum group by pf_prnum order by popular desc limit 10;
	
	SELECT
			nt_num num,
			nt_title title,
			nt_regdate regDate
		FROM notice
		WHERE nt_category = ${category}
		ORDER BY nt_num desc
		
		delete from notice where nt_num =7;

	select * from likes l ;
select * from userdto u ;
select * from project_funding pf ;

update userdto set user_role ="ROLE_ADMIN" where user_email ="admin@mail.com";

update userdto set user_role ="ROLE_MEMBER" where user_email ="admin@mail.com";

insert into project_funding(pf_selid,pf_title,pf_content,pf_itemprice,pf_price,pf_category,pf_startdate,pf_enddate) values("test5657","test-1","test내용입니다.", );


select * from seller s ;


select * from project_funding pf ;

select * from funded f ;

select * from project_funding pf ;

insert into funded values(8,"test@mail.com","2021-10-02");

insert into funded values(8,"test@mail.com","2021-12-01");

insert into funded values(1,"test@mail.com","2021-12-01");
