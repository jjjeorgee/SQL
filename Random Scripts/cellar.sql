CREATE TABLE shop (
 article INT UNSIGNED    DEFAULT '0000' NOT NULL,
 dealer  CHAR(20)        DEFAULT ''     NOT NULL,
 price   DECIMAL(16, 2)  DEFAULT '0.00' NOT NULL,
 PRIMARY KEY (article, dealer)
);
INSERT INTO shop
VALUES 
(1, 'A', 3.45),
(1, 'B', 3.99),
(2, 'A', 10.99),
(3, 'B', 1.45),
(3, 'C', 1.69),
(3, 'D', 1.25),
(4, 'D', 19.95);

SELECT *
FROM shop;

SELECT  dealer, MAX(price) AS Highest_Price
FROM shop
GROUP BY dealer 
ORDER BY dealer;

SELECT  article, MAX(price) AS Highest_Price
FROM shop
GROUP BY dealer 
ORDER BY dealer;

SELECT MAX(price)
FROM shop;

SELECT article, dealer, price
FROM shop s1
WHERE price = (SELECT MAX(s2.price)
			   FROM shop s2
               WHERE s1.article = s2.article)
ORDER  BY dealer;

SELECT s1.article, s1.dealer, s2.price
FROM shop s1
JOIN shop s2
ON s1.article = s2.article
WHERE s2.price = (SELECT MAX(s2.price)
			   FROM shop s2
               WHERE s1.article = s2.article)
ORDER  BY article;

SELECT MAX(PRICE), MIN(PRICE)
FROM shop;

CREATE  TABLE  CELLAR (
WINE CHAR(20) PRIMARY KEY,
YEAR YEAR,
BOTTLES INT
);

INSERT  INTO  CELLAR 
VALUES ('Zinfandel', '1999', 2),
	   ('Fume Blanc',  '2000', 2),
       ('Pinot Noir' , '1997',  3),
       ('Zinfande', '1998', 9);
       
SELECT * FROM sql_drills.cellar
where year = '2000';
select wine, bottles
from cellar
where wine = 'fume blanc';

delete from cellar;

UPDATE CELLAR
SET BOTTLES = 3 + 5
WHERE WINE = 'PINOOT NOIR';

DELETE FROM CELLAR
WHERE WINE = 'PINOT NOIR';

INSERT INTO CELLAR
VALUES ('Gary Farrll Merlot', '1999', 12);