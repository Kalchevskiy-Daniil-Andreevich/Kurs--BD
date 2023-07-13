--1
CREATE TABLE T_RANGE(
  id NUMBER,
  value VARCHAR2(50)
)
PARTITION BY RANGE (id) --диапазонные разделы
(
--разделы
  PARTITION p1 VALUES LESS THAN (100), 
  PARTITION p2 VALUES LESS THAN (200),
  PARTITION p3 VALUES LESS THAN (300),
  PARTITION p4 VALUES LESS THAN (MAXVALUE)
);

DROP TABLE T_RANGE;

--2
CREATE TABLE T_INTERVAL(
  id NUMBER,
  value VARCHAR2(50),
  date_col DATE
)
PARTITION BY RANGE (date_col) INTERVAL(NUMTOYMINTERVAL(1, 'MONTH')) --каждый следующий интервал будет составлять 1 месяц.
(
  PARTITION p1 VALUES LESS THAN (TO_DATE('01-01-2020', 'DD-MM-YYYY')),
  PARTITION p2 VALUES LESS THAN (TO_DATE('01-02-2020', 'DD-MM-YYYY')),
  PARTITION p3 VALUES LESS THAN (TO_DATE('01-03-2020', 'DD-MM-YYYY'))
);

DROP TABLE T_INTERVAL;

--3
CREATE TABLE T_HASH(
  id NUMBER,
  value VARCHAR2(50),
  hash_col VARCHAR2(50)
)
PARTITION BY HASH (hash_col) PARTITIONS 4;

DROP TABLE T_HASH;

--4
CREATE TABLE T_LIST (
  id NUMBER,
  value VARCHAR2(50),
  char_col CHAR(1)
)
PARTITION BY LIST (char_col)
(
  PARTITION p1 VALUES ('A'),
  PARTITION p2 VALUES ('B'),
  PARTITION p3 VALUES ('C'),
  PARTITION p4 VALUES (DEFAULT)
);

DROP TABLE T_LIST;

--5

INSERT INTO T_RANGE (id, value) VALUES (50, 'Value for partition p1');
INSERT INTO T_RANGE (id, value) VALUES (150, 'Value for partition p2');
INSERT INTO T_RANGE (id, value) VALUES (250, 'Value for partition p3');
INSERT INTO T_RANGE (id, value) VALUES (350, 'Value for partition p4');

SELECT * FROM T_RANGE;


INSERT INTO T_INTERVAL (id, value, date_col) VALUES (1, 'Value for partition p1', TO_DATE('01-01-2020', 'DD-MM-YYYY'));
INSERT INTO T_INTERVAL (id, value, date_col) VALUES (2, 'Value for partition p2', TO_DATE('01-02-2020', 'DD-MM-YYYY'));
INSERT INTO T_INTERVAL (id, value, date_col) VALUES (3, 'Value for partition p3', TO_DATE('01-03-2020', 'DD-MM-YYYY'));
INSERT INTO T_INTERVAL (id, value, date_col) VALUES (4, 'Value for partition p4', TO_DATE('01-04-2020', 'DD-MM-YYYY'));

SELECT * FROM T_INTERVAL;


INSERT INTO T_HASH (id, value, hash_col) VALUES (1, 'Value for partition 1', 'A');
INSERT INTO T_HASH (id, value, hash_col) VALUES (2, 'Value for partition 2', 'B');
INSERT INTO T_HASH (id, value, hash_col) VALUES (3, 'Value for partition 3', 'C');
INSERT INTO T_HASH (id, value, hash_col) VALUES (4, 'Value for partition 4', 'D');

SELECT * FROM T_HASH;


INSERT INTO T_LIST (id, value, char_col) VALUES (1, 'Value for partition p1', 'A');
INSERT INTO T_LIST (id, value, char_col) VALUES (2, 'Value for partition p2', 'B');
INSERT INTO T_LIST (id, value, char_col) VALUES (3, 'Value for partition p3', 'C');
INSERT INTO T_LIST (id, value, char_col) VALUES (4, 'Value for partition p4', 'D');

SELECT * FROM T_LIST;

--6
ALTER TABLE T_RANGE ENABLE ROW MOVEMENT;
UPDATE T_RANGE SET id = 110 WHERE id = 50;
SELECT * FROM T_RANGE;
ROLLBACK;

ALTER TABLE T_INTERVAL ENABLE ROW MOVEMENT;
UPDATE T_INTERVAL SET date_col = TO_DATE('01-05-2020', 'DD-MM-YYYY') WHERE id = 2;
SELECT * FROM T_INTERVAL;
ROLLBACK;

ALTER TABLE T_HASH ENABLE ROW MOVEMENT;
UPDATE T_HASH SET hash_col = 'A' WHERE id = 2;
SELECT * FROM T_HASH;
ROLLBACK;

ALTER TABLE T_LIST ENABLE ROW MOVEMENT;
UPDATE T_LIST SET char_col = 'A' WHERE id = 2;
SELECT * FROM T_LIST;
ROLLBACK;

--7
ALTER TABLE T_RANGE MERGE PARTITIONS p1, p2 INTO PARTITION p1_new; --объединения двух или более разделов в один раздел в таблице с разделением. 
SELECT * FROM T_RANGE PARTITION (p1_new);

--8
ALTER TABLE T_RANGE SPLIT PARTITION p4 INTO (PARTITION p4_new1 VALUES LESS THAN (400), PARTITION p4_new2); --разделения одного раздела на два или более раздела в таблице с разделением
SELECT * FROM T_RANGE PARTITION (p4_new1);
SELECT * FROM T_RANGE PARTITION (p4_new2);

--9
CREATE TABLE T_TEMP_RANGE (
  id NUMBER,
  value VARCHAR2(50)
);

INSERT INTO T_TEMP_RANGE VALUES (200, 'Value for temporary partition');

ALTER TABLE T_RANGE EXCHANGE PARTITION p3 WITH TABLE T_TEMP_RANGE;

SELECT * FROM T_RANGE PARTITION(P3);
SELECT * FROM T_TEMP_RANGE;

--10
SELECT table_name FROM user_part_tables;

SELECT partition_name FROM user_tab_partitions WHERE table_name = 'T_RANGE';

SELECT * FROM T_RANGE PARTITION (p3);

SELECT * FROM T_RANGE PARTITION FOR (50);