DROP TABLE restaurant;

CREATE TABLE restaurant(
    restaurantId   number(11)   NOT NULL,
    restaurantName varchar(100) NOT NULL,
    restaurantDesc varchar(250),
    contactNumber  varchar(15)  NOT NULL,
    email          varchar(50)  NOT NULL,
    address        varchar(150) NOT NULL,
    city           varchar(50)  NOT NULL,
    state          varchar(50)  NOT NULL,
    postalCode     varchar(15)  NOT NULL,
    operatingHour  varchar(50)  NOT NULL,
    rating         number(2)    NOT NULL,
    PRIMARY KEY (restaurantId)
);

insert into restaurant values(1001,'Domino''s Pizza (Plaza Crystalville)','Domino''s Pizza, Plaza Crystalville Outlet, Famous Pizza restaurant in the world','+60184726383','dominopizza@pizza.com','Unit B2, Ground Floor, Plaza Crystalville,setapak, kuala lumpur, 50480 Kuala Lumpur','Setapak','Kuala Lumpur','50480','10:30 AM - 10:30 PM',4.5);
insert into restaurant values(1002,'Delight gallery Cafe','Delight gallery Cafe','+60124678122','delightcaffe@gmail.com','PA-S-13A GF, Pearl Avenue, Jalan Pasir Emas, 43000 Kajang, Selangor 43000','Kajang','Selangor','43000','11:00 AM - 8:30Pm',4.2);
insert into restaurant values(1003,'Mr Wu','Mr Wu, Kajang','+60123423561','mrwu@gmail.com','13A MKH Boulevard, Jalan Bukit, Kajang','Kajang','Selangor','43000','10:30 AM - 9:30 PM',4.4);
insert into restaurant values(1004,'Kenny Rogers Roasters','Roasters Chickens','+60119922341','roaster@gmail.com','Kajang G-06, Ground floor, Metro Point Complex, Jalan Jelok 8, Off Jalan Semenyih','Kajang','Selangor','43000','10:00 AM - 10:00 PM',4.5);
insert into restaurant values(1005,'KFC Desa Sri Hartamas','Fast-food chain known for its buckets of fried chicken, plus wings n sides.','+60122323451','kfc@kfc.com','1, Jalan 26a/70a, Desa Sri Hartamas, 50480 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur','Desa Sri Hartamas','Kuala Lumpur','50480','8:00 AM - 10:00 PM',3.8);
insert into restaurant values(1006,'McDonald''s Bandar Baru Bangi','Fast food restaurant','+60176041223','mcdonald@email.com','Persiaran Bangi, Seksyen 9, 43650 Bandar Baru Bangi, Selangor','Bangi','Selangor','43650','0:00 AM - 0:00 PM',4.1);
insert into restaurant values(1007,'Mai Sayang Corner','Malaysian food','+60122399981','msc@hotmail.com','Di Hadapan Sri Sayang, Jalan Batu Ferringhi, 11100 Penang','Batu Ferringhi','Penang','11100','11:45 AM - 3:45 PM',4.9);
insert into restaurant values(1008,'Andrew''s Kampung','Malaysian food, andrew''s kampung','+60115698412','andrew@hotmail.com','Eden Parade 2nd Floor, 1-13B, Eden Parade, Jalan Sungai Emas, 11100 Penang','Sungai Emas','Penang','11100','12:30 PM - 9:30 PM',4.8);
insert into restaurant values(1009,'AB Corner','Foodpanda Favourites.E-ftarJuly.deals2020','+60113322145','ab@abcd.com','62, Jalan 2/27a, Seksyen 1 Wangsa Maju, Wilayah Persekutuan Kuala Lumpur, 53300 Kuala Lumpur','Wangsa Maju','Kuala Lumpur','53300','12:30 PM - 11:59 PM',4.1);
insert into restaurant values(1010,'Restoran Ayam Geprek Resipi','Beverages .Malaysian food','+60127827982','ayamgeprek@gmail.com','No. 5, Jalan 3/50 off Jalan Gombak, 53000 Kuala Lumpur','Gombak','Kuala Lumpur','53000','10:45 AM - 6:30 PM',4.2);
insert into restaurant values(1011,'Taiwan Tea House','Chinese.Non-Halal.Noodles.foodpanda Favourites','+60123214561','taiwan@hotmail.com','20-1, Jalan Prima Setapak 3, Off Jalan Genting, 53300 Kuala Lumpur','Setapak','Kuala Lumpur','53300','10:45 AM - 8:30 PM',4.8);
insert into restaurant values(1012,'Marrybrown','Malaysian food.Halal','+60129897651','marry@gmail.com','Ground Floor, Jalan Gopeng Off Jalan Pasar, 41400 Klang','Klang','Selangor','41400','9:00 AM - 8:30 PM',3.2);
insert into restaurant values(1013,'Restaurant Nandi','Malaysian food.Goreng','+60129981675','nandi@gmail.com','No 18 Jalan Tiara 4 Bandar Baru, 41150 Klang','Klang','Selangor','41150','7:30 AM - 7:00 PM',3.6);
insert into restaurant values(1014,'Hiang Kee','Chinese.Rice.Malaysian food','+60197298729','hiangkee@hotmail.com','No 22, Jalan Pasar, 41400 Klang','Klang','Selangor','41400','12:30 PM - 9:30 PM',4.8);
insert into restaurant values(1015,'Nasi Kandar Takbir','Beverages.Malaysian food','+60126739023','takbir@gmail.com','No. 27, 29 Jalan Singgahsana 4A/KU1 Bandar Bukit Raja Klang Selangor, 41050 Klang','Klang','Selangor','41050','8:00 AM - 11:59 PM',4.3);
insert into restaurant values(1016,'Alfa Maju Curry House','Malaysian food.Rice.Soup.Foodpanda Favourites','+60112234142','alfa@maju.com','No. 32G, Ground Floor, Jalan Langkawi 2, Platinum Walk, Danau Kota Setapak KL, 53000 Kuala Lumpur','Setapak','Kuala Lumpur','53000','12:00 AM - 11:59 PM',4.1);
insert into restaurant values(1017,'Restoran Bintang Tujuh Prima Setapak','Indian.Beverages.Malaysian food','+60113335567','tujuh@bintang.com','BG 10, Plaza Perima Setapak, Off Jalan Genting Klang, 53100 Kuala Lumpur','Setapak','Kuala Lumpur','53100','12:00 AM - 11:59 PM',4.5);
insert into restaurant values(1018,'Baskin Robbins ','Desserts.IceCream.Sweets.makan spree','+60116679221','baskin@robin.com','GF-33 n 33A, Ground Floor, The Waterfront @ ParkCity, No. 5, Persiaran Residen, Desa ParkCity, 52200 Kuala Lumpur','Desa ParkCity','Kuala Lumpur','52200','12:30 PM - 9:30 PM',4.8);
insert into restaurant values(1019,'Juice Works','Beverages.Juice','+60119178917','juice@work.com','FOL 5, First Floor, No 3, Jalan 7a/62a, Bandar Manjalara, Kuala Lumpur, Wilayah Persekutuan, 52200 Kuala Lumpur','Bandar Manjalara','Kuala Lumpur','52200','10:15 AM - 7:30 PM',4.7);
insert into restaurant values(1020,'Salt n Spice ','Malaysian food.Noodles.Rice.Soup','+60162334513','salt@spice.com','Lot B-1-6, Plaza Ativo Sofo, No. 1, Jalan PJU 9/1, Damansara Avenue, Bandar Sri Damansara, PJU 9, 52200 Kuala Lumpur., 52200 Kepong','Kepong','Kuala Lumpur','52200','8:30 AM - 9:30 PM',3.2);

 
select count(*) as TotalNumberOfRestaurant
from restaurant;