        
       
9) ���� cnt ����

DROP TABLE usercate;
  
CREATE TABLE usercate(
    usercateno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                            VARCHAR2(50)     NOT NULL,
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                             DATE     NOT NULL,
    cnt                                NUMBER(7)    DEFAULT 0     NOT NULL    
);
 
COMMENT ON TABLE usercate is 'ī�װ� �׷�';
COMMENT ON COLUMN usercate.usercateno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN usercate.name is '�̸�';
COMMENT ON COLUMN usercate.seqno is '��� ����';
COMMENT ON COLUMN usercate.visible is '��� ���';
COMMENT ON COLUMN usercate.rdate is '�׷� ������';
COMMENT ON COLUMN usercate.cnt is '��ϵ� �ڷ��';

DROP TABLE usercontents;

INSERT INTO usercate(usercateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(usercateno), 0) + 1 as usercateno FROM usercate),
            '�˸�����', 1, 'Y', sysdate, 0);
            
INSERT INTO usercate(usercateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(usercateno), 0) + 1 as usercateno FROM usercate),
            '������', 2, 'Y', sysdate, 0);
            
INSERT INTO usercate(usercateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(usercateno), 0) + 1 as usercateno FROM usercate),
            '�ü��ȳ�', 3, 'Y', sysdate, 0);            
 
DROP TABLE usercontents
            
--  usercateno ���� ���            
SELECT usercateno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate, cnt
FROM usercate
ORDER BY usercateno ASC;

-- seqno ���� ���            
SELECT usercateno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate, cnt
FROM usercate
ORDER BY seqno ASC;

-- ����

DELETE FROM usercate
WHERE  usercateno =7;

-- ��ȸ
SELECT usercateno, name, seqno, visible, rdate, cnt
FROM USERCATE
WHERE usercateno = 7;



-- ����
UPDATE usercate
SET name = '�˸�����'
WHERE usercateno = 7;


-- ��� ���� ����, 10 -> 1
UPDATE usercate
SET seqno = seqno - 1
WHERE usercateno=1;
 

-- ��¼��� ����, 1 -> 10
UPDATE usercate
SET seqno = seqno + 1
WHERE usercateno=1;




            
            