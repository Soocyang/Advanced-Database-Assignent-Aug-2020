DROP TABLE promotion; 

CREATE TABLE promotion(
    promoId         number(11)   NOT NULL,
    promoDesc       varchar(250),
    discountRate    number(4,2)  NOT NULL,
    expiryDate      date         NOT NULL,
    PRIMARY KEY (promoId)
);

/* Data for the table `promotion` */
ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

insert into promotion values(1001,'Flat 50% Off First foodpanda Orders',0.5,'02/11/2020');
insert into promotion values(1002,'12% off + Free Delivery',0.12,'22/12/2020');
insert into promotion values(1003,'Get 10% Off Your Order',0.1,'17/11/2020');
insert into promotion values(1004,'7% Off Selected Restaurants',0.07,'14/11/2020');
insert into promotion values(1005,'5% Off',0.05,'26/11/2020');
insert into promotion values(1006,'Shop with Panda via FoodPanda App',0.12,'09/11/2020');
insert into promotion values(1007,'Up to 50% Off Your Order from Over 15000 Places',0.5,'28/12/2020');
insert into promotion values(1008,'15% Off All Pick-Ups at FoodPanda',0.15,'27/11/2020');
insert into promotion values(1009,'FoodPanda n Panda Milk Tea',0.1,'27/12/2020');
insert into promotion values(1010,'Up to 60% Off Selected Food Panda Restaurants',0.6,'29/12/2020');
insert into promotion values(1011,'Special Discounts For Mobile App Users',0.5,'29/12/2020');
insert into promotion values(1012,'Western Cuisine At Foodpanda',0.1,'07/12/2020');
insert into promotion values(1013,'10% OFF x 3 orders',0.1,'02/12/2020');
insert into promotion values(1014,'Order Online Jer with up to 50% OFF!',0.5,'22/12/2021');
insert into promotion values(1015,'FoodPanda Extra 50% Off Promo Code for New Customer',0.5,'17/11/2021');
insert into promotion values(1016,'Merdeka Off 50% per Order',0.5,'14/11/2021');
insert into promotion values(1017,'Foodpanda Shops Extra 15% Off Promo Code',0.15,'26/11/2021');
insert into promotion values(1018,'FoodPanda x Shell Select Extra 30% Off Promo Code',0.3,'09/12/2020');
insert into promotion values(1019,'FoodPanda Extra 45% Off Promo Code',0.45,'28/12/2021');
insert into promotion values(1020,'KFC x FoodPanda Extra 20% Off Promo Code',0.2,'27/11/2021');
insert into promotion values(1021,'KRR Meals 60% + 25% off with FREE DELIVERY',0.6,'27/12/2021');
insert into promotion values(1022,'Baskin Robbins x FoodPanda Up to 60% Off',0.6,'02/12/2020');
insert into promotion values(1023,'FoodPanda Extra 30% Off March Promo Code',0.3,'22/12/2021');
insert into promotion values(1024,'FoodPanda Kongsi Gong Xi Cashback',0.1,'17/11/2021');
insert into promotion values(1025,'Domino''s Pizza x FoodPanda Extra 50% Off Promotion',0.5,'14/11/2021');
insert into promotion values(1026,'Sukiya x Foodpanda Extra 20% Off',0.2,'26/11/2021');
insert into promotion values(1027,'FoodPanda 62% Off Malaysia Day Promo Code',0.62,'02/12/2020');
insert into promotion values(1028,'OLDTOWN White Coffee x FoodPanda 5% Voucher Code',0.05,'22/12/2021');
insert into promotion values(1029,'Domino''s Pizza x FoodPanda Extra 33% Off',0.33,'17/11/2021');
insert into promotion values(1030,'FoodPanda 6%Off Promo Code',0.06,'14/11/2021');


-- USE LPAD FOR ALIGNMENT

column PROMODESC format a55 
column DISCOUNTRATE format a12 JUSTIFY RIGHT
select  PROMOID, PROMODESC, LPAD(CONCAT(TO_CHAR(DISCOUNTRATE, '0.99'), '%'), 12) AS DISCOUNTRATE, EXPIRYDATE
from promotion;