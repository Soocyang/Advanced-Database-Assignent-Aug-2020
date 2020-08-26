DROP TABLE riders;

CREATE TABLE riders(
    riderId    number(11)   NOT NULL,
    riderName  varchar(100) NOT NULL,
    riderPhone varchar(50)  NOT NULL UNIQUE,
    PRIMARY KEY (riderId)
);

insert into riders values(1001,'Haji Wan Isma bin Shah','+60154355431');
insert into riders values(1002,'Magendran Periasamy','+60130784739');
insert into riders values(1003,'Haji Jamalludin bin Dzulkarnaen Syafrin','+60191238978');
insert into riders values(1004,'R. S. Nagaraj','+60138379852');
insert into riders values(1005,'Naraina a/l Ninian Bastianpillai','+60159394559');
insert into riders values(1006,'Tatparanandam a/l Vishnu','+60195253739');
insert into riders values(1007,'Muhammed Hj Syed Muhd bin Arief','+60169361069');
insert into riders values(1008,'Cheam Fey Tuk','+60166865340');
insert into riders values(1009,'Gary Ngeow Jan Ziang','+60193310644');
insert into riders values(1010,'Muhamad Hj Syed Nasaruddin bin Isa','+60142417000');
insert into riders values(1011,'D. S. Krishnasamy','+60143364784');
insert into riders values(1012,'Mohd Syed Shahru Kamarul bin Nik Taufek','+60158710604');
insert into riders values(1013,'Kasi Thajudeen a/l Sanisvara Rasiah','+60143787434');
insert into riders values(1014,'Kavidhai a/l Mahathir Asirvatham','+60183295504');
insert into riders values(1015,'Au-Yong Gu Liau','+60140518433');
insert into riders values(1016,'Mohamad Syahriman Yuszelan bin Azely','+60131854983');
insert into riders values(1017,'Alex Gnai Jet Thu','+60146057709');
insert into riders values(1018,'Au Geng Jiong','+60192545469');
insert into riders values(1019,'Nik Safie bin Syed Shaifuddin','+60118164014');
insert into riders values(1020,'Dzulfikri Zainul''alam bin Izz Safrifarizal','+60188251872');
insert into riders values(1021,'Mohammed Zufayri bin Ab Hasri','+60184662411');
insert into riders values(1022,'Siauw Lat Lat','+60165876838');
insert into riders values(1023,'M. G. Vijandren','+60198364233');
insert into riders values(1024,'Muhammet Syed Azib Zam bin Shahrol Iman','+60117546730');
insert into riders values(1025,'Ruknuddin Wasil bin Wan Ghazi','+60129724944');
insert into riders values(1026,'Ramesh Saunthararajah a/l Jegathesan Shree','+60180478867');
insert into riders values(1027,'Pria a/l Chakra Shivraj','+60136463674');
insert into riders values(1028,'Wong Vin Fok','+60111980725');
insert into riders values(1029,'Koh Lat Tek','+60189539101');
insert into riders values(1030,'Samy a/l Huzir Shanmuganathan','+60131191145');
insert into riders values(1031,'N. Sasikumar','+60191246320');
insert into riders values(1032,'Sittampalam Puaneswaran a/l Chanturu Tikaram','+60115556209');
insert into riders values(1033,'Haji Iwan Farhan bin Che Zuheeryrizal','+60190927177');
insert into riders values(1034,'Mohamad Wan Zairy Amsyar bin Ishak Suraji','+60184269738');
insert into riders values(1035,'Renuga Arujunan a/l Veetil','+60176061060');
insert into riders values(1036,'Veloo Sivalingam a/l Jeyakumar Marimuthu','+60112892781');
insert into riders values(1037,'Soo Chai Tim','+60145045612');
insert into riders values(1038,'Lok Tien Chau','+60198771921');
insert into riders values(1039,'Quan Yeo Zau','+60133538793');
insert into riders values(1040,'Mohamed Zulhelmi Syafrin bin Che Jamekon','+60179657817');

column RIDERNAME format a50
column RIDERPHONE format a20
select * from riders;