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
  sjlsh integer,  --ʱ����ˮ��
  kkbh integer,   --���ڱ��
  fx integer,  --����
  fxmc varchar2(10),  --��������
  hphm varchar2(15),  --���ƺ���
  hpzl varchar2(2),	--��������
  hpzlmc varchar2(10),  --������������
  lkbh integer,  --·�ڱ��
  lkmc varchar2(60), --·������
  jgsj date --����ʱ��
)
