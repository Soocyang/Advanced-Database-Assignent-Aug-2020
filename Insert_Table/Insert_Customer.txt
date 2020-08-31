DROP TABLE customers; 

CREATE TABLE customers(
     customerId     number(11)   NOT NULL,
     customerName   varchar(100) NOT NULL,
     phone          varchar(50)  NOT NULL UNIQUE,
     email          varchar(50)  NOT NULL UNIQUE,
     address        varchar(150) NOT NULL,
     city           varchar(50)  NOT NULL,
     state          varchar(50)  NOT NULL,
     postalCode     varchar(15)  NOT NULL,
     credits        number(5,2)  DEFAULT 10.00,
     PRIMARY KEY (customerId)
);

insert into customers values (1001, 'Liong Zet Kaa', '+60131645069', 'liongaa@gmail.com', '1St Floor Bangunan Kerjasama Jln Dhoby 80000 Johor Johor 80000 Malaysia', 'Johor Bahru', 'Johor', '80000',20.3);
insert into customers values (1002, 'Nur Zakdatul binti Wan Rashid Ridhwan', '+60134422557', 'nurzan@gmail.com', 'Ground Floor Blok 5 Flat Sri Johor Jln Cheras 56000 Wilayah Persekutuan 56000 Malaysia', 'Kuala Lumpur', 'Wilayah Persekutuan', '56000',167.04);
insert into customers values (1003, 'Nuur Fasha Zizi', '+60169561421', 'nuurfaizi@gmail.com', '2 Wisma Polarwood 220G Jln Satok 93400Kuching Sarawak 93400 MalaysiaSarawak 93400 Malaysia', 'Kuching', 'Sarawak', '93400',45.37);
insert into customers values (1004, 'Hafiy bin Wan Dan Haiqal', '+60196122478', 'hafiyal@gmail.com', 'No. 91 5Th Floor Jln Tuanku Abdul Rahman 50100 Wilayah Persekutuan 50100 Malaysia', 'Kuala Lumpur', 'Wilayah Persekutuan', '50100',239.25);
insert into customers values (1005, 'Mahathir Rajendran a/l Karnail Dharmalingam', '+60123452641', 'mahagam@gmail.com', 'No. 42 Lrg Raja Bot 50300 Wilayah Persekutuan 50300 Malaysia', 'Kuala Lumpur', 'Wilayah Persekutuan', '50300',194.16);
insert into customers values (1006, 'Mohammed Hj Nik Hannan Muzammil bin Aziz', '+60192489427', 'mohamziz@gmail.com', 'No. 507 Jln Datuk Ajibah Abol 93400SarawakSarawak 93400 Malaysia', 'Kuching', 'Sarawak', '93400',163.75);
insert into customers values (1007, 'Maizatul binti Noorismadi', '+60132737347', 'maizadi@gmail.com', 'No. 91 5Th Floor Jln Tuanku Abdul Rahman 50100 Wilayah Persekutuan 50100 Malaysia', 'Kuala Lumpur', 'Wilayah Persekutuan', '50100',228.01);
insert into customers values (1008, 'Haanii a/l Munshi Soti', '+60139550057', 'haaniioti@gmail.com', 'A 24 Jln Ss3/41 Ss3 Petaling Jaya', 'Petaling Jaya', 'Selangor', '47300',36.81);
insert into customers values (1009, 'Saraswati Singh a/l Maha', '+60125410027', 'sarasha@gmail.com', 'Block D-6-11 Jalan Peel Cochrane 1', 'Kuala Lumpur', 'Wilayah Persekutuan', '55100',219.55);
insert into customers values (1010, 'Devamany Ponnusamy', '+60165497804', 'devamy@gmail.com', 'Jalan U1/25a, Hicom Glenmarie Industrial Park,'  , 'Shah Alam', 'Selangor', '40150',53.02);
insert into customers values (1011, 'Nuur Hjh Izzatul Ramlan binti Che Sahamudin', '+60192163628', 'nuurhdin@gmail.com', 'No. 81-M, Plaza Damansara Jalan Medan Setia 1 Bukit Damansara,'  , 'Kuala Lumpur', 'Wilayah Persekutuan', '50490',228.26);
insert into customers values (1012, 'Noor Masitah Azrin binti Che Shaikh', '+60170046120', 'noormakh@gmail.com', 'G 71 Jln Persisiran Perling Taman Perling', 'Johor Bahru', 'Johor', '81200',199.41);
insert into customers values (1013, 'Manikavasagam a/l Kundan Lal', '+60149590783', 'maniklal@gmail.com', '1A 1St Floor Lts Perajurit 6 Taman', 'Ipoh', 'Perak', '31400',198.71);
insert into customers values (1014, 'Muhamad Nik Zainuddin Zainorazman bin Yahaya', '+60175533384', 'muhaya@gmail.com', 'Jalan Teratai, Taman Sultan Badlishah,'  , 'Alor Setar', 'Kedah', '15050',61.43);
insert into customers values (1015, 'D. S. Sathianathan', '+60116353567', 'dssathan@gmail.com', '5915 Jln Genting Kelang', 'Kuala Lumpur', 'Wilayah Persekutuan', '53300',36.37);
insert into customers values (1016, 'Suresh Dhillon', '+60191303863', 'sureon@gmail.com', '1B Jln Loke Yew Bentong', 'Bentong', 'Pahang', '28700',127.65);
insert into customers values (1017, 'Nurul Hjh Ayu binti Asyraf Halib', '+60169652666', 'nurulib@gmail.com', 'No. 133 Jln Glasiar Taman Tasik', 'Johor Bahru', 'Johor', '80200',69.34);
insert into customers values (1018, 'Lian Bang Chong', '+60133281055', 'lianbng@gmail.com', 'No. 48 Jln Toman 4 Kemayan Square', 'Seremban', 'Negeri Sembilan', '70200',75.01);
insert into customers values (1019, 'Swarna Nijhar a/l Sothinathan', '+60184104045', 'swarnan@gmail.com', 'Jalan SS 21-39, Damansara Utama,'  , 'Petaling Jaya', 'Selangor', '47400',196.04);
insert into customers values (1020, 'Yiaw Hor Fern', '+60171640576', 'yiawhern@gmail.com', 'Plot 98 Perusahaan Maju 8 Bukit Tengah Industrial Park', 'Perai', 'Penang', '13600',119.08);
insert into customers values (1021, 'Gheetha Mudukasan a/l Vishnu Rajakumar', '+60185589972', 'gheetmar@gmail.com', '2 39 Jln 2/114A Taman Indrahana', 'Kuala Lumpur', 'Wilayah Persekutuan', '58200',182.13);
insert into customers values (1022, 'E. Nandakumar', '+60172378118', 'enandar@gmail.com', '1 Kompleks Pasar Besar Gerai Makan GM/028 Jalan Meru', 'Klang', 'Selangor', '41050',30.66);
insert into customers values (1023, 'Nguei Mek Goo', '+60160168906', 'ngueimoo@gmail.com', 'Kawasan Perindustrian Bukit Rambai, Mukim Tanjung Minyak,'  , 'Melaka', 'Melaka', '75250',214.49);
insert into customers values (1024, 'Rueben Arivanathan a/l Krishen Dhaliwal', '+60142934054', 'ruebenwal@gmail.com', 'No. 10 Jalan Tan Khim Seck Kluang Baru Kluang', 'Johor Bahru', 'Johor', '86000',216.36);
insert into customers values (1025, 'Mohamad Norsilan Wafi', '+60173613256', 'mohafi@gmail.com', 'Persiaran Desa Tambun 2C, Taman Rimba Tambun,'  , 'Ipoh', 'Perak', '31400',93.32);
insert into customers values (1026, 'Lyndel Luo Ai Pooi', '+60138241259', 'lyndooi@gmail.com', 'G Majestic Square G11 Jln Othman Seksyen 3 Petaling Jaya', 'Petaling Jaya', 'Selangor', '46000',220);
insert into customers values (1027, 'Bai Pai Sui', '+60153534842', 'baipaiui@gmail.com', 'No. 3 Transmark Corporation Sdn Bhd Jln Tp 3 Tmn Perindustrian Sime Uep', 'Petaling Jaya', 'Selangor', '47600',44.32);
insert into customers values (1028, 'Manjit Thanabalasingam', '+60195249348', 'manjgam@gmail.com', 'Jalan Berkat 3, Taman Malim Jaya,'  , 'Melaka', 'Melaka', '75250',90.22);
insert into customers values (1029, 'Norain binti Hakimi', '+60160825927', 'norami@gmail.com', 'Jalan 1/70C, Mont  Kiara,'  , 'Kuala Lumpur', 'Wilayah Persekutuan', '50480',122.47);
insert into customers values (1030, 'Mohd Che Jahari bin Ghazi', '+60190570486', 'mohdazi@gmail.com', 'Jalan Tun Sambanthan 4, Brickfields,'  , 'Kuala Lumpur', 'Wilayah Persekutuan', '50470',138.24);
insert into customers values (1031, 'Chanturu Shivraj', '+60144790583', 'chanraj@gmail.com', 'No. 4828, Mak Mandin Industrial Estate,'  , 'Butterworth', 'Pulau Pinang', '13400',45.52);
insert into customers values (1032, 'Mohd Nik Osman Razali', '+60145094411', 'mohdli@gmail.com', 'No. 4233 Jln Skudai Batu 5 3/4', 'Johor Bahru', 'Johor', '81200',245.31);
insert into customers values (1033, 'Mohd Haji Syed Azraai Azhari bin Amirul Yunus', '+60190900424', 'mohdnus@gmail.com', '11 Psn Sepakat 3 Taman Endah Jaya', 'Ipoh', 'Perak', '31350',14.31);
insert into customers values (1034, 'Siauw Sit Yi', '+60179719546', 'siautyi@gmail.com', '31A Jalan Laksamana 6 Taman Mewah Jaya', 'Klang', 'Selangor', '41200',159.95);
insert into customers values (1035, 'Mohammed Haji Che Zulhilmi Bahrodin bin Muzzammil', '+60127644619', 'mohammmil@gmail.com', 'Kg. Banggol Saman Kok Lanas, Ketereh,'  , 'Kota Bharu', 'Kelantan', '16450',175.03);
insert into customers values (1036, 'Shanti a/l Janil', '+60159510758', 'shanil@gmail.com', 'No. 192 B Jln Batu Unjur 7 Taman Bayu Perdana', 'Klang', 'Selangor', '41200',69.24);
insert into customers values (1037, 'Tse Aw Rei', '+60140052357', 'tseawei@gmail.com', 'No. 22B Jalan Pandan Indah 1/23A', 'Kuala Lumpur', 'Wilayah Persekutuan', '55100',245.53);
insert into customers values (1038, 'Nathasa binti Fadzil', '+60117171138', 'nathzil@gmail.com', 'A 91 Jln Glasiar Taman Tasik', 'Johor Bahru', 'Johor', '80200',200.25);
insert into customers values (1039, 'Sum Loi Mui', '+60129773624', 'sumlui@gmail.com', '5 Bgn Sultan Abdul Aziz Shah 16 Jln Utara Seksyen 11 Petaling Jaya Malaysi', 'Petaling Jaya', 'Selangor', '46200',29.7);
insert into customers values (1040, 'Tai Aik Hok', '+60196535321', 'taiahok@gmail.com', '18 Wisma Bumiraya Jln Raja Laut', 'Kuala Lumpur', 'Wilayah Persekutuan', '50350',77.71);
insert into customers values (1041, 'Kevin Luo Luo Thong', '+60112269231', 'kevinong@gmail.com', '3 10 Jln Ss2/67 Ss2 Petaling Jaya', 'Petaling Jaya', 'Selangor', '47300',134.16);
insert into customers values (1042, 'Cheng Tiak Yow', '+60139466636', 'chengtow@gmail.com', 'No 1 Jalan Perusahaan Ringan 3 Off Jalan Bagan Lallang Butterworth', 'Ipoh', 'Perak', '13400',122.32);
insert into customers values (1043, 'Noor Nursyakirah Samsul binti Darul Harmaini', '+60199873278', 'noorini@gmail.com', 'G 13 JlnSerian Batu 9 9Th Mile Industrial Estate Kuching Ma', 'Kuching', 'Sarawak', '93250',35.24);
insert into customers values (1044, 'Thoo Liew Tou', '+60184962286', 'thoolou@gmail.com', 'No. 16    16A Jalan Tun Abdul Razak', 'Ipoh', 'Perak', '30200',144.12);
insert into customers values (1045, 'Rattan a/l Gobalakrishnan', '+60158971066', 'rattanan@gmail.com', 'No. 3000, Jalan Baru,'  , 'Perai', 'Pulau Pinang', '13700',189.43);
insert into customers values (1046, 'Tse Zai Gok', '+60173113770', 'tsezgok@gmail.com', '3046-G Persiaran Raja Muda Musa', 'Klang', 'Selangor', '42000',231.75);
insert into customers values (1047, 'Che Jefrie bin Shaheila Sulong', '+60181035006', 'chejong@gmail.com', 'G 38 Jln 8/23E Danau Kota', 'Kuala Lumpur', 'Wilayah Persekutuan', '53300',30.59);
insert into customers values (1048, 'Vijaya Lourdenadin a/l Selvakkumar Sodhy', '+60192788748', 'vijayadhy@gmail.com', '1438 Jln Perbadanan Pending Industrial Estate Kuching Malay', 'Kuching', 'Sarawak', '93450',37.86);
insert into customers values (1049, 'Kiran Parthiban a/l Diljit Sathasivam', '+60171063403', 'kiranpvam@gmail.com', 'No. 535 Jln Persisiran Perling 1 Taman Perling', 'Johor Bahru', 'Johor', '81200',84.91);
insert into customers values (1050, 'Rohan Kaveri a/l Yosri Lakshmi', '+60115232138', 'rohankmi@gmail.com', 'No. K292, Jalan Bendahara,'  , 'Ipoh', 'Perak', '31650',254.11);
insert into customers values (1051, 'Premnath Rao a/l Linggam', '+60165386768', 'premgam@gmail.com', 'Plaza Angsana, Pusat Bandar Tampoi,'  , 'Johor Bahru', 'Johor', '81200',242.19);
insert into customers values (1052, 'Hjh Shahirah Zikry', '+60144245623', 'hjhshary@gmail.com', 'Jalan 1, Taman Sri Ukay,'  , 'Ampang', 'Selangor', '68000',233.78);
insert into customers values (1053, 'Umasundari a/l Devan Rayer', '+60140688920', 'umasuner@gmail.com', '2 Jln 51A/222 Seksyen 51A Petaling Jaya', 'Petaling Jaya', 'Selangor', '46100',245.95);
insert into customers values (1054, 'Muhammed Jefrie Hanafi bin Bakri', '+60120995170', 'muhakri@gmail.com', 'No 4.23, Complex Pertama Jalan Tuanku Abdul Rahman,'  , 'Kuala Lumpur', 'Wilayah Persekutuan', '50100',224.39);
insert into customers values (1055, 'Muhamed Nik Shafie Amin bin Zarif', '+60171312837', 'muhamrif@gmail.com', 'No. 5 A Jln 14/20 Seksyen 14 Petaling Jaya', 'Petaling Jaya', 'Selangor', '46100',177);
insert into customers values (1056, 'Siauw Ke Tok', '+60139895318', 'siautok@gmail.com', '87 Jln Sutera 1 Taman Sentosa', 'Johor Bahru', 'Johor', '80150',194.68);
insert into customers values (1057, 'Nur Mysarah binti Ali', '+60195892086', 'nurmysali@gmail.com', '1132/77 Jln Kapar Batu 4 1/2 Rantau Panjang Rantau Panjang Kelantan Malay', 'Klang', 'Selangor', '42100',65.55);
insert into customers values (1058, 'P. Vinod', '+60144288543', 'pvinood@gmail.com', '536 Tkt 1 Jln Haruan 4/6 Oakland Comm l Ctr', 'Seremban', 'Negeri Sembilan', '70300',226.41);
insert into customers values (1059, 'Muhamad Wan Lufty bin Syed Zulhakimi Samsul', '+60172507040', 'muhamasul@gmail.com', '11C Jln Petaling Utama 6 Tamam Petaling Utama Petaling Jaya', 'Petaling Jaya', 'Selangor', '46000',36.91);
insert into customers values (1060, 'Hj Izzul bin Khasri', '+60162920239', 'hjizsri@gmail.com', 'Jalan Tempua 4, Bandar Puchong Jaya,'  , 'Puchong', 'Selangor', '47100',169.8);
insert into customers values (1061, 'Kwok Choon Tiek', '+60133881945', 'kwokchek@gmail.com', 'Jalan PJS 11/20, Bandar Sunway,'  , 'Petaling Jaya', 'Selangor', '46150',199.3);
insert into customers values (1062, 'Nurul Eva Fadillah binti Qayyuum', '+60192428855', 'nuruleuum@gmail.com', '14 Jln Serawak Taman Sentosa Kuala', 'Kuala Perlis', 'Perlis', '20000',155.34);
insert into customers values (1063, 'Nur Arissa Shamizan', '+60137615900', 'nurarzan@gmail.com', '35 Jln Sg Besi Batu 3 1/2 Seksyen 92A', 'Kuala Lumpur', 'Wilayah Persekutuan', '57100',119.43);
insert into customers values (1064, 'Cham Tian Yan', '+60197431321', 'chamyan@gmail.com', '9 Laluan Tasek Timur 15 Taman Mewah Bercham', 'Ipoh', 'Perak', '31400',244.83);
insert into customers values (1065, 'Yong Thur Mon', '+60157611393', 'yongthmon@gmail.com', 'No. 19 Lkg Sultan Hishamuddin Kaw 20 Kaw Indust Bdr Sultan Suleiman Pelabuhan Pelabuhan', 'Petaling Jaya', 'Selangor', '42000',240.98);
insert into customers values (1066, 'En Jiet Tiu', '+60179272705', 'enjietiu@gmail.com', '6th Floor Wisma Central Jalan Ampang', 'Kuala Lumpur', 'Wilayah Persekutuan', '50450',139.17);
insert into customers values (1067, 'Muhamad Kasim Zuraidi bin Wan Hoirussalam', '+60150292494', 'muhamam@gmail.com', '2691 Jln Cinta Alam Country Heights Kajang', 'Kajang', 'Selangor', '43000',71.25);
insert into customers values (1068, 'Rama a/l Gengadharan', '+60171393284', 'ramaan@gmail.com', 'Jalan Anggerik Vanilla N31/N, Kota Kemuning, Shah Alam'  , 'Shah Alam', 'Selangor', '40460',173.25);
insert into customers values (1069, 'Tam Shok Tatt', '+60145986917', 'tamshoatt@gmail.com', '2 9 Jln Molek 1/9 Taman Molek', 'Johor Bahru', 'Johor', '81100',95.23);
insert into customers values (1070, 'K. R. Sidhu', '+60153595119', 'krsidhu@gmail.com', 'Jalan 3/37A, Kawasan Industri Taman Bukit Maluri, 52100'  , 'Kuala Lumpur', 'Wilayah Persekutuan', '37672',193.31);
insert into customers values (1071, 'Nur Hanani Muslim binti Syed Noorizman', '+60182108867', 'nurhanan@gmail.com', '197 Batu 4 1/2 Jalan Skudai Danga Bay', 'Johor Bahru', 'Johor', '80200',52.09);
insert into customers values (1072, 'Mohammad Al-afnan Daniel bin Mahmusin', '+60147593471', 'mohammin@gmail.com', 'A 18 Jln 21/12 Seksyen 21 Petaling Jaya', 'Petaling Jaya', 'Selangor', '46300',164.52);
insert into customers values (1073, 'Nurul Syafiqa binti Dzulfikri', '+60170181089', 'nurukri@gmail.com', 'Lot 2110 Sri Senawang Light Industrial 4 1/2 Miles Jalan Tampin Neger', 'Seremban', 'Negeri Sembilan', '70450',42.67);
insert into customers values (1074, 'M. G. Rabinder', '+60121227665', 'mgraber@gmail.com', 'No. 20 2Nd Floor Jln 4/4C Desa Melawati', 'Kuala Lumpur', 'Wilayah Persekutuan', '53100',98.01);
insert into customers values (1075, 'Leng Bow Teu', '+60114964278', 'lengboteu@gmail.com', '18, Lebuhraya Kampung Jawa,'  , 'Bayan Lepas', 'Pulau Pinang', '11900',95.74);
insert into customers values (1076, 'Alex Mak Gunn Hu', '+60140973640', 'alexnhu@gmail.com', '20 G Jln Ara Sd 7/3A Taman Sri Damansara', 'Kuala Lumpur', 'Wilayah Persekutuan', '52200',51.85);
insert into customers values (1077, 'T. Sangalimuthu', '+60127240701', 'tsanghu@gmail.com', '17 JlnSerian Batu 17 Pekan Siburan Siburan Siburan', 'Kuching', 'Sarawak', '94200',86.03);
insert into customers values (1078, 'Nur Nurafrina binti Kholis Fairos', '+60150120316', 'nurnuos@gmail.com', '6Th Floor Bloka2 Pusat Dagang Setia Jaya Jln Lama Pusat Dagang Setia Jay', 'Petaling Jaya', 'Selangor', '47300',129.95);
insert into customers values (1079, 'Nur Shakinah Mahat binti Hamidoon Fayyad', '+60185378480', 'nurshayad@gmail.com', 'G 25 Jln Pjs 11/28B Taman Bandar Sunway Petaling Jaya', 'Petaling Jaya', 'Selangor', '46150',224.14);
insert into customers values (1080, 'Mohammad Haji Nik Afiq Akid bin Nik Enidzullah', '+60159599200', 'mohamah@gmail.com', '2620 Mukim 1 Jalan Jelawat Kawasan Perusahaan Seberang Jaya', 'Perai', 'Penang', '13700',111.42);
insert into customers values (1081, 'Nik Luqmanul Suraji bin Khairubi Hafiz', '+60197466692', 'niklufiz@gmail.com', '3Rd Floor Blok A Megan Phoenix Jln Cheras Km 10', 'Kuala Lumpur', 'Wilayah Persekutuan', '56100',172.54);
insert into customers values (1082, 'Anita a/l Sarjit', '+60187227588', 'anitajit@gmail.com', '1 Jalan 6/42 Taman Sejahtera', 'Kuala Lumpur', 'Wilayah Persekutuan', '51200',147.95);
insert into customers values (1083, 'Nur Hjh Dylaila Hishhram', '+60150373712', 'nurhjham@gmail.com', '104-104A Jln Tanjong Tokong Tanjong Tokong Georgetown', 'Georgetown', 'Pulau Pinang', '10470',178.23);
insert into customers values (1084, 'Vellu Pereira a/l Malayalam', '+60139557929', 'velllam@gmail.com', '12 Jln Rengas Kaw 5 Taman Selatan', 'Klang', 'Selangor', '41200',255.04);
insert into customers values (1085, 'Suhadah Jani binti Izzikry', '+60143887711', 'suhadkry@gmail.com', '20A 1St Floor Lrg Medan Tuanku 1', 'Kuala Lumpur', 'Wilayah Persekutuan', '50300',59.45);
insert into customers values (1086, 'Balqis Adi binti Anam', '+60154918161', 'balqisnam@gmail.com', 'No. 3A Jalan Ss21/37 Damansara Utama', 'Petaling Jaya', 'Selangor', '47400',127.55);
insert into customers values (1087, 'Mohammad Athari bin Sameer', '+60163526046', 'mohammeer@gmail.com', '22 Jln Rumbia 20 Taman Daya', 'Johor Bahru', 'Johor', '81100',226.19);
insert into customers values (1088, 'Nuur Syifa Danial binti Harith', '+60151160325', 'nuurth@gmail.com', '1 Pending Commercial Centre 8686 Jln Pending Kuching Malays', 'Kuching', 'Sarawak', '93450',120.51);
insert into customers values (1089, 'Rizli bin Isroman', '+60190557338', 'rizliman@gmail.com', 'No. 20 2Nd Floor Jln Damai Perdana 1/8A Bandar Damai Perdana Malaysi', 'Kuala Lumpur', 'Wilayah Persekutuan', '56000',174.43);
insert into customers values (1090, 'P''ng Ti Yao', '+60112468644', 'pngtiyao@gmail.com', 'No. 119 1St Floor Jln Ss20/10 Ss20', 'Petaling Jaya', 'Selangor', '47400',60.89);
insert into customers values (1091, 'Ku Fu Sho', '+60140206153', 'kufusho@gmail.com', '42 Jln Bunga Tanjong 2 Senawang Industrial Park', 'Seremban', 'Negeri Sembilan', '70450',145.53);
insert into customers values (1092, 'Leng Lung Zo', '+60174956284', 'lenglzo@gmail.com', '1 F29 Jln Padungan Taman Sri Kuching', 'Kuching', 'Sarawak', '93100',237.3);
insert into customers values (1093, 'Hj Che Andri bin Nurhazrul Nafiz', '+60171375748', 'hjcheiz@gmail.com', 'No. 4 Jln Tebrau Lama Kampung Stulang Baru', 'Johor Bahru', 'Johor', '81100',71.93);
insert into customers values (1094, 'Xia Bok Chih', '+60175125891', 'xiabohih@gmail.com', '8 Ltg Sungai Keramat 6A Taman Utama', 'Klang', 'Selangor', '42100',186.27);
insert into customers values (1095, 'Jagdeep a/l Serbegeth Jassal', '+60143031526', 'jagdal@gmail.com', 'C 305 Jln Tuanku Abdul Rahman', 'Kuala Lumpur', 'Wilayah Persekutuan', '50100',150.91);
insert into customers values (1096, 'Hee Pik Tin', '+60111287890', 'heepiin@gmail.com', 'Jalan Kampung, Kampung Baru Sungai Buloh,'  , 'Sungai Buloh', 'Selangor', '47000',200.49);
insert into customers values (1097, 'Noraisyah binti Khan', '+60142669697', 'noraian@gmail.com', 'Kompleks Karamunsing P.O. Box , Pejabat Pos Beverly,'  , 'Kota Kinabalu', 'Sabah', '30336',250.01);
insert into customers values (1098, 'Muhammad Nik Khairil bin Daiman', '+60119208644', 'muhammman@gmail.com', '701 Jalan Gunong Rapat Kampung Baru Gunong Rapat', 'Ipoh', 'Perak', '31350',36.53);
insert into customers values (1099, 'Hajjah Weni Shaifuddin binti Nik Khatta', '+60162116646', 'hajjta@gmail.com', 'Jalan SS22/21, Damansara Jaya,'  , 'Petaling Jaya', 'Selangor', '47400',253.14);
insert into customers values (1100, 'Su Chet Beh', '+60176365710', 'sucheeh@gmail.com', '42 JLN 52/4 SEKSYEN 52 Petaling Jaya', 'Petaling Jaya', 'Selangor', '46200',142.34);
insert into customers values (1101, 'Nur Hajjah Intan binti Shafiq Haron', '+60130860567','nurhajon@gmail.com', 'No. 88 2Nd Floor Jln Dato Haji Eusoff', 'Kuala Lumpur', 'Wilayah Persekutuan', '50400',169.38);
insert into customers values (1102, 'Kwong Yuan Hoe', '+60156768091','kwonoe@gmail.com', 'No.31 Jalan Ss 17/1A Subang Jaya', 'Petaling Jaya', 'Selangor', '47500',46.7);
insert into customers values (1103, 'Ching Hao Teng', '+60159834545','chingng@gmail.com', 'Suite 1501 1502 15Th Floor Wisma Hang Sam Jalan Hang Lekir', 'Kuala Lumpur', 'Wilayah Persekutuan', '50000',38.65);
insert into customers values (1104, 'Cheah Hao Fong', '+60171185997','cheahfon@gmail.com', 'NT. 5372, Batu 5.5 Jln Apas Kinabutan,', 'Tawau', 'Sabah', '10301',249.53);
insert into customers values (1105, 'Priya a/l Nandakumar', '+60111208253', 'priyaaar@gmail.com', '1 342 Jln Wilayah Persekutuan', 'Ipoh', 'Perak', '51200',58.13);
insert into customers values (1106, 'Luo Ken Teng', '+60127438254', 'luokenng@gmail.com', '304 1 Lrg 7 Off Jalan Rubber Kuching', 'Kuching', 'Sarawak', '93400',188.74);
insert into customers values (1107, 'Azizah Kahar binti Azrul Syahrin', '+60136492626', 'azizain@gmail.com', '13 Jln Tembaga Sd 5/2F Taman Sri Damansara', 'Kuala Lumpur', 'Wilayah Persekutuan', '52100',150.24);
insert into customers values (1108, 'Nor Zatalini binti Ashraf', '+60126998851', 'norzaf@gmail.com', 'Seksyen U19, Kampung Baru Sungai Buloh,'  , 'Sungai Buloh', 'Selangor', '47000',133.31);
insert into customers values (1109, 'D. S. Prashanthini', '+60184839476', 'dsprasni@gmail.com', '8 Majestic Square 813 Jln Othman Seksyen 3 Petaling Jaya', 'Petaling Jaya', 'Selangor', '46000',240.69);
insert into customers values (1110, 'Karamjit Retinam', '+60168280983', 'karamjnam@gmail.com', 'Sri Cemerlang, Off Jalan Pengkalan Chepa,'  , 'Kota Bharu', 'Kelantan', '15400',56.21);
insert into customers values (1111, 'Priya Sakwati a/l Uthayakumar', '+60111577634', 'priyar@gmail.com', 'No. 9 Jalan Pantai Jerjak 15 Sungai Nibong', 'Bayan Lepas', 'Penang', '11900',81.84);
insert into customers values (1112, 'Mah Hen Khai', '+60132492440', 'mahhehai@gmail.com', '12 Menara Mutiara Bangsar 8 Jln Liku', 'Kuala Lumpur', 'Wilayah Persekutuan', '59100',21.92);
insert into customers values (1113, 'Muhamed Nik Mokhtar Zehnei bin Putra Syauqi', '+60189052295', 'muhameqi@gmail.com', '73 JLN 1/12 SEKSYEN 1 Petaling Jaya', 'Petaling Jaya', 'Selangor', '46000',49.66);
insert into customers values (1114, 'Nur Farzana Ifwat binti Che Asmin Subhi', '+60184666575', 'nurfarbhi@gmail.com', '9 Lrg Ss13/3A Ss13 Petaling Jaya', 'Petaling Jaya', 'Selangor', '47500',251.97);
insert into customers values (1115, 'Cheok Chee Ee', '+60135039021', 'cheokcee@gmail.com', '9431 Jln Young Kampung Baru Pendamaran Pelabuhan Pelabuhan', 'Klang', 'Selangor', '42000',19.99);
insert into customers values (1116, 'Nuur Hajjah Aliaa Hasmawi binti Che Noordin', '+60113375938', 'nuurhin@gmail.com', '43 Jln Batu 2 1/2 Taman Wangi Bentong Bentong Pahang Bentong Pahang Malay', 'Kuala Lumpur', 'Wilayah Persekutuan', '28700',256.84);
insert into customers values (1117, 'Asha Rajannaidu a/l Indi Pakiam', '+60160234258', 'ashaam@gmail.com', '49 A Jalan Sulam Taman Sentosa', 'Johor Bahru', 'Johor', '80150',112.35);
insert into customers values (1118, 'Haanii Dharmalingam', '+60116530003', 'haanam@gmail.com', 'Stesen Minyak Petronas Jln Batang Kali Batang Kali Batang Kali', 'Ipoh', 'Perak', '44300',89.79);
insert into customers values (1119, 'Luo Ken Teng', '+60114457016', 'lkt@gmail.com', '9 Lrg Ramal 1/1 Taman Ramal Indah', 'Kajang', 'Selangor', '43000',124.28);
insert into customers values (1120, 'Azizah Kahar binti Azrul Syahrin', '+60164623953', 'arizah@gmail.com', '2 69 Jln Setia Bakti Bukit Damansara', 'Kuala Lumpur', 'Wilayah Persekutuan', '50490',189.52);
insert into customers values (1121, 'Khaleisya Zulkafli binti Che Samsul', '+60159639875', 'khalesul@gmail.com', 'No. 10  12 Jalan Bagan Nira 26/8, Seksyen 26,'  , 'Shah Alam', 'Wilayah Persekutuan', '40400',201.88);
insert into customers values (1122, 'Gavin Lai Enn Tean', '+60164703914', 'gavinan@gmail.com', '2Nd Floor, Jalan Diplomatik, Precint 15'  , 'Putrajaya', 'WP Putrajaya', '62050',254.88);
insert into customers values (1123, 'Kum Len Sam', '+60166881053', 'kumlam@gmail.com', '2-1-30A Jalan 34/26 Wisma Rampai Taman Sri Rampai Setapak', 'Kuala Lumpur', 'Wilayah Persekutuan', '53300',87.5);
insert into customers values (1124, 'Lim Sum Sam', '+60169287778', 'limsumam@gmail.com', 'No. 35 Jln Bunga Tanjung 18 Taman Seraya', 'Kuala Lumpur', 'Wilayah Persekutuan', '56100',40.98);
insert into customers values (1125, 'K. Dhillon', '+60139743767', 'kdhilllon@gmail.com', '284 Jln Simbang Taman Perling', 'Johor Bahru', 'Johor', '81200',154.34);
insert into customers values (1126, 'Angie Siow Woon Yew', '+60161453492', 'angiew@gmail.com', 'No. 30 Jln Mewah Ria Satu/4 Taman Bukit Mewah', 'Johor Bahru', 'Johor', '81200',178.65);
insert into customers values (1127, 'Yam Guk Kan', '+60148626252', 'yamguan@gmail.com', '3rd Floor Kenanga International Jalan Sultan Ismail', 'Kuala Lumpur', 'Wilayah Persekutuan', '50250',53.88);
insert into customers values (1128, 'Hajjah Antaza binti Zulfikar', '+60175483877', 'hajjakar@gmail.com', 'A 469 Jln Bercham Taman Ramai', 'Ipoh', 'Perak', '31400',104.4);
insert into customers values (1129, 'Nuur Nursyuhadah binti Shahrul Musa', '+60122919091', 'nuurnuusa@gmail.com', '440 G Lrg 9 Off Jalan Ang Cheng Ho Kuching', 'Kuching', 'Sarawak', '93100',79.24);
insert into customers values (1130, 'Sybil a/l Thamil', '+60137824582', 'sybilmil@gmail.com', 'Seksyen U19, Kampung Baru Sungai Buloh,'  , 'Sungai Buloh', 'Selangor', '47000',220.47);
insert into customers values (1131, 'Mohamad Azam Sabri bin Syed Mahmusin Shukor', '+60172380051', 'mohamor@gmail.com', '48 Jln Ss2/67 Ss2 Petaling Jaya', 'Petaling Jaya', 'Selangor', '47300',250.16);
insert into customers values (1132, 'Muhamed Haji Nazari Maszuni bin Rostan', '+60174937579','muhaman@gmail.com', '4105 Jln Kapar Batu 3', 'Klang', 'Selangor', '41400',89.9);
insert into customers values (1133, 'Jess Ngo Yue Dang', '+60144786476', 'jessng@gmail.com', 'No. 124 Jln Serampang Taman Pelangi', 'Johor Bahru', 'Johor', '80400',230.58);
insert into customers values (1134, 'Soffia binti Basri', '+60137965271', 'soffri@gmail.com', 'No. 149 Tingkat 1, Jalan Pasar Baru,'  , 'Bahau', 'Negeri Sembilan', '72100',62.6);
insert into customers values (1135, 'Phuah Mow Keng', '+60138598048', 'phuahmng@gmail.com', '8 Jln Sungai Pusu Indian Settlement Gombak', 'Kuala Lumpur', 'Wilayah Persekutuan', '53100',250.14);
insert into customers values (1136, 'Rueben Nagappan a/l Baljit Sekhar', '+60152290086', 'ruebenar@gmail.com', 'Lorong S2 A6/7, Green Street Homes 1,'  , 'Seremban', 'Negeri Sembilan', '70300',181.78);
insert into customers values (1137, 'Kavita Vengatarakoo a/l Magendran Lakshmi', '+60161736992', 'kavitmi@gmail.com', '6 Blok F Phileo D\ Sara 1 Jln 16/11 Off Jln Damansara Seksyen 16 Petaling Jaya 4', 'Petaling Jaya', 'Selangor', '46350',209.74);
insert into customers values (1138, 'Nurul Hajjah Lina Fayyad binti Mustaqim', '+60137192482', 'nurulhqim@gmail.com', '11 Jln U1/26 Hicom Glenmarie Industrial Shah Alam Shah Alam', 'Shah Alam', 'Selangor', '40000',15.15);
insert into customers values (1139, 'Nga Goh Fen', '+60167357591', 'ngagoen@gmail.com', '8929/50 Jln Telok Gong Kampung Telok Gong Telok Gong Pelabuhan', 'Klang', 'Selangor', '42000',148.06);
insert into customers values (1140, 'Addy Foong Ker Khan', '+60184269401', 'addyfoan@gmail.com', '27 Pusat Penjaja Medan Kidd', 'Ipoh', 'Perak', '30250',250.3);
insert into customers values (1141, 'Thang Fon Ther', '+60185853309', 'thangfher@gmail.com', '22-1-A Jalan 3/42A Taman Sejahtera[ Off Jln Kuching]', 'Kuala Lumpur', 'Wilayah Persekutuan', '51200',139.22);
insert into customers values (1142, 'Mohd Wan Shamsul Man', '+60186248961', 'mohdwman@gmail.com', '2 Bangunan Syed Kechik Jln Kapas Bukit Bandaraya Mala', 'Kuala Lumpur', 'Wilayah Persekutuan', '59100',194.33);
insert into customers values (1143, 'Sybil a/l Nandakumar', '+60197589552', 'sybiar@gmail.com', 'E-08-02 Subang Square Jalan SS 15/4G', 'Petaling Jaya', 'Selangor', '47500',59.8);
insert into customers values (1144, 'Siaw Shao Siu', '+60191780938', 'siawshiu@gmail.com', '2 Jln Tembaga Sd 5/2B Taman Sri Damansara Kepong', 'Kuala Lumpur', 'Wilayah Persekutuan', '52100',134.5);
insert into customers values (1145, 'Balachandra Munusamy a/l Rueben Haridas', '+60110736420', 'balachas@gmail.com', '60 Jln Medang Serai Bukit Bandaraya', 'Kuala Lumpur', 'Wilayah Persekutuan', '59100',78.75);
insert into customers values (1146, 'Haji Khairudin bin Wan Nawawi', '+60138932344', 'hajiawi@gmail.com', '16 Menara Maa 12 Jln Dewan Bahasa', 'Kuala Lumpur', 'Wilayah Persekutuan', '50460',31.04);
insert into customers values (1147, 'King Liew Zeah', '+60142923264', 'kinglah@gmail.com', '9 Jaln Beside Midvaly, Wilayah Persekutuan, WP'  , 'Klang', 'Selangor', '58000',54.03);
insert into customers values (1148, 'Sutheaswari Jassal a/l Mogan Selvarajoo', '+60135991084', 'suthejoo@gmail.com', '9 Jalan TS 6/8 Taman Industri Subang', 'Petaling Jaya', 'Selangor', '47510',237.51);
insert into customers values (1149, 'David Soh Chan Long', '+60178591063', 'davidng@gmail.com', '579 Jalan Mawar 3 Taman Marida', 'Seremban', 'Negeri Sembilan', '70450',250.97);
insert into customers values (1150, 'T. Krishnasamy', '+60134076837', 'tkrishamy@gmail.com', 'No 19 Jalan Bunga Kantan Taman P Ramlee Setapak', 'Kuala Lumpur', 'Wilayah Persekutuan', '53000',36.55);
insert into customers values (1151, 'Mohamad Hj Syed Mukhtar bin Fikri Yajid', '+60157256437', 'mohaid@gmail.com', 'No. 50 Jln E1/2 Kawasan Industries Kepong', 'Kuala Lumpur', 'Wilayah Persekutuan', '52100',86.97);
insert into customers values (1152, 'Kwok Ten She', '+60131557120', 'kwokshe@gmail.com', 'A 109 Jln Meranti Merah Taman Kebun Teh', 'Johor Bahru', 'Johor', '80250',103.18);
insert into customers values (1153, 'Kunjiraman Nagarajan a/l Cumaraswamy', '+60152331077', 'kunjamy@gmail.com', 'Bangunan MIEL 3 Jalan 31/10A Taman Perindustrian IKS', 'Kuala Lumpur', 'Wilayah Persekutuan', '68100',104.43);
insert into customers values (1154, 'M. Swarna', '+60195729392', 'mswana@gmail.com', 'Jalan Pjs 11/2, Taman Subang Indah,', 'Petaling Jaya', 'Selangor', '46000',198.7);
insert into customers values (1155, 'Depan a/l Balasubramaniam Kaveri', '+60158601418', 'depaneri@gmail.com', '10 Luh Keluli Kaw Perindustrian Bukit Raja', 'Klang', 'Selangor', '41050',25.93);
insert into customers values (1156, 'Rasammah a/l Sarath Krishnan', '+60176299439', 'rasammnan@gmail.com', 'Jalan Sbc 6, Taman Sri Batu Caves,'  , 'Batu Caves', 'Selangor', '68100',171.23);
insert into customers values (1157, 'M. Menon', '+60146436733', 'mmennon@gmail.com', 'Jalan U1/35, Hicom-glenmarie Industrial Park,'  , 'Shah Alam', 'Selangor', '40150',115.82);
insert into customers values (1158, 'Haji Wan Muid bin Sharizal', '+60147286019', 'hajiwzal@gmail.com', 'A 286 Jln Bandar 11 Taman Melawati Hulu', 'Klang', 'Selangor', '53100',55.16);
insert into customers values (1159, 'Mohamad Haiqal Effendi bin Izzikry', '+60136761095', 'mohamary@gmail.com', '3 Jln Bunga Raya 3 Taman Bunga Raya Malay', 'Seremban', 'Negeri Sembilan', '70400',146.26);
insert into customers values (1160, 'Leng Shuk Cai', '+60156817136', 'lengcai@gmail.com', 'No. 64 Jalan Bercham Taman Sri Dermawan', 'Ipoh', 'Perak', '31400',38.27);
insert into customers values (1161, 'D. S. Pandithan', '+60196829194', 'dspanan@gmail.com', '267 1B Jalan Hulubalang 28 Taman Sentosa', 'Klang', 'Selangor', '41200',21.53);
insert into customers values (1162, 'Shanthi Ganapathy a/l Pavandeep', '+60146340283', 'shaneep@gmail.com', 'G 32 Jln China Kuching', 'Kuching', 'Sarawak', '93000',139.78);
insert into customers values (1163, 'Karpal Rasiah a/l Harikrish Devaraj', '+60188952132', 'karpalaj@gmail.com', 'Lot 680 Kawasan Perindustrian 2 Pengkalan Chepa Kota Bharu', 'Kota Bharu', 'Kelantan', '16100',75.98);
insert into customers values (1164, 'K. L. Tikaram', '+60143815518', 'kltikaam@gmail.com', 'Lorong Machang 3, Taman Machang Manis,'  , 'Bukit Mertajam', 'Pulau Pinang', '14000',33.77);
insert into customers values (1165, 'Padathan Vanajah', '+60163123055', 'padathah@gmail.com', 'Blok C 37B 5 Jln Pju 1/39 Dataran Prima Petaling Jaya', 'Petaling Jaya', 'Selangor', '47301',121.29);
insert into customers values (1166, 'Huzaifi Zani bin Wan Maliki', '+60147044832', 'huzaiki@gmail.com', 'No 11. Lorong Kerongsang 9D Bandar Puteri', 'Klang', 'Selangor', '42000',124.48);
insert into customers values (1167, 'Muhammet Shahrol Fahim bin Wan Muzamil Rusli', '+60147620259', 'muhammli@gmail.com', '16 Jln Dian 1 Taman Munshi Ibrahim', 'Johor Bahru', 'Johor', '81200',40.12);
insert into customers values (1168, 'Hang Zian Tuk', '+60179244315', 'hangtuk@gmail.com', '1B 24 Jln Pandan 3/2 Taman Pandan Jaya', 'Kuala Lumpur', 'Wilayah Persekutuan', '55100',253.24);
insert into customers values (1169, 'Luo Mum Liat', '+60166276022', 'luomumat@gmail.com', '31 Jln Sibu 16 Taman Wahyu', 'Kuala Lumpur', 'Wilayah Persekutuan', '68100',162.89);
insert into customers values (1170, 'Nur Filza Ayyadi binti Azrie Kahar', '+60145898088', 'nurfilhar@gmail.com', '10Th Floor Wisma Mca Jln Ampang', 'Kuala Lumpur', 'Wilayah Persekutuan', '50450',81.81);
insert into customers values (1171, 'Nur Nadwah Syauqi binti Amirul', '+60116381780', 'nurnadul@gmail.com', '294 Jln Sungai Bertek Taman Bertek', 'Klang', 'Selangor', '41100',174.43);
insert into customers values (1172, 'Nurul Nadhrah Zuhaili binti Wan Aznan Shazman', '+60119737785', 'nuruan@gmail.com', '912 Jln Gubah Pending Industrial Estate Kuching', 'Kuching', 'Sarawak', '93450',125.9);
insert into customers values (1173, 'Hj Abdullah Muain bin Shaifuddin', '+60140875566', 'hjabddin@gmail.com', 'Pusat Perdagangan Seksyen 8, Jalan Sungai Jernih 8/1,'  , 'Petaling Jaya', 'Selangor', '46150',97.6);
insert into customers values (1174, 'E. Vadiveloo', '+60195042145', 'evadoo@gmail.com', '22A 2 Jln Pjs 8/2 Dataran Mentari Petaling Jaya', 'Petaling Jaya', 'Selangor', '46050',122.65);
insert into customers values (1175, 'Tong Quok Men', '+60173277330', 'tongqen@gmail.com', '4.1 Menara Pelangi Jalan Kuning Taman Pelangi', 'Johor Bahru', 'Johor', '80400',133.94);
insert into customers values (1176, 'See Leiu Haw', '+60127303110', 'seeleiaw@gmail.com', 'SG WAY BREWERY JLN LAMA KAMPUNG TUN ISMAIL Petaling Jaya', 'Petaling Jaya', 'Selangor', '46000',130.07);
insert into customers values (1177, 'Kee Fee Zia', '+60174085550', 'keefeia@gmail.com', '2 54 Jln 1/76D Desa Pandan', 'Kuala Lumpur', 'Wilayah Persekutuan', '55100',190.39);
insert into customers values (1178, 'Gnai Khian Pun', '+60134394173', 'gnaikhpun@gmail.com', '1St Floor Wisma Tractors Jln Ss 16/1 Ss16', 'Petaling Jaya', 'Selangor', '47500',219.49);
insert into customers values (1179, 'Ayuni binti Murshed', '+60195338497', 'ayunied@gmail.com', 'No. 12, Jalan Yap Kwan Seng,'  , 'Kuala Lumpur', 'Wilayah Persekutuan', '50450',217.7);
insert into customers values (1180, 'Mohammad Nik Fazril bin Salleh Yaqin', '+60188720998', 'mohaqin@gmail.com', 'Lot 5    6, Sri Kemajuan Industrial Estate, Mile 61/2'  , 'Kuala Lumpur', 'Wilayah Persekutuan', '55100',158.05);
insert into customers values (1181, 'Loi Rou Kean', '+60132621532', 'loiroean@gmail.com', '43 Psn Raja Muda Musa Pelabuhan Pelabuhan', 'Klang', 'Selangor', '42000',77.87);
insert into customers values (1182, 'Nor Hjh Hamizah Zaimi binti Wan Dazila', '+60110232484', 'norhila@gmail.com', 'No. 117-1 Jalan Puteri 5/3, Bandar Puteri Puchong,'  , 'Puchong', 'Selangor', '47100',58.14);
insert into customers values (1183, 'Nor Syazliya Sanorhizam', '+60114844777', 'norsyam@gmail.com', '20 Jalan Dato Abdul Hamid 5 Taman Sentosa', 'Klang', 'Selangor', '41200',15.13);
insert into customers values (1184, 'Ramya Sodhy a/l Rajeswary', '+60159702496', 'ramyry@gmail.com', 'Southern City Hypermarket Jln Suria 19 Taman Suria', 'Johor Bahru', 'Johor', '81100',21.13);
insert into customers values (1185, 'D. S. Munusamy', '+60155031696', 'dsmumy@gmail.com', '10 Plaza Mont Kiara Blok E Jln 1/70C', 'Kuala Lumpur', 'Wilayah Persekutuan', '50480',139.44);
insert into customers values (1186, 'Nurul Batrisya binti Syed Amin Sabri', '+60163219765', 'nurulbbri@gmail.com', '36 Menara Maybank Jln Tun Perak', 'Kuala Lumpur', 'Wilayah Persekutuan', '50050',19.75);
insert into customers values (1187, 'Siva a/l Ash', '+60175587817', 'sivaalsh@gmail.com', '1A 27 Jln Perdana 6/6 Taman Pandan Perdana', 'Kuala Lumpur', 'Wilayah Persekutuan', '55100',153.02);
insert into customers values (1188, 'E. Govindasamy', '+60188488598', 'egovinmy@gmail.com', '14 Jalan Sri Sarawak 20 Taman Sri Andalas', 'Klang', 'Selangor', '41200',176.99);
insert into customers values (1189, 'Janet Quek Liem Bae', '+60129030989', 'janetae@gmail.com', 'Taman Sri Manja, Off Jalan Klang Lama,'  , 'Petaling Jaya', 'Selangor', '46000',233.78);
insert into customers values (1190, 'Mohamad Razlan Azhan bin Nur''irfaan', '+60113269752', 'mohamaaan@gmail.com', 'F1/14B 1St Floor Citypoint Kompleks Dayabumi Jalan Hishamuddin 50', 'Kuala Lumpur', 'Wilayah Persekutuan', '50050',130.7);
insert into customers values (1191, 'Nii Qiu Siong', '+60186961877', 'niiqing@gmail.com', 'No. 57 A Jln Meldrum', 'Johor Bahru', 'Johor', '80000',84.74);
insert into customers values (1192, 'Lum Lih Gan', '+60196284318', 'lumlihan@gmail.com', 'Lot Jalan Kampung Banjar', 'Perak Darul Ridzuan', 'Teluk Intan', '11776',203.91);
insert into customers values (1193, 'Siti binti Ihsan', '+60167408237', 'sitian@gmail.com', 'Jalan Pju 1/42A Block E2, Dataran Prima,'  , 'Petaling Jaya', 'Selangor', '47301',204.08);
insert into customers values (1194, 'Cheah Chin Ther', '+60192150026', 'cheahher@gmail.com', 'No. 73 Jln Alor Kuala Lumpur', 'Kuala Lumpur', 'Wilayah Persekutuan', '50200',29.97);
insert into customers values (1195, 'Hajjah Sofeah Zainal binti Hermansah', '+60154763844', 'hajjahah@gmail.com', '9Th Floor Mni Tower 2 No. 11 Jalan Pinang', 'Kuala Lumpur', 'Wilayah Persekutuan', '50450',14.82);
insert into customers values (1196, 'Nurul Hajjah Aidatul Ros binti Che Zahani', '+60158686454', 'nurulhani@gmail.com', 'No. 57 A Jln Meldrum', 'Johor Bahru', 'Johor', '80000',90.8);
insert into customers values (1197, 'Quak Yuan Siou', '+60153710290', 'quakyuou@gmail.com', 'Jalan Pju 1/42A Block E2, Dataran Prima,'  , 'Petaling Jaya', 'Selangor', '47301',69.72);
insert into customers values (1198, 'Karamjit a/l Janil', '+60177262358', 'karail@gmail.com', 'off medan putra 4, medan putra bussiness centre.,'  , 'Kuala Lumpur', 'Wilayah Persekutuan', '52200',192.44);
insert into customers values (1199, 'Subramaniam a/l Devamany Nahappan', '+60120213131', 'subraman@gmail.com', 'Lot 259-260 Ground Floor    1St Floor Jalan Sungai Padungan', 'Kuching', 'Sarawak', '93100',242.81);
insert into customers values (1200, 'Nurul Hjh Sulaiha Al-hakim binti Nik Tukimin', '+60163094372', 'nurulhin@gmail.com', '27-25, jalan selat selatan 5a landpac ind park, port'  , 'Klang', 'Selangor', '42000',57.47);


column CUSTOMERNAME format a50
column PHONE format a30
column EMAIL format a20
column CREDITS format $999.00

select CUSTOMERID, CUSTOMERNAME, EMAIL, CONCAT('RM',TO_CHAR(CREDITS, '999.99'))
from customers;

