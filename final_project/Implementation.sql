CREATE TABLE Clients (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(25)
);

CREATE TABLE Cars (
    ID SERIAL PRIMARY KEY,
    Brand VARCHAR(100),
    SpecialNumber VARCHAR(50),
    ClientID INT REFERENCES Clients(ID) ON DELETE CASCADE
);

CREATE TABLE Workers (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Phone VARCHAR(25),
    Position VARCHAR(255)
);

CREATE TABLE Branches (
    ID SERIAL PRIMARY KEY,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(25)
);

CREATE TABLE WorkerBranches (
    ID SERIAL PRIMARY KEY,
    WorkerID INT REFERENCES Workers(ID) ON DELETE CASCADE,
    BranchID INT REFERENCES Branches(ID) ON DELETE CASCADE,
    IsValid BOOLEAN DEFAULT TRUE
);

CREATE TABLE Feedback (
    ID SERIAL PRIMARY KEY,
    ClientID INT REFERENCES Clients(ID) ON DELETE SET NULL,
    Description VARCHAR(400),
    Date DATE
);

CREATE TABLE Prices (
    ID SERIAL PRIMARY KEY,
    DateFrom DATE,
    DateTo DATE,
    Price INT NOT NULL
);

CREATE TABLE Services (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Description VARCHAR(400),
    PriceID INT REFERENCES Prices(ID)
);

CREATE TABLE Orders (
    ID SERIAL PRIMARY KEY,
    Date DATE,
    WorkerBranchID INT REFERENCES WorkerBranches(ID),
    Sum VARCHAR(100),
    CarID INT REFERENCES Cars(ID),
    FeedbackID INT REFERENCES Feedback(ID),
    ServiceID INT REFERENCES Services(ID)
);

INSERT INTO Clients (ID, Name, Email, PhoneNumber) VALUES
(1,'Samat Uulu','samat@gmail.com','+996551001122'),
(2,'Nursultan Bekov','nurbekov@gmail.com','+996770554433'),
(3,'Aigerim Asanova','aigerim@gmail.com','+996501323232'),
(4,'Adilet Zhumabaev','adilet.zh@gmail.com','+996706119911'),
(5,'Marina Petrova','marina.p@gmail.com','+996700778899'),
(6,'Arsen Akylbek','arsen.akyl@gmail.com','+996559999888'),
(7,'Diana Imanova','diana.im@gmail.com','+996703554466'),
(8,'Tilek Tursunov','tilek.tr@gmail.com','+996770110022'),
(9,'Ruslan Ermekov','ruslan.er@gmail.com','+996700998877'),
(10,'Aliya Bektemirova','aliya.bek@gmail.com','+996709770011'),
(11,'Chyngyz Omur','chyngyz.o@gmail.com','+996500123987'),
(12,'Eldar Orozov','eldar.or@gmail.com','+996557777111'),
(13,'Klara Kadyrova','klara.k@gmail.com','+996708888666'),
(14,'Emir Sulaiman','emir.sl@gmail.com','+996709123321'),
(15,'Vladislav Petrov','vlad.p@gmail.com','+996559000112'),
(16,'Alina Toktobek','alina.tt@gmail.com','+996770221122'),
(17,'Beknur Rahim','beknur.rah@gmail.com','+996555888444'),
(18,'Ilya Sorokin','ilya.sr@gmail.com','+996557332211'),
(19,'Azamat Tilek','azamat.t@gmail.com','+996700221100'),
(20,'Madina Yrys','madina.yr@gmail.com','+996701998877');

