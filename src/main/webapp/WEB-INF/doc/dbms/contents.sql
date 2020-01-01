

DROP TABLE usercontents;

/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
CREATE TABLE USERCATE(
		USERCATENO                    		NUMBER(10)		 NOT NULL,
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


/**********************************/
/* Table Name: ����ī�װ� */
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

COMMENT ON TABLE subcate is '����ī�װ�';
COMMENT ON COLUMN subcate.subcateno is '���� ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN subcate.name is '�̸�';
COMMENT ON COLUMN subcate.seqno is '��¼���';
COMMENT ON COLUMN subcate.visible is '��¸��';
COMMENT ON COLUMN subcate.rdate is '���� �׷� ������';
COMMENT ON COLUMN subcate.cnt is '��ϵ� �ڷ��';
COMMENT ON COLUMN subcate.USERCATENO is 'ī�װ� �׷� ��ȣ';


/**********************************/
/* Table Name: ȸ�������� */
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

COMMENT ON TABLE usercontents is 'ȸ��������';
COMMENT ON COLUMN usercontents.contentsno is '��������ȣ';
COMMENT ON COLUMN usercontents.title is '����';
COMMENT ON COLUMN usercontents.content is '����';
COMMENT ON COLUMN usercontents.recom is '��õ��';
COMMENT ON COLUMN usercontents.cnt is '��ȸ��';
COMMENT ON COLUMN usercontents.replycnt is '��ۼ�';
COMMENT ON COLUMN usercontents.rdate is '�����';
COMMENT ON COLUMN usercontents.word is '�˻���';
COMMENT ON COLUMN usercontents.USERCATENO is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN usercontents.subcateno is '���� ī�װ� �׷� ��ȣ';



ALTER TABLE USERCATE ADD CONSTRAINT IDX_USERCATE_PK PRIMARY KEY (USERCATENO);

ALTER TABLE subcate ADD CONSTRAINT IDX_subcate_PK PRIMARY KEY (subcateno);
ALTER TABLE subcate ADD CONSTRAINT IDX_subcate_FK0 FOREIGN KEY (USERCATENO) REFERENCES USERCATE (USERCATENO);

ALTER TABLE usercontents ADD CONSTRAINT IDX_usercontents_PK PRIMARY KEY (contentsno);
ALTER TABLE usercontents ADD CONSTRAINT IDX_usercontents_FK0 FOREIGN KEY (subcateno) REFERENCES subcate (subcateno);


-- ���
INSERT INTO usercontents(contentsno, usercateno, subcateno, title, content,
                         recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM usercontents),
            1, 2, '�����н�', '���� ã�ư��ñ� �ٶ��ϴ�.', 0, 0, 0, sysdate, ''); 

INSERT INTO usercontents(contentsno, usercateno, subcateno, title, content,
                         recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM usercontents),
            1, 1, '����ȳ�', '����ȳ� �帳�ϴ�.', 0, 0, 0, sysdate, '');
            
INSERT INTO usercontents(contentsno, usercateno, subcateno, title, content,
                         recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM usercontents),
            1, 1, '����ȳ�', '����ȳ� �帳�ϴ�.', 0, 0, 0, sysdate, '');            


-- ���
SELECT contentsno, usercateno, subcateno, title, content,
       recom, cnt, replycnt, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi'), word
FROM usercontents
ORDER BY contentsno DESC;



-- ���� ī�װ��� ���
SELECT contentsno, usercateno, subcateno, title, content,
       recom, cnt, replycnt, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi'), word
FROM usercontents
WHERE subcateno = 1
ORDER BY contentsno DESC;




















