        
       
9) 최종 cnt 통합

DROP TABLE usercate;
  
CREATE TABLE usercate(
    usercateno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                            VARCHAR2(50)     NOT NULL,
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                             DATE     NOT NULL,
    cnt                                NUMBER(7)    DEFAULT 0     NOT NULL    
);
 
COMMENT ON TABLE usercate is '카테고리 그룹';
COMMENT ON COLUMN usercate.usercateno is '카테고리 그룹 번호';
COMMENT ON COLUMN usercate.name is '이름';
COMMENT ON COLUMN usercate.seqno is '출력 순서';
COMMENT ON COLUMN usercate.visible is '출력 모드';
COMMENT ON COLUMN usercate.rdate is '그룹 생성일';
COMMENT ON COLUMN usercate.cnt is '등록된 자료수';

DROP TABLE usercontents;

INSERT INTO usercate(usercateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(usercateno), 0) + 1 as usercateno FROM usercate),
            '알림마당', 1, 'Y', sysdate, 0);
            
INSERT INTO usercate(usercateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(usercateno), 0) + 1 as usercateno FROM usercate),
            '고객마당', 2, 'Y', sysdate, 0);
            
INSERT INTO usercate(usercateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(usercateno), 0) + 1 as usercateno FROM usercate),
            '시설안내', 3, 'Y', sysdate, 0);            
 
DROP TABLE usercontents
            
--  usercateno 순서 목록            
SELECT usercateno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate, cnt
FROM usercate
ORDER BY usercateno ASC;

-- seqno 순서 목록            
SELECT usercateno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate, cnt
FROM usercate
ORDER BY seqno ASC;

-- 삭제

DELETE FROM usercate
WHERE  usercateno =7;

-- 조회
SELECT usercateno, name, seqno, visible, rdate, cnt
FROM USERCATE
WHERE usercateno = 7;



-- 수정
UPDATE usercate
SET name = '알림마당'
WHERE usercateno = 7;


-- 출력 순서 상향, 10 -> 1
UPDATE usercate
SET seqno = seqno - 1
WHERE usercateno=1;
 

-- 출력순서 하향, 1 -> 10
UPDATE usercate
SET seqno = seqno + 1
WHERE usercateno=1;




            
            