INSERT INTO Cars (ID, Brand, SpecialNumber, ClientID) VALUES
(1,'Toyota Camry','01KG123ABC',1),
(2,'Honda Fit','02KG456ABZ',1),
(3,'BMW X5','01KG777ZZZ',2),
(4,'Audi A6','01KG111BBB',3),
(5,'Mercedes E200','09KG900QWE',4),
(6,'Lexus LX570','01KG999FAT',5),
(7,'Toyota Prado','01KG455KDA',6),
(8,'Honda Accord','02KG222SSS',7),
(9,'Toyota RAV4','05KG777QAZ',8),
(10,'BMW 320','01KG990POI',9),
(11,'Subaru Forester','07KG551XCC',10),
(12,'Toyota Mark II','01KG777MK2',11),
(13,'Lexus RX350','01KG808LLL',12),
(14,'Mercedes S500','01KG111SRT',13),
(15,'Nissan Skyline','01KG333GTR',14),
(16,'Mazda Axela','02KG909MMM',15),
(17,'Volkswagen Golf','03KG550VVV',16),
(18,'Hyundai Tucson','02KG778HJG',17),
(19,'Kia Optima','01KG660XWZ',18),
(20,'Toyota CHR','01KG123CHR',19),
(21,'Mercedes CLA','09KG333CLA',20),
(22,'Audi Q7','01KG700BIG',6),
(23,'BMW M5','01KG999M5B',4),
(24,'Toyota Alphard','01KG444VIP',7),
(25,'Honda CRV','02KG995CRV',8),
(26,'Hyundai Elantra','03KG778ELA',9),
(27,'Kia Sportage','04KG887SPT',12),
(28,'Lexus ES350','01KG222ESL',13),
(29,'BMW X3','01KG441XTT',17),
(30,'Toyota Corolla','01KG990KOR',20);

INSERT INTO Workers (ID, Name, Phone, Position) VALUES
(1,'Ermek Usubaliev','+996551332211','Washer'),
(2,'Kanat Moldokulov','+996700123456','Detailer'),
(3,'Samat Toktoshev','+996501888999','Administrator'),
(4,'Aiperi Kadyrova','+996702676767','Washer'),
(5,'Tilek Ergeshov','+996709443322','Polisher'),
(6,'Nurlan Bekov','+996700112255','Washer'),
(7,'Altynai Meder','+996557778899','Cashier'),
(8,'Erbol Satybaldi','+996554332211','Detailer'),
(9,'Vlad Lenov','+996559123123','Washer'),
(10,'Erlan Omurzak','+996700334455','Manager'),
(11,'Maksat Sapar','+996701999222','Washer'),
(12,'Alina Tinish','+996502112233','Cashier'),
(13,'Meder Tilek','+996708677543','Polisher'),
(14,'Sanzhar Ergesh','+996707224466','Washer'),
(15,'Dastan Kadyrov','+996550111222','Detailer');

INSERT INTO Branches (ID, Address, PhoneNumber) VALUES
(1,'Bishkek, Chui 120','+996312440011'),
(2,'Bishkek, Gorky 25','+996312550022'),
(3,'Bishkek, Kok-Jar 7','+996312330033'),
(4,'Bishkek, Dordoi 4','+996312440099'),
(5,'Bishkek, Ahunbaeva 98','+996312551100');

INSERT INTO WorkerBranches (ID, WorkerID, BranchID, IsValid) VALUES
(1,1,1,TRUE),(2,2,1,TRUE),(3,3,1,TRUE),(4,4,1,TRUE),
(5,5,2,TRUE),(6,6,2,TRUE),(7,7,2,TRUE),
(8,8,3,TRUE),(9,9,3,TRUE),(10,10,3,TRUE),
(11,11,4,TRUE),(12,12,4,TRUE),(13,13,4,TRUE),
(14,14,5,TRUE),(15,15,5,TRUE),
-- исторические связи
(16,1,2,FALSE),(17,2,3,FALSE),(18,5,1,FALSE),
(19,7,3,FALSE),(20,9,2,FALSE),
(21,11,3,FALSE),(22,14,1,FALSE),(23,10,5,FALSE),
(24,6,4,FALSE),(25,15,1,FALSE);

INSERT INTO Feedback (ID, ClientID, Description, Date) VALUES
(1,1,'Отличная мойка!', '2025-01-10'),
(2,2,'Качественно, но дороговато.', '2025-01-11'),
(3,3,'Салон могли бы лучше протереть.', '2025-01-12'),
(4,4,'Очень понравилось обслуживание.', '2025-01-13'),
(5,5,'Долго ждал очередь.', '2025-01-14'),
(6,6,'Все супер!', '2025-01-15'),
(7,7,'Быстро и аккуратно.', '2025-01-16'),
(8,8,'Не доволен мойкой стекол.', '2025-01-17'),
(9,9,'Постоянно сюда езжу.', '2025-01-18'),
(10,10,'Чисто, приятно, комфортно.', '2025-01-19'),
(11,11,'Персонал дружелюбный.', '2025-01-20'),
(12,12,'Нормально.', '2025-01-21'),
(13,13,'Слишком дорого.', '2025-01-22'),
(14,14,'Качественная полировка!', '2025-01-23'),
(15,15,'Все супер.', '2025-01-24'),
(16,16,'Могли бы быть быстрее.', '2025-01-25'),
(17,17,'Мне понравилось.', '2025-01-26'),
(18,18,'Вернусь ещё.', '2025-01-27'),
(19,19,'Хорошая работа.', '2025-01-28'),
(20,20,'5/5', '2025-01-29');

