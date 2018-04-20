CREATE TABLE `addrbook` (
  `ab_id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_name` varchar(15) NOT NULL,
  `ab_email` varchar(50) DEFAULT NULL,
  `ab_comdept` varchar(20) NOT NULL,
  `ab_birth` varchar(10) NOT NULL,
  `ab_tel` varchar(20) DEFAULT NULL,
  `ab_memo` varchar(100) DEFAULT NULL,
  `ab_hakbun` varchar(30) DEFAULT NULL,
  `ab_nickname` varchar(30) DEFAULT NULL,
  `ab_hobby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO addrbook(ab_name,ab_email,ab_comdept,ab_birth,ab_tel,ab_memo,ab_hakbun,ab_nickname,ab_hobby)
VALUES('강경민','sfui@naver.com','소프트웨어학과','1993-02-14','010-3157-5893','착하게살자','2016039014','레젼드강','축구');
INSERT INTO addrbook(ab_name,ab_email,ab_comdept,ab_birth,ab_tel,ab_memo,ab_hakbun,ab_nickname,ab_hobby)
VALUES('최동민','9092832@naver.com','소프트웨어학과','1993-06-25','010-8608-5298','가즈아ㅏㅏ','2014041057','Ann','숙면');
INSERT INTO addrbook(ab_name,ab_email,ab_comdept,ab_birth,ab_tel,ab_memo,ab_hakbun,ab_nickname,ab_hobby)
VALUES('희지따리','hij0411@hanmail.net','소프트웨어학과','1997-04-11','010-6866-2364','오늘의 메모없음ㅎㅎ','2016039034','쿠마','태권도');
