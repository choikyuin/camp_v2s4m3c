
--location_reservation 장소 선택 테이블 생성
CREATE TABLE location_reservation(
    location_num                     NUMBER(10)     NOT NULL    PRIMARY KEY,
    visible                              CHAR(1)          DEFAULT 'Y'     NOT NULL,     
    cnt                                 NUMBER(7)       DEFAULT 0      NOT NULL, 
    price                               NUMBER(8)       DEFAULT 0      NULL
);

COMMENT ON TABLE location_reservation is '장소 선택';
COMMENT ON COLUMN location_reservation.location_num is '장소 번호';
COMMENT ON COLUMN location_reservation.visible is '사용 가능여부';
COMMENT ON COLUMN location_reservation.cnt is '인원';
COMMENT ON COLUMN location_reservation.price is '결제금액';


INSERT INTO location_reservation(location_num, visible, cnt, price)
VALUES((SELECT NVL(MAX(location_num), 0) + 1 as location_num FROM location_reservation),  'Y', 0, 0);
 

SELECT location_num, visible, cnt, price
FROM location_reservation
ORDER BY location_num ASC;


--location_pay 장소 선택후 결제 테이블
CREATE TABLE location_pay(
location_num
name
price
car
cash

  FOREIGN KEY (location_num) REFERENCES location_reservation (location_num),
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno)
);