INSERT INTO Prices (ID, DateFrom, DateTo, Price) VALUES
(1,'2024-01-01','2024-12-31',500),
(2,'2025-01-01',NULL,700),
(3,'2024-01-01','2024-12-31',1500),
(4,'2025-01-01',NULL,2000),
(5,'2023-01-01','2023-12-31',400),
(6,'2022-01-01','2022-12-31',300),
(7,'2025-02-01',NULL,2500),
(8,'2024-04-01','2025-01-01',1000),
(9,'2023-05-01','2024-01-01',800),
(10,'2025-03-01',NULL,3000);

INSERT INTO Services (ID, Name, Description, PriceID) VALUES
(1,'Basic Wash','Внешняя мойка',2),
(2,'Full Wash','Полная мойка',4),
(3,'Polishing','Полировка кузова',7),
(4,'Engine Wash','Мойка двигателя',2),
(5,'Express Wash','Экспресс-услуга',2),
(6,'Deep Saloon Clean','Глубокая чистка салона',10),
(7,'Wax Coating','Нанесение воска',7),
(8,'Tire Shine','Чернение шин',2),
(9,'Interior Vacuum','Пылесос салона',2),
(10,'Dry Cleaning','Химчистка',10),
(11,'Premium Wash','Премиум услуги',10),
(12,'Headlight Polishing','Полировка фар',7);

INSERT INTO Orders (ID, Date, WorkerBranchID, Sum, CarID, FeedbackID, ServiceID) VALUES
(1,'2025-01-10',1,'700',1,1,1),
(2,'2025-01-11',2,'2000',3,2,2),
(3,'2025-01-12',4,'700',4,3,1),
(4,'2025-01-13',3,'2500',2,NULL,3),
(5,'2025-01-14',5,'700',5,4,1),
(6,'2025-01-15',7,'2000',6,5,2),
(7,'2025-01-16',8,'700',7,6,1),
(8,'2025-01-17',9,'2500',8,7,3),
(9,'2025-01-18',10,'2000',9,8,2),
(10,'2025-01-19',11,'3000',10,9,6),
(11,'2025-01-20',12,'700',11,10,1),
(12,'2025-01-21',13,'2000',12,11,2),
(13,'2025-01-22',14,'2500',13,12,3),
(14,'2025-01-23',15,'700',14,13,1),
(15,'2025-01-24',1,'2000',15,14,2),
(16,'2025-01-25',2,'2500',16,15,3),
(17,'2025-01-26',3,'700',17,16,1),
(18,'2025-01-27',4,'2000',18,17,2),
(19,'2025-01-28',5,'3000',19,18,6),
(20,'2025-01-29',6,'700',20,19,1),
(21,'2025-01-30',7,'2500',21,20,3),
(22,'2025-01-31',8,'2000',22,NULL,2),
(23,'2025-02-01',9,'3000',23,NULL,6),
(24,'2025-02-02',10,'700',24,NULL,1),
(25,'2025-02-03',11,'2000',25,NULL,2),
(26,'2025-02-04',12,'2500',26,NULL,3),
(27,'2025-02-05',13,'700',27,NULL,1),
(28,'2025-02-06',14,'2000',28,NULL,2),
(29,'2025-02-07',15,'3000',29,NULL,6),
(30,'2025-02-08',1,'700',30,NULL,1),
(31,'2025-02-09',2,'2000',1,NULL,2),
(32,'2025-02-10',3,'2500',3,NULL,3),
(33,'2025-02-11',4,'700',4,NULL,1),
(34,'2025-02-12',5,'3000',5,NULL,6),
(35,'2025-02-13',6,'700',6,NULL,1),
(36,'2025-02-14',7,'2000',7,NULL,2),
(37,'2025-02-15',8,'2500',8,NULL,3),
(38,'2025-02-16',9,'700',9,NULL,1),
(39,'2025-02-17',10,'2000',10,NULL,2),
(40,'2025-02-18',11,'3000',11,NULL,6);

select * from clients;
select * from branches;
select * from cars;
select * from feedback;
select * from orders; 
select * from prices;
select * from services; 
select * from workers;
select * from workerbranches;
