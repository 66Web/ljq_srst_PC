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
  '����������',
  30,
  'p01.jpg',
  'p01-l.jpg',
  '���򡢺��������Ͼơ����顢�С��Ρ���',
  '������Ч������������ֹŻ����̵ֹ�ȡ�ɢ��������Ͼƣ���Ѫ����'
),
(
  null,
  '��������ţ�⡿',
  28,
  'p02.jpg',
  'p02-l.jpg',
  'ţ�⡢���������������͡�����ɽ髡��Ͼ�',
  '������Ч����ţ�⣺��Ƣθ��ǿ��ǡ�����Ѫ����������θ���ⶾ�����ף���������ֹŻ����̵ֹ�ȡ�ɢ�����'
),
(
  null,
  '�������⡿',
  25,
  'p03.jpg',
  'p03-l.jpg',
  '�廨�⡢�ƶ�������С������������顢����������',
  '������Ч�����廨�⣺��������������������У�ͨ�����ⶾ����Ѫ'
),
(
  null,
  '���ཷ����ɡ�',
  18,
  'p04.jpg',
  'p04-l.jpg',
  '��ɡ��ཷ�����������͡��Ρ��⡢����',
  '������Ч�����ཷ����ǿ������������������������;�����ۣ���Ѫ�����ݡ���������;���ǣ�����̼ˮ�������Ѫ����'
),
(
  null,
  '���²˼�����',
  12,
  'p05.jpg',
  'p05-l.jpg',
  '�������²ˡ�ϺƤ�����׵��ۡ��Ͼơ���',
  '������Ч���������������ǿ��������������Ŀ���²ˣ����С��������ⶾ��ϺƤ������׳����������Ѫѹ����ѹ'
),
(
  null,
  '�����Ѷ�����',
  15,
  'p06.jpg',
  'p06-l.jpg',
  '���ѡ���������ꡢ�������С��Ρ���',
  '������Ч��������������к���������ⶾ'
),
(
  null,
  '�����ⰻȻ��',
  20,
  'p07.jpg',
  'p07-l.jpg',
  'ʥŮ�������빽��ȥƤݫ�񡢵��ۡ��׺�����',
  '������Ч�������빽�����Ρ��������泦θ���ף���ʳ�����ⶾ����Ѫ'
),
(
  null,
  '��ľ����������',
  18,
  'p08.jpg',
  'p08-l.jpg',
  'ľ�ϡ����������桢���ǡ����ӡ�ˮ',
  '������Ч����ľ�ϣ���θ��ͨ������ʪ����������Ρ�������Ѫ֬��������Ѫѹ�����ǣ���θ����Ƣ�����ֹ��'
);

CREATE TABLE sr_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  phone VARCHAR(16),
  user_name VARCHAR(16),
  sex INT, #1:�� 2:Ů
  order_time DATETIME,
  addr VARCHAR(256),
  mid INT
);
INSERT INTO sr_order(oid,phone,user_name,sex,order_time,addr,mid) VALUES
(NULL,'17712345678','����',2,'2017-10-18','����ͼ���',1),
(NULL,'17712345678','����',2,'2017-10-18','����ͼ���',2),
(NULL,'17712345678','����',2,'2017-10-18','����ͼ���',3);

