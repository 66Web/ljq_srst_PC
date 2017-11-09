CREATE DATABASE sirenshitang CHARSET=UTF8;

USE sirenshitang;

CREATE TABLE sr_meal(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    price FLOAT(6,2),
    img_sm  VARCHAR(64),
    img_lg  VARCHAR(64),
    detail  VARCHAR(2048),
    material VARCHAR(2048)
);

INSERT INTO sr_meal(mid,name,price,img_sm,img_lg,detail,material) VALUES
(
  null,
  '【辣炒花蛤】',
  30,
  'p01.jpg',
  'p01-l.jpg',
  '花蛤、红辣椒、料酒、生抽、葱、盐、油',
  '健康功效——姜：降逆止呕、化痰止咳、散寒解表；料酒：活血化瘀'
),
(
  null,
  '【土豆炖牛肉】',
  28,
  'p02.jpg',
  'p02-l.jpg',
  '牛肉、土豆、花椒、酱油、姜、山楂、料酒',
  '健康功效——牛肉：补脾胃、强筋骨、益气血；土豆：和胃、解毒、消肿；姜：降逆止呕、化痰止咳、散寒解表'
),
(
  null,
  '【红烧肉】',
  25,
  'p03.jpg',
  'p03-l.jpg',
  '五花肉、黄豆酱、大葱、生姜、豆腐乳、鸡精、生抽',
  '健康功效——五花肉：补肾、滋阴、益气；大葱：通阳、解毒、活血'
),
(
  null,
  '【青椒炒香干】',
  18,
  'p04.jpg',
  'p04-l.jpg',
  '香干、青椒、红辣椒、油、盐、蒜、白糖',
  '健康功效——青椒：增强免疫力、抗氧化、抗癌防癌;胡椒粉：补血、护齿、保护骨骼;白糖：富含碳水化合物、活血化瘀'
),
(
  null,
  '【韭菜鸡蛋】',
  12,
  'p05.jpg',
  'p05-l.jpg',
  '鸡蛋、韭菜、虾皮、玉米淀粉、料酒、盐',
  '健康功效——鸡蛋：润燥、增强免疫力、护眼明目；韭菜：温中、补肾、解毒；虾皮：补肾壮阳、辅助降血压、升压'
),
(
  null,
  '【番茄豆腐】',
  15,
  'p06.jpg',
  'p06-l.jpg',
  '番茄、豆腐、蒜瓣、鸡精、葱、盐、糖',
  '健康功效——豆腐：清热泻火、益气、解毒'
),
(
  null,
  '【春意盎然】',
  20,
  'p07.jpg',
  'p07-l.jpg',
  '圣女果、金针菇、去皮莴笋、淀粉、白胡椒粉',
  '健康功效——金针菇：补肝、抗癌、益肠胃；醋：消食积、解毒、补血'
),
(
  null,
  '【木瓜银尔汤】',
  18,
  'p08.jpg',
  'p08-l.jpg',
  '木瓜、银耳、大枣、冰糖、莲子、水',
  '健康功效——木瓜：和胃、通络舒筋、化湿；银耳：润肺、辅助降血脂、辅助降血压；冰糖：和胃、健脾、润肺止咳'
);

CREATE TABLE sr_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  phone VARCHAR(16),
  user_name VARCHAR(16),
  sex INT, #1:男 2:女
  order_time DATETIME,
  addr VARCHAR(256),
  mid INT
);
INSERT INTO sr_order(oid,phone,user_name,sex,order_time,addr,mid) VALUES
(NULL,'17712345678','韩蕾',2,'2017-10-18','杭州图书馆',1),
(NULL,'17712345678','韩蕾',2,'2017-10-18','杭州图书馆',2),
(NULL,'17712345678','韩蕾',2,'2017-10-18','杭州图书馆',3);

