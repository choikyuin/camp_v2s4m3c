/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE USERCATE(
		USERCATENO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
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

SELECT *FROM usercate;


/**********************************/
/* Table Name: 서브카테고리 */
/**********************************/
CREATE TABLE subcate(
		subcateno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)	DEFAULT 0	 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y' 	 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		USERCATENO                    		NUMBER(10)		NOT NULL ,
  FOREIGN KEY (USERCATENO) REFERENCES USERCATE (USERCATENO)
);

COMMENT ON TABLE subcate is '서브카테고리';
COMMENT ON COLUMN subcate.subcateno is '서브 카테고리 그룹 번호';
COMMENT ON COLUMN subcate.name is '이름';
COMMENT ON COLUMN subcate.seqno is '출력순서';
COMMENT ON COLUMN subcate.visible is '출력모드';
COMMENT ON COLUMN subcate.rdate is '서브 그룹 생성일';
COMMENT ON COLUMN subcate.cnt is '등록된 자료수';
COMMENT ON COLUMN subcate.USERCATENO is '카테고리 그룹 번호';

-- 등록

INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            '공지사항', 1, 'Y', sysdate, 0, 1); 
            
INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            '유실물안내', 2, 'Y', sysdate, 0, 1); 
            
INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            'Q&A', 1, 'Y', sysdate, 0, 2);
            
INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            '텐트', 1, 'Y', sysdate, 0, 3); 
            
INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            '데크', 2, 'Y', sysdate, 0, 3);
            
-- 전체 목록
SELECT subcateno, usercateno, name, seqno, visible, rdate, cnt
FROM subcate
ORDER BY subcateno ASC;

 SUBCATENO USERCATENO NAME  SEQNO VISIBLE RDATE                 CNT
 --------- ---------- ----- ----- ------- --------------------- ---
         1          1 공지사항      1 Y       2019-12-24 13:02:38.0   0
         2          1 유실물안내     2 Y       2019-12-24 13:03:27.0   0
         3          2 Q&A       1 Y       2019-12-24 13:05:03.0   0
         4          3 텐트        1 Y       2019-12-24 13:06:08.0   0
         5          3 데크        2 Y       2019-12-24 13:06:09.0   0
         
         
-- 카테고리 별 목록
SELECT usercateno, subcateno, name, seqno, visible, rdate, cnt
FROM subcate
WHERE usercateno = 1
ORDER BY subcateno ASC;

USERCATENO SUBCATENO NAME  SEQNO VISIBLE 						RDATE               CNT
 ---------- --------- ----- ----- ------- --------------------- -------------          ---------
          1        		 1 				공지사항      1 				Y       2019-12-24 13:02:38.0  			  0
          1        		 2 			유실물안내     2 				Y       2019-12-24 13:03:27.0   		  0

-- 서브카테고리 조회
SELECT subcateno, usercateno, name, seqno, visible, rdate, cnt
FROM subcate
WHERE subcateno = 1;
    
          
-- subcate 전체 레코드 갯수
SELECT count(*) as count
FROM subcate

-- 외래키가 있는  subcate 레코드 갯수
SELECT count(*) as count
FROM subcate
WHERE usercateno = 1;



-- 삭제
DELETE FROM subcate
WHERE subcateno = 6;





          