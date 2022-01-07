drop table if exists notice;
drop table if exists inquire_answer;
drop table if exists inquire;
drop table if exists delivery;
drop table if exists funded;
drop table if exists likes;
drop table if exists project_funding;
drop table if exists seller;
drop table if exists question;
drop table if exists answer;
drop table if exists event;
drop table if exists userdto;




-- user Table Create SQL
CREATE TABLE userdto
(
   `user_aiid`     int    auto_increment    PRIMARY KEY,
   `user_email`    varchar(50)    NOT null unique, 
    `user_name`     varchar(50)    NOT NULL, 
    `user_phone`    varchar(15), 
    `user_addr`     varchar(100), 
    `user_pw`       varchar(256), 
    `user_cardnum`  varchar(20), 
    `user_cash`     INT             NOT NULL    default 0, 
    `user_picture`  varchar(100),
    `user_role`     varchar(50),
    `user_regdate`  datetime default now()
);


-- seller Table Create SQL
CREATE TABLE seller
(
    `sel_useremail`    varchar(50)    NOT NULL    COMMENT '사용자id', 
    `sel_business`  varchar(20)    NOT NULL    COMMENT '사업자', 
    `sel_jumin`     varchar(16)    NOT NULL    COMMENT '주민등록번호', 
    `sel_selid`     varchar(70)    NOT NULL    COMMENT '판매자id', 
    `sel_name`      varchar(50)    NOT NULL    COMMENT '대표자명', 
    CONSTRAINT PK_seller PRIMARY KEY (sel_selid)
);

ALTER TABLE seller COMMENT '판매자';

ALTER TABLE seller
    ADD CONSTRAINT FK_seller_sel_useremail_userdto_user_email FOREIGN KEY (sel_useremail)
        REFERENCES userdto (user_email) ON DELETE CASCADE ON UPDATE CASCADE;
       

-- project_funding Table Create SQL
CREATE TABLE project_funding
(
    `pf_prnum`      INT(10)        NOT NULL    AUTO_INCREMENT    COMMENT '프로젝트번호', 
    `pf_selid`      varchar(15)    NOT NULL    COMMENT '판매자id', 
    `pf_title`      varchar(50)    NOT NULL    COMMENT '프로젝트 제목', 
    `pf_content`    TEXT           NOT NULL    COMMENT '프로젝트 내용', 
    `pf_viewcnt`    INT            NOT NULL    default 0    COMMENT '조회수', 
    `pf_itemprice`  INT            NOT NULL    COMMENT '아이템 금액', 
    `pf_price`      INT            NOT NULL    COMMENT '목표금액', 
    `pf_category`   varchar(10)    NOT NULL    COMMENT '카테고리', 
    `pf_filepath`   VARCHAR(700)   NULL        COMMENT '파일경로',
    `pf_regdate`    DATETIME       NOT NULL    default (current_date)    COMMENT '등록일',
    `pf_startdate`  DATE           NOT NULL    COMMENT '시작일', 
    `pf_enddate`    DATE           NOT NULL    COMMENT '종료일', 
    `pf_newctn`     TEXT           NULL        COMMENT '새소식',
    CONSTRAINT PK_project_funding PRIMARY KEY (pf_prnum)
);


ALTER TABLE project_funding COMMENT '펀딩 프로젝트';

ALTER TABLE project_funding
    ADD CONSTRAINT FK_project_funding_pf_selid_seller_sel_selid FOREIGN KEY (pf_selid)
        REFERENCES seller (sel_selid) ON DELETE CASCADE ON UPDATE CASCADE;

-- inquire Table Create SQL
CREATE TABLE inquire
(
    `in_num`      INT           NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
    `in_prnum`    INT(10)       NOT NULL    COMMENT '프로젝트 번호', 
    `in_title`    varchar(20)   NOT NULL    COMMENT '문의글 제목',
    `in_content`  TEXT          NOT NULL    COMMENT '글내용', 
    `in_regdate`  DATETIME      NOT NULL    default  now() COMMENT '등록일', 
    `in_useremail`  varchar(50) NOT NULL    COMMENT '작성자id', 
    CONSTRAINT PK_inquire PRIMARY KEY (in_num)
);

ALTER TABLE inquire COMMENT '판매자에게 문의';

ALTER TABLE inquire
    ADD CONSTRAINT FK_inquire_in_useremail_userdto_user_email FOREIGN KEY (in_useremail)
        REFERENCES userdto (user_email) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE inquire
    ADD CONSTRAINT FK_inquire_in_prnum_project_funding_pf_prnum FOREIGN KEY (in_prnum)
        REFERENCES project_funding (pf_prnum) ON DELETE CASCADE ON UPDATE CASCADE;


-- inquire_answer Table Create SQL
CREATE TABLE inquire_answer
(
    `ina_num`      INT         NOT NULL    AUTO_INCREMENT COMMENT '답글 번호', 
    `ina_content`  TEXT        NOT NULL    COMMENT '글 내용', 
    `ina_regdate`  DATETIME    NOT NULL    default now()    COMMENT '등록일', 
    `ina_innum`    INT         NOT NULL    COMMENT '글 번호', 
    CONSTRAINT PK_inquire_answer PRIMARY KEY (ina_num)
);

ALTER TABLE inquire_answer COMMENT '판매자 문의 답변';

ALTER TABLE inquire_answer
    ADD CONSTRAINT FK_inquire_answer_ina_innum_inquire_in_num FOREIGN KEY (ina_innum)
        REFERENCES inquire (in_num) ON DELETE CASCADE ON UPDATE CASCADE;

-- Like Table Create SQL
CREATE TABLE Likes
(
    `lk_prnum`      int(10)      NOT NULL    COMMENT '프로젝트 번호', 
    `lk_useremail`  varchar(50)  NOT NULL    COMMENT '사용자 id', 
   `lk_likecnt`    int(2)       NOT NULL    CHECK (lk_likecnt IN (0, 1)) DEFAULT 0    COMMENT '좋아요 여부', 
    CONSTRAINT PK_Like PRIMARY KEY (lk_prnum, lk_useremail)
);

ALTER TABLE Likes COMMENT '좋아요';

ALTER TABLE Likes
    ADD CONSTRAINT FK_Like_lk_prnum_project_funding_pf_prnum FOREIGN KEY (lk_prnum)
        REFERENCES project_funding (pf_prnum) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Likes
    ADD CONSTRAINT FK_Like_lk_useremail_userdto_user_email FOREIGN KEY (lk_useremail)
        REFERENCES userdto (user_email) ON DELETE CASCADE ON UPDATE CASCADE;
-- funded Table Create SQL
CREATE TABLE funded
(
    `f_prnum`        int(10)    NOT NULL    COMMENT '펀딩프로젝트 번호', 
    `f_useremail`    varchar(50)    NOT NULL    COMMENT '사용자 id', 
    `f_fundingdate`  DATETIME       NOT NULL    default now() COMMENT '펀딩날짜', 
    CONSTRAINT PK_funded PRIMARY KEY (f_prnum, f_useremail, f_fundingdate)
);


ALTER TABLE funded
    ADD CONSTRAINT FK_funded_f_useremail_userdto_user_email FOREIGN KEY (f_useremail)
        REFERENCES userdto (user_email) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE funded
    ADD CONSTRAINT FK_funded_f_prnum_project_funding_pf_prnum FOREIGN KEY (f_prnum)
        REFERENCES project_funding (pf_prnum) ON DELETE CASCADE ON UPDATE CASCADE;
       
-- Delivery Table Create SQL
CREATE TABLE Delivery
(
   `dv_prnum`    INT(10)    NOT NULL    COMMENT '프로젝트번호', 
    `dv_num`      varchar(15)    NOT NULL    COMMENT '배송번호', 
    `dv_addr`     varchar(100)    NOT NULL    COMMENT '배송지', 
    `dv_check`    INT            NOT NULL    check (dv_check in (0, 1, 2))    COMMENT '배송확인', 
    `dv_useremail`   varchar(50)    NOT NULL    COMMENT '구매자id', 
    `dv_content`  varchar(50)    NULL        COMMENT '요청사항', 
    CONSTRAINT PK_Delivery PRIMARY KEY (dv_num)
);

ALTER TABLE Delivery COMMENT '배송';

ALTER TABLE Delivery
    ADD CONSTRAINT FK_Delivery_dv_prnum_funded_f_prnum FOREIGN KEY (dv_prnum)
        REFERENCES funded (f_prnum) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Delivery
    ADD CONSTRAINT FK_Delivery_dv_useremail_funded_f_useremail FOREIGN KEY (dv_useremail)
        REFERENCES funded (f_useremail) ON DELETE CASCADE ON UPDATE CASCADE;

-- Notice Table Create SQL
CREATE TABLE notice
(
    `nt_num`   INT      NOT NULL AUTO_INCREMENT,
    `nt_title`   varchar(30) NOT NULL,
    `nt_content` text   NOT NULL,
    `nt_regdate` DATE   NOT NULL   DEFAULT (current_date),
    `nt_useremail`   varchar(50) NOT NULL,
    `nt_category`   varchar(10) NOT NULL   CHECK (nt_category IN('notice', 'event')),
    CONSTRAINT PK_notice PRIMARY KEY(nt_num)
);

ALTER TABLE Notice COMMENT '공지글';

ALTER TABLE Notice
    ADD CONSTRAINT FK_Notice_nt_useremail_userdto_user_email FOREIGN KEY (nt_useremail)
        REFERENCES userdto (user_email) ON DELETE CASCADE ON UPDATE CASCADE;
       
