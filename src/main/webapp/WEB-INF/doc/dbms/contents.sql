

DROP TABLE usercontents;

/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE USERCATE(
		USERCATENO                    		NUMBER(10)		 NOT NULL,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL
);

COMMENT ON TABLE USERCATE is '카테고리 그룹';
COMMENT ON COLUMN USERCATE.USERCATENO is '카테고리 그룹 번호';
COMMENT ON COLUMN USERCATE.NAME is '이름';
COMMENT ON COLUMN USERCATE.SEQNO is '출력 순서';
COMMENT ON COLUMN USERCATE.VISIBLE is '출력 모드';
COMMENT ON COLUMN USERCATE.RDATE is '그룹 생성일';
COMMENT ON COLUMN USERCATE.CNT is '등록된 자료수';


/**********************************/
/* Table Name: 서브카테고리 */
/**********************************/
CREATE TABLE subcate(
		subcateno                     		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT Y		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		USERCATENO                    		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE subcate is '서브카테고리';
COMMENT ON COLUMN subcate.subcateno is '서브 카테고리 그룹 번호';
COMMENT ON COLUMN subcate.name is '이름';
COMMENT ON COLUMN subcate.seqno is '출력순서';
COMMENT ON COLUMN subcate.visible is '출력모드';
COMMENT ON COLUMN subcate.rdate is '서브 그룹 생성일';
COMMENT ON COLUMN subcate.cnt is '등록된 자료수';
COMMENT ON COLUMN subcate.USERCATENO is '카테고리 그룹 번호';


/**********************************/
/* Table Name: 회원컨텐츠 */
/**********************************/
CREATE TABLE usercontents(
		contentsno                    		NUMBER(10)		 NOT NULL,
		usercateno                        NUMBER(10)     NOT NULL,
		subcateno                         NUMBER(10)     NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB		 NOT NULL,
		recom                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		word                          		VARCHAR2(100)		 NULL ,
		FOREIGN KEY (usercateno) REFERENCES USERCATE (usercateno),
		FOREIGN KEY (subcateno)  REFERENCES  subcate (SUBCATENO)
	 
);

COMMENT ON TABLE usercontents is '회원컨텐츠';
COMMENT ON COLUMN usercontents.contentsno is '컨텐츠번호';
COMMENT ON COLUMN usercontents.title is '제목';
COMMENT ON COLUMN usercontents.content is '내용';
COMMENT ON COLUMN usercontents.recom is '추천수';
COMMENT ON COLUMN usercontents.cnt is '조회수';
COMMENT ON COLUMN usercontents.replycnt is '댓글수';
COMMENT ON COLUMN usercontents.rdate is '등록일';
COMMENT ON COLUMN usercontents.word is '검색어';
COMMENT ON COLUMN usercontents.USERCATENO is '카테고리 그룹 번호';
COMMENT ON COLUMN usercontents.subcateno is '서브 카테고리 그룹 번호';



ALTER TABLE USERCATE ADD CONSTRAINT IDX_USERCATE_PK PRIMARY KEY (USERCATENO);

ALTER TABLE subcate ADD CONSTRAINT IDX_subcate_PK PRIMARY KEY (subcateno);
ALTER TABLE subcate ADD CONSTRAINT IDX_subcate_FK0 FOREIGN KEY (USERCATENO) REFERENCES USERCATE (USERCATENO);

ALTER TABLE usercontents ADD CONSTRAINT IDX_usercontents_PK PRIMARY KEY (contentsno);
ALTER TABLE usercontents ADD CONSTRAINT IDX_usercontents_FK0 FOREIGN KEY (subcateno) REFERENCES subcate (subcateno);


-- 등록
INSERT INTO usercontents(contentsno, usercateno, subcateno, title, content,
                         recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM usercontents),
            1, 2, '지갑분실', '지갑 찾아가시길 바랍니다.', 0, 0, 0, sysdate, ''); 

INSERT INTO usercontents(contentsno, usercateno, subcateno, title, content,
                         recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM usercontents),
            1, 1, '예약안내', '예약안내 드립니다.', 0, 0, 0, sysdate, '');
            
INSERT INTO usercontents(contentsno, usercateno, subcateno, title, content,
                         recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM usercontents),
            1, 1, '교통안내', '교통안내 드립니다.', 0, 0, 0, sysdate, '');            


-- 목록
SELECT contentsno, usercateno, subcateno, title, content,
       recom, cnt, replycnt, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi'), word
FROM usercontents
ORDER BY contentsno DESC;



-- 서브 카테고리별 목록
SELECT contentsno, usercateno, subcateno, title, content,
       recom, cnt, replycnt, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi'), word
FROM usercontents
WHERE subcateno = 1
ORDER BY contentsno DESC;




















