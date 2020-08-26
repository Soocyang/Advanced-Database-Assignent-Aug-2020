DROP TABLE categoryList;

CREATE TABLE categoryList(
    restaurantId number(11) NOT NULL,
    categoryId number(11)   NOT NULL,
    PRIMARY KEY (restaurantId, categoryId),
    CONSTRAINT fk_categoryList_category FOREIGN KEY (categoryId) REFERENCES category(categoryId),
    CONSTRAINT fk_categoryList_restaurant FOREIGN KEY (restaurantId) REFERENCES restaurant(restaurantId)
);

insert into categorylist values(1001,1001);
insert into categorylist values(1001,1007);
insert into categorylist values(1001,1022);
insert into categorylist values(1001,1020);
insert into categorylist values(1002,1011);
insert into categorylist values(1002,1020);
insert into categorylist values(1002,1022);
insert into categorylist values(1002,1002);
insert into categorylist values(1003,1023);
insert into categorylist values(1003,1030);
insert into categorylist values(1003,1011);
insert into categorylist values(1004,1017);
insert into categorylist values(1004,1006);
insert into categorylist values(1004,1022);
insert into categorylist values(1004,1023);
insert into categorylist values(1004,1029);
insert into categorylist values(1004,1003);
insert into categorylist values(1005,1020);
insert into categorylist values(1005,1003);
insert into categorylist values(1005,1023);
insert into categorylist values(1005,1024);
insert into categorylist values(1006,1020);
insert into categorylist values(1006,1008);
insert into categorylist values(1006,1024);
insert into categorylist values(1006,1003);
insert into categorylist values(1007,1002);
insert into categorylist values(1007,1003);
insert into categorylist values(1007,1021);
insert into categorylist values(1007,1026);
insert into categorylist values(1007,1028);
insert into categorylist values(1008,1023);
insert into categorylist values(1008,1002);
insert into categorylist values(1008,1021);
insert into categorylist values(1008,1003);
insert into categorylist values(1008,1019);
insert into categorylist values(1009,1022);
insert into categorylist values(1009,1020);
insert into categorylist values(1009,1003);
insert into categorylist values(1010,1021);
insert into categorylist values(1010,1023);
insert into categorylist values(1010,1003);
insert into categorylist values(1010,1028);
insert into categorylist values(1011,1002);
insert into categorylist values(1011,1011);
insert into categorylist values(1011,1021);
insert into categorylist values(1011,1028);
insert into categorylist values(1011,1022);
insert into categorylist values(1011,1014);
insert into categorylist values(1012,1022);
insert into categorylist values(1012,1003);
insert into categorylist values(1012,1008);
insert into categorylist values(1012,1001);
insert into categorylist values(1012,1023);
insert into categorylist values(1013,1021);
insert into categorylist values(1013,1023);
insert into categorylist values(1013,1028);
insert into categorylist values(1013,1003);
insert into categorylist values(1014,1021);
insert into categorylist values(1014,1011);
insert into categorylist values(1015,1005);
insert into categorylist values(1015,1021);
insert into categorylist values(1015,1003);
insert into categorylist values(1016,1021);
insert into categorylist values(1016,1003);
insert into categorylist values(1016,1023);
insert into categorylist values(1016,1028);
insert into categorylist values(1017,1005);
insert into categorylist values(1017,1021);
insert into categorylist values(1017,1009);
insert into categorylist values(1018,1027);
insert into categorylist values(1018,1014);
insert into categorylist values(1019,1005);
insert into categorylist values(1019,1030);
insert into categorylist values(1020,1002);
insert into categorylist values(1020,1005);
insert into categorylist values(1020,1028);
insert into categorylist values(1020,1014);


select count(*) as TotalNumberOfCategoryList
from categorylist;