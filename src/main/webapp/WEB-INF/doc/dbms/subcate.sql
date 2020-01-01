/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
CREATE TABLE USERCATE(
		USERCATENO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL
);

COMMENT ON TABLE USERCATE is 'ī�װ� �׷�';
COMMENT ON COLUMN USERCATE.USERCATENO is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN USERCATE.NAME is '�̸�';
COMMENT ON COLUMN USERCATE.SEQNO is '��� ����';
COMMENT ON COLUMN USERCATE.VISIBLE is '��� ���';
COMMENT ON COLUMN USERCATE.RDATE is '�׷� ������';
COMMENT ON COLUMN USERCATE.CNT is '��ϵ� �ڷ��';

SELECT *FROM usercate;


/**********************************/
/* Table Name: ����ī�װ� */
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

COMMENT ON TABLE subcate is '����ī�װ�';
COMMENT ON COLUMN subcate.subcateno is '���� ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN subcate.name is '�̸�';
COMMENT ON COLUMN subcate.seqno is '��¼���';
COMMENT ON COLUMN subcate.visible is '��¸��';
COMMENT ON COLUMN subcate.rdate is '���� �׷� ������';
COMMENT ON COLUMN subcate.cnt is '��ϵ� �ڷ��';
COMMENT ON COLUMN subcate.USERCATENO is 'ī�װ� �׷� ��ȣ';

-- ���

INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            '��������', 1, 'Y', sysdate, 0, 1); 
            
INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            '���ǹ��ȳ�', 2, 'Y', sysdate, 0, 1); 
            
INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            'Q&A', 1, 'Y', sysdate, 0, 2);
            
INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            '��Ʈ', 1, 'Y', sysdate, 0, 3); 
            
INSERT INTO subcate(subcateno, name, seqno, visible, rdate, cnt, usercateno)
VALUES((SELECT NVL(MAX(subcateno), 0) + 1 as subcateno FROM subcate),
            '��ũ', 2, 'Y', sysdate, 0, 3);
            
-- ��ü ���
SELECT subcateno, usercateno, name, seqno, visible, rdate, cnt
FROM subcate
ORDER BY subcateno ASC;

 SUBCATENO USERCATENO NAME  SEQNO VISIBLE RDATE                 CNT
 --------- ---------- ----- ----- ------- --------------------- ---
         1          1 ��������      1 Y       2019-12-24 13:02:38.0   0
         2          1 ���ǹ��ȳ�     2 Y       2019-12-24 13:03:27.0   0
         3          2 Q&A       1 Y       2019-12-24 13:05:03.0   0
         4          3 ��Ʈ        1 Y       2019-12-24 13:06:08.0   0
         5          3 ��ũ        2 Y       2019-12-24 13:06:09.0   0
         
         
-- ī�װ� �� ���
SELECT usercateno, subcateno, name, seqno, visible, rdate, cnt
FROM subcate
WHERE usercateno = 1
ORDER BY subcateno ASC;

USERCATENO SUBCATENO NAME  SEQNO VISIBLE 						RDATE               CNT
 ---------- --------- ----- ----- ------- --------------------- -------------          ---------
          1        		 1 				��������      1 				Y       2019-12-24 13:02:38.0  			  0
          1        		 2 			���ǹ��ȳ�     2 				Y       2019-12-24 13:03:27.0   		  0

-- ����ī�װ� ��ȸ
SELECT subcateno, usercateno, name, seqno, visible, rdate, cnt
FROM subcate
WHERE subcateno = 1;
    
          
-- subcate ��ü ���ڵ� ����
SELECT count(*) as count
FROM subcate

-- �ܷ�Ű�� �ִ�  subcate ���ڵ� ����
SELECT count(*) as count
FROM subcate
WHERE usercateno = 1;



-- ����
DELETE FROM subcate
WHERE subcateno = 6;





          