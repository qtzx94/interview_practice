-- 创建慕课网 imooc
CREATE DATABASE IF NOT EXISTS imooc DEFAULT CHARACTER SET 'UTF8';

-- 打开 imooc
USE imooc;

-- 用户表 user
CREATE TABLE IF NOT EXISTS imooc_user(
id INT,
username VARCHAR(20),
password CHAR(32),
email VARCHAR(50),
age TINYINT,
card CHAR(18),
tel CHAR(11),
salary FLOAT(8,2),
married TINYINT(1),
addr VARCHAR(100),
sex ENUM('男','女','保密')
)ENGINE=InnoDB CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS test_primary_key(
	id INT UNSIGNED PRIMARY KEY,
	username VARCHAR(20)
);

INSERT test_primary_key(id, username) VALUES(1, 'king');

CREATE TABLE test_primary_key2(
	id INT UNSIGNED,
	courseId INT UNSIGNED,
	username VARCHAR(20),
	email VARCHAR(50),
	PRIMARY KEY(id,courseId)
);

CREATE TABLE test_auto_increment(
	id INT UNSIGNED KEY AUTO_INCREMENT,
	username VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS `imooc_user`(
	`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '用户编号',
	`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
	`password` CHAR(32) NOT NULL UNIQUE COMMENT '密码',
	`email` VARCHAR(50) NOT NULL UNIQUE COMMENT '邮箱',
	`age` TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',
	`sex` ENUM('男','女','保密') NOT NULL DEFAULT '保密' COMMENT '性别',
	`tel` CHAR(11) NOT NULL UNIQUE COMMENT '电话',
	`addr` VARCHAR(50) NOT NULL DEFAULT '北京' COMMENT '地址',
	`card` CHAR(18) NOT NULL UNIQUE COMMENT '身份证号',
	`married` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0代表未结婚，1代表已结婚',
	`salary` FLOAT(8,2) NOT NULL DEFAULT 0 COMMENT '薪水'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE user3(
	id INT UNSIGNED AUTO_INCREMENT KEY,
	username VARCHAR(20) NOT NULL,
	age TINYINT UNSIGNED NOT NULL DEFAULT 18,
	password CHAR(32) NOT NULL,
	email VARCHAR(10) NOT NULL
);

ALTER TABLE user3
MODIFY username VARCHAR(20) NOT NULL UNIQUE;

CREATE TaBLE user4(
	id INT UNSIGNED,
	username VARCHAR(20) NOT NULL
);

CREATE TaBLE user5(
	id INT UNSIGNED AUTO_INCREMENT KEY,
	username VARCHAR(20) NOT NULL
);

CREATE TABLE user6(
	id INT UNSIGNED AUTO_INCREMENT KEY,
	username VARCHAR(20) NOT NULL UNIQUE,
	password CHAR(32) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE test_myisam(
	a INT UNSIGNED,
	b VARCHAR(20),
	c CHAR(32)
)ENGINE=MyISAM;

CREATE TABLE myisam_1(
	a CHAR(30),
	id INT
)ENGINE=MyISAM;

CREATE TABLE myisam_2(
	a VARCHAR(30),
	id INT
)ENGINE=MyISAM;

CREATE TABLE test_innodb(
	id INT UNSIGNED AUTO_INCREMENT KEY,
	username VARCHAR(20) NOT NULL 
);

CREATE DATABASE IF NOT EXISTS king DEFAULT CHARACTER SET 'UTF8';
USE king;
CREATE TABLE IF NOT EXISTS user(
	id INT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	username VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
	age TINYINT UNSIGNED DEFAULT 18 COMMENT '年龄',
	email VARCHAR(50) NOT NULL DEFAULT '674955272@qq.com' COMMENT '邮箱'
)ENGINE=InnoDB CHARSET=UTF8;


CREATE TABLE IF NOT EXISTS `user1`(
	`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '用户编号',
	`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
	`age` TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',
	`sex` ENUM('男','女','保密') NOT NULL DEFAULT '保密' COMMENT '性别',
	`addr` VARCHAR(50) NOT NULL DEFAULT '北京' COMMENT '地址',
	`married` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0代表未婚，1代表已婚',
	`salary` FLOAT(8,2) NOT NULL DEFAULT 0 COMMENT '薪水'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;




CREATE DATABASE IF NOT EXISTS test2 DEFAULT CHARACTER SET 'UTF8';
USE test2;

CREATE TABLE IF NOT EXISTS `emp`(
	`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '用户编号',
	`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
	`age` TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',
	`sex` ENUM('男','女','保密') NOT NULL DEFAULT '保密' COMMENT '性别',
	`tel` CHAR(11) NOT NULL UNIQUE COMMENT '电话',
	`addr` VARCHAR(50) NOT NULL DEFAULT '北京' COMMENT '地址',
	`depId` TINYINT UNSIGNED NOT NULL COMMENT '部门对应的编号'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT emp(username,age,depId) VALUES('king',24,1),
('queen',25,2),
('imooc',26,1),
('lily',27,1),
('rose',28,3),
('john',29,3);

CREATE TABLE IF NOT EXISTS `dep`(
	id TINYINT UNSIGNED AUTO_INCREMENT KEY,
	depName VARCHAR(50) NOT NULL UNIQUE,
	depDesc VARCHAR(100) NOT NULL DEFAULT ''
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT dep(depName, depDesc) VALUES('PHP部门','研发PHP课件'),
('JAVA部门','研发JAVA课件'),
('WEB前端部门','WEB前端课件'),
('IOS部门','研发IOS课件');

SELECT emp.id,emp.username,emp.age,dep.depName FROM emp,dep;

SELECT e.id,e.username,e.age,d.depName 
FROM emp AS e 
INNER JOIN dep AS d 
ON e.depId=d.id;

SELECT e.id,e.username,e.age,d.depName,d.depDesc
FROM emp AS e
LEFT OUTER JOIN dep AS d
ON e.depId=d.id;

SELECT e.id,e.username,e.age,d.depName,d.depDesc
FROM emp AS e
RIGHT OUTER JOIN dep AS d
ON e.depId=d.id;

--一张表
CREATE TABLE IF NOT EXISTS `user`(
	`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
	`email` VARCHAR(50) NOT NULL DEFAULT '674955272@qq.com' COMMENT '邮箱',
	`proName` VARCHAR(10) NOT NULL DEFAULT '浙江' COMMENT '用户所在省份'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT user(username,proName) VALUES('a','北京'),
('b','哈尔滨'),
('c','上海'),
('d','深圳'),
('e','广州'),
('f','重庆');

--拆成两张表
CREATE TABLE IF NOT EXISTS `provinces`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`proName` VARCHAR(10) NOT NULL UNIQUE COMMENT '省份名称'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT province(proName) VALUES('北京'),
('上海'),
('深圳');

CREATE TABLE IF NOT EXISTS `user`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
	`email` VARCHAR(50) NOT NULL DEFAULT '674955272@qq.com' COMMENT '邮箱',
	`proId` TINYINT UNSIGNED COMMENT '用户所在省份的编号'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT user(username,proId) VALUES('a',1),
('b',1),
('c',1),
('d',2),
('e',3),
('f',1),
('g',1);

--三表联查（不要超过三表，性能不好）
--省份表
CREATE TABLE IF NOT EXISTS `provinces`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`proName` VARCHAR(10) NOT NULL UNIQUE COMMENT '省份名称'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT provinces(proName) VALUES('北京'),
('上海'),
('深圳');
--管理员表
CREATE TABLE IF NOT EXISTS `admin`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
	`email` VARCHAR(50) NOT NULL DEFAULT '674955272@qq.com' COMMENT '邮箱',
	`proId` TINYINT UNSIGNED NOT NULL COMMENT '用户所在省份的编号'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT admin(username,proId) VALUES('king',1),
('queen',2);
--商品分类表
CREATE TABLE IF NOT EXISTS `cate`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`cateName` VARCHAR(50) NOT NULL UNIQUE COMMENT '商品编号',
	`cateDesc` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '商品分类的描述'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT cate(cateName) VALUES('母婴'),
('服装'),
('电子');
--商品表
CREATE TABLE IF NOT EXISTS `products`(
	`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`productName` VARCHAR(50) NOT NULL UNIQUE COMMENT '商品名称',
	`price` FLOAT(8,2) NOT NULL DEFAULT '0' COMMENT '价格',
	`cateId` TINYINT UNSIGNED NOT NULL COMMENT '商品所在分类的编号',
	`adminId` TINYINT UNSIGNED NOT NULL COMMENT '管理员编号'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT products(productName,price,cateId,adminId) 
VALUES('IPhoneX',9888,3,1),
('adidas',388,2,2),
('nike',888,2,2),
('奶瓶',288,1,1);

--查询products id productName price -- cate cateName
SELECT p.id,p.productName,p.price,c.cateName 
FROM products AS p 
INNER JOIN cate AS c 
ON p.cateId=c.id;

--查询管理员id username email -- provinces proName
SELECT a.id,a.username,a.email,p.proName 
FROM admin AS a 
INNER JOIN provinces AS p 
ON a.proId=p.id;

--查询products表 id productName price
--cate表 cateName
--admin表 username email
SELECT p.id,p.productName,p.price,c.cateName,a.username,a.email
FROM products AS p
INNER JOIN cate AS c
ON c.id=p.cateId
INNER JOIN admin AS a
ON a.id=p.adminId
WHERE p.price<1000
ORDER BY p.price DESC
LIMIT 0,2;


--新闻分类表
CREATE TABLE IF NOT EXISTS `news_cate`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`cateName` VARCHAR(50) NOT NULL UNIQUE COMMENT '分类名称',
	`cateDesc` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分类描述'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT news_cate(cateName) VALUES('国内新闻'),
('国际新闻'),
('娱乐新闻'),
('体育新闻');

CREATE TABLE IF NOT EXISTS `news`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`title` VARCHAR(100) NOT NULL UNIQUE COMMENT '新闻标题',
	`content` VARCHAR(1000) NOT NULL COMMENT '新闻内容',
	`cateId` TINYINT NOT NULL COMMENT '新闻所属分类编号'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT news(title,content,cateId) VALUES('a1','aaaa1',1),
('a2','aaaa2',1),
('a3','aaaa3',4),
('a4','aaaa4',2),
('a5','aaaa5',3);

--查询news id title content 
--news_cate cateName
SELECT n.id, n.title,n.content,c.cateName 
FROM news AS n 
INNER JOIN news_cate AS c 
ON n.cateId=c.id;

INSERT news(title,content,cateId) VALUES('a6','aaaa6',45);


--添加外键约束（保证数据一致性和完整性）
CREATE TABLE IF NOT EXISTS `news_cate`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`cateName` VARCHAR(50) NOT NULL UNIQUE COMMENT '分类名称',
	`cateDesc` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分类描述'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS `news`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`title` VARCHAR(100) NOT NULL UNIQUE COMMENT '新闻标题',
	`content` VARCHAR(1000) NOT NULL COMMENT '新闻内容',
	`cateId` TINYINT UNSIGNED NOT NULL COMMENT '新闻所属分类编号',
	FOREIGN KEY(cateId) REFERENCES `news_cate`(id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT news_cate(cateName) VALUES('国内新闻'),
('国际新闻'),
('娱乐新闻'),
('体育新闻');

INSERT news(title,content,cateId) VALUES('a1','aaaa1',1),
('a2','aaaa2',1),
('a3','aaaa3',4),
('a4','aaaa4',2),
('a5','aaaa5',3);

CREATE TABLE IF NOT EXISTS `news_cate`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`cateName` VARCHAR(50) NOT NULL UNIQUE COMMENT '分类名称',
	`cateDesc` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分类描述'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS `news`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`title` VARCHAR(100) NOT NULL UNIQUE COMMENT '新闻标题',
	`content` VARCHAR(1000) NOT NULL COMMENT '新闻内容',
	`cateId` TINYINT UNSIGNED NOT NULL COMMENT '新闻所属分类编号',
	CONSTRAINT cateId_fk_newsCate FOREIGN KEY(cateId) REFERENCES `news_cate`(id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

ALTER TABLE news
ADD FOREIGN KEY(cateId) REFERENCES news_cate(id)
ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE IF NOT EXISTS `stu`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '学员名称',
	`score` TINYINT UNSIGNED NOT NULL COMMENT '学员考试分数'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT stu(username,score) VALUES('king',95),
('queen',75),
('zhangsan',69),
('lisi',78),
('wangwu',87),
('zhaoliu',88),
('tianqi',98),
('ceshi',99),
('tiancai',50);

CREATE TABLE IF NOT EXISTS level(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`score` TINYINT UNSIGNED COMMENT '分数'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE user1(
	id int UNSIGNED AUTO_INCREMENT KEY,
	username VARCHAR(20)
)SELECT id,username FROM emp;

CREATE TABLE IF NOT EXISTS `cate`(
	`id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
	`cateName` VARCHAR(100) NOT NULL UNIQUE COMMENT '分类名称',
	`pId` SMALLINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT cate(cateName,pId) VALUES('服装',0),
('数码',0),
('玩具',0);


INSERT cate(cateName,pId) VALUES('男装',1),
('女装',1),
('内衣',1);

INSERT cate(cateName,pId) VALUES('电视',2),
('冰箱',2),
('洗衣机',2);

INSERT cate(cateName,pId) VALUES('爱马仕',3),
('LV',3),
('GUCCI',3);

INSERT cate(cateName,pId) VALUES('夹克',4),
('衬衫',4),
('裤子',4);

INSERT cate(cateName,pId) VALUES('液晶电视',10),
('等离子电视',10),
('背投电视',10);

--查询所有的分类信息，并且得到其父分类
SELECT s.id,s.cateName AS sCateName,p.cateName AS pCateName
FROM cate AS s
LEFT JOIN cate AS p
ON s.pId=p.id;

--查询所有分类及其子分类
SELECT p.id,p.cateName AS pCateName,s.cateName AS sCateName
FROM cate AS s
RIGHT JOIN cate AS p
ON s.pId=p.id;

SELECT p.id,p.cateName AS pCateName,COUNT(s.cateName) AS count
FROM cate AS s
RIGHT JOIN cate AS p
ON s.pId=p.id
GROUP BY p.cateName
ORDER BY id ASC;


create database jdbctest;
use jdbctest;
create table user(
	uid int AUTO_INCREMENT KEY,
	username VARCHAR(20),
	password VARCHAR(20),
	name VARCHAR(20)
);

insert into user values(null,'aaa','111','张三'); 
insert into user values(null,'bbb','222','李四'); 
insert into user values(null,'ccc','333','王五'); 


CREATE DATABASE IF NOT EXISTS `message_board` DEFAULT CHARACTER SET utf8;
USE message_board;

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) NOT NULL,
	`username` varchar(32) NOT NULL,
	`title` varchar(32) NOT NULL,
	`content` varchar(4096) NOT NULL,
	`create_time` datetime NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`username` varchar(32) NOT NULL,
	`password` varchar(32) NOT NULL,
	`real_name` varchar(32) DEFAULT NULL,
	`birthday` datetime DEFAULT NULL,
	`phone` varchar(16) DEFAULT NULL,
	`address` varchar(128) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `user_username` (`username`)
)ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
