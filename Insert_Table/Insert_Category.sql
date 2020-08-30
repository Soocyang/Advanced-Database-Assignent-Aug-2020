DROP TABLE category;

CREATE TABLE category(
    categoryId number(11)     NOT NULL,
    categoryName varchar(50)  NOT NULL,
    PRIMARY KEY (categoryId)
);

insert into category values(1001,'American');
insert into category values(1002,'Asian');
insert into category values(1003,'Halal');
insert into category values(1004,'Middle Eastern');
insert into category values(1005,'Beverages');
insert into category values(1006,'Healthy Food');
insert into category values(1007,'Pizza');
insert into category values(1008,'Burgers');
insert into category values(1009,'Indian');
insert into category values(1010,'Seafood');
insert into category values(1011,'Chinese');
insert into category values(1012,'Italian');
insert into category values(1013,'Sushi');
insert into category values(1014,'Desserts');
insert into category values(1015,'Japanese');
insert into category values(1016,'Thai');
insert into category values(1017,'European');
insert into category values(1018,'Korean');
insert into category values(1019,'Vegetarian');
insert into category values(1020,'Fast Food');
insert into category values(1021,'Malaysian food');
insert into category values(1022,'Western');
insert into category values(1023,'Chicken');
insert into category values(1024,'Breakfast');
insert into category values(1025,'Dim Sum');
insert into category values(1026,'Malay');
insert into category values(1027,'Cakes');
insert into category values(1028,'Rice');
insert into category values(1029,'BBQ');
insert into category values(1030,'Snacks');


select count(*) as TotalNumberOfCategory
from category;