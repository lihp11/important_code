--天津车牌数据
CREATE TABLE tianjin_data_20160315
(
  sjlsh integer,  --时间流水号
  kkbh integer,   --卡口编号
  fx integer,  --方向
  fxmc varchar2(10),  --方向名称
  hphm varchar2(15),  --号牌号码
  hpzl varchar2(2),	--号牌种类
  hpzlmc varchar2(10),  --号牌种类名称
  lkbh integer,  --路口编号(对应spottingid！！！)
  lkmc varchar2(60), --路口名称
  jgsj date --经过时间
)