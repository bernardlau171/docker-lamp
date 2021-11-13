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
