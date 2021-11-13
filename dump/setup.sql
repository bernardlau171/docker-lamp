CREATE TABLE `team` (
  `tid` int NOT NULL,
  `team_name` varchar(1000) NOT NULL,
  primary key(tid)
 );
 
INSERT INTO team (tid,team_name) VALUES
(1, 'Operation team'),
(2, 'Software development team'),
(3, 'Sales and marketing team');

CREATE TABLE `person` (
  `uid` int NOT NULL,
  `uname` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(1) NOT NULL,
  `salary` int NOT NULL,
  `tid` int NOT NULL,
  primary key(uid),
  foreign key(tid) references team(tid)
);

INSERT INTO `person` (`uid`,`uname`,`age`,`gender`,`salary`, `tid`) VALUES
(1, 'William', 30,'M', 20000, 1),
(2, 'Marc', 17,'M', 20200, 2),
(3, 'John', 55,'M', 25000, 3),
(4, 'May', 35,'F', 15000, 3),
(5, 'Peter', 25,'M', 15000, 2),
(6, 'Andy', 26,'F', 17000, 1),
(7, 'Ben', 28, 'M', 27000, 1),
(8, 'Emma', 28, 'F', 30000, 3),
(9, 'Amelia', 31,'F', 35000, 2),
(10, 'Ken', 35,'M', 37000, 1);


CREATE USER 'William'@'%' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'William'@'%';
CREATE USER 'Marc'@'%' IDENTIFIED BY '54321';
GRANT ALL PRIVILEGES ON *.* TO 'Marc'@'%';
CREATE USER 'John'@'%' IDENTIFIED BY '45641';
GRANT ALL PRIVILEGES ON *.* TO 'John'@'%';
CREATE USER 'May'@'%' IDENTIFIED BY '87456';
GRANT ALL PRIVILEGES ON *.* TO 'May'@'%';
CREATE USER 'Peter'@'%' IDENTIFIED BY '56451';
GRANT ALL PRIVILEGES ON *.* TO 'Peter'@'%';
CREATE USER 'Andy'@'%' IDENTIFIED BY '56451';
GRANT ALL PRIVILEGES ON *.* TO 'Andy'@'%';
CREATE USER 'Ben'@'%' IDENTIFIED BY '56451';
GRANT ALL PRIVILEGES ON *.* TO 'Ben'@'%';
CREATE USER 'Amelia'@'%' IDENTIFIED BY '56451';
GRANT ALL PRIVILEGES ON *.* TO 'Amelia'@'%';
CREATE USER 'Ken'@'%' IDENTIFIED BY '56451';
GRANT ALL PRIVILEGES ON *.* TO 'Ken'@'%';
FLUSH PRIVILEGES;
   

CREATE ROLE 'staff','manager','admin';
GRANT ALL ON *.* TO 'admin';
GRANT SELECT,INSERT,UPDATE,DELETE ON *.* TO 'manager';
GRANT SELECT,INSERT ON *.* TO 'staff';


CREATE TABLE product (
  `pid` int NOT NULL,
  `pname` varchar(20) NOT NULL,
  `price` FLOAT NOT NULL,
  `availability` boolean NOT NULL,
  `stock` int NOT NULL,
  `description` varchar(50) NOT NULL,
primary key(pid) );

INSERT INTO product (`pid`,`pname`,`price`,`availability`,`stock`,`description`) VALUES
(1, 'Meat', 20, true, 5, 'Food'),
(2, 'vegetable', 50, true, 6, 'vegetable'),
(3, 'Fish', 50, true, 10, 'Food'),
(4, 'clothesA', 100, true, 14, 'clothes'),
(5, 'clothesB', 10, true, 4, 'clothes'),
(6, 'clothesC', 10, true, 5, 'clothes');



CREATE TABLE transaction(
  `uid` int NOT NULL,
  `pid` int NOT NULL,
  `tran_date_time` DATETIME NOT NULL,
  `purchase_amount` int NOT NULL,
  `tran_value` FLOAT NOT NULL,
  primary key(uid, pid, tran_date_time),
  foreign key(uid) references person(uid),
  foreign key(pid) references product(pid)
);

INSERT INTO transaction (`uid`,`pid`,`tran_date_time`,`purchase_amount`,`tran_value`) VALUES
(1,1, '2021-12-16 13:17:17', 1, 20),
(1,1, '2021-12-16 15:10:00', 1, 20),
(2,2, '2021-12-16 18:00:10', 1, 50),
(3,3, '2021-12-16 20:10:00', 1, 50);


CREATE TABLE supplier (
  `sid` int NOT NULL,
  `sname` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  primary key(sid)
);
INSERT INTO supplier (`sid`,`sname`,`description`) VALUES
(1,'ABCfood','meat'),
(2,'DEFvegetable', 'vegetable'),
(3,'GHIclothes', 'clothes');




CREATE TABLE supply (
  `pid` int NOT NULL,
  `sid` int NOT NULL,
  `sname` varchar(20) NOT NULL,
  `amount` int NOT NULL,
  `order_price` FLOAT NOT NULL,
  primary key(pid,sid), 
  foreign key(sid) references supplier(sid)
 );


INSERT INTO supply (`pid`,`sid`,`sname`,`amount`,`order_price`) VALUES
(1, 1, 'ABCfood', 5, 250),
(2, 2, 'DEFvegetable',6,300),
(3, 1, 'ABCfood', 10, 500),
(4, 3, 'GHIclothes', 14, 1400),
(5, 3, 'GHIclothes', 4, 40),
(6, 3, 'GHIclothes', 5, 50);

