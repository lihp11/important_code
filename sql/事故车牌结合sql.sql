/*CREATE TABLE tianjin_data_lukou
(
  spottingid varchar2(20),
  spottingno varchar2(20),
  roadname varchar2(100),
  uniquecode number(12,0),
  longitude number(12,6),
  latitude number(12,6),
  departmentid number(10,0),
  sourcekind varchar2(20),
  creator varchar2(20),
  createdtime date,
  applicationname varchar2(20),
  areacode number(6,0),
  bopomofo varchar2(150),
  spottingtype number(2,0),
  virtualdeleteflag number(2,0),
  disabled number(2,0)
)*/

CREATE TABLE tianjin_data_20160315
(
  sjlsh integer,  --时间流水号
  kkbh integer,   --卡口编号
  fx integer,  --方向
  fxmc varchar2(10),  --方向名称
  hphm varchar2(15),  --号牌号码
  hpzl varchar2(2),	--号牌种类
  hpzlmc varchar2(10),  --号牌种类名称
  lkbh integer,  --路口编号
  lkmc varchar2(60), --路口名称
  jgsj date --经过时间
)
