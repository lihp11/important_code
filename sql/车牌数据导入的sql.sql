/* --更新后天津路口表
CREATE TABLE tianjin_data_lukou
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
)

--原始天津车牌数据表
CREATE TABLE tianjin_data_20160315
(
  sjlsh integer,
  kkbh integer,
  fx varchar2(4),
  fxmc varchar2(10),
  hphm varchar2(15),
  hpzl varchar2(2),
  hpzlmc varchar2(10),
  xssd smallint,
  cwkc integer,
  hpys varchar2(1),
  cllx varchar2(4),
  cllxmc varchar2(10),
  lkbh integer,
  lkmc varchar2(60),
  tztplj varchar2(150),
  qjtplj varchar2(150),
  lkms varchar2(14),
  scbj varchar2(1),
  jgsj date
) */

--创建天津行政区划代码表
create table tianjin_region
(regionid number(10,0) primary key,regionname varchar2(20));
--天津路口数据
CREATE TABLE tianjin_data_lukou
(
  spottingid varchar2(20),	--路口编号！！！
  spottingno varchar2(20),	--*
  --"name" varchar2(100),
  uniquecode number(12,0),	--唯一码*
  --roadid number(2,0),
  longitude number(12,6),  --经度
  latitude number(12,6),	--维度
  departmentid number(10,0),	--管理部门id
  sourcekind varchar2(20),	--来源
  creator varchar2(20),		--创建者
  createdtime date,		--创建时间
  --modifier varchar2(50),
  --modifiedtime date,
  --flags varchar2(20),
  --remark varchar2(20),
  applicationname varchar2(20),  --应用名称
  areacode number(6,0),		--区域编号
  bopomofo varchar2(150),		--*
  spottingtype number(2,0),		--路口种类*
  virtualdeleteflag number(2,0),	--*
  disabled number(2,0)		--不可使用*
)

***********************************************************************************************
使用sqlloader导入数据
--（1）建表
CREATE TABLE tianjin_data_20160315		--修改！！
(
  sjlsh integer,  --时间流水号	--down10，按导入内容修改！！
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

***********************************************************************************************
--（2）导入的控制文件car_plate_input.ctl	infile、tablename、导入列名按需修改！！

--备用位置
infile 'g:\2015_Autumn\毕设\车牌数据\车牌数据字符集更新\车牌数据样本.txt'
replace 替换原数据  append 在原数据基础上增加


load data
infile 'g:\2015_Autumn\毕设\车牌数据\车牌数据字符集更新\lhp_tianjin_data_2015q3_gbk.txt'
into table tianjin_data_20160315
replace
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(sjlsh,
kkbh,
fx,
fxmc,
hphm,
hpzl,
hpzlmc,
lkbh,
lkmc,
jgsj date 'YYYY-MM-DD HH24:MI:SS'
)
***********************************************************************************************
--（3）cmd中运行ctl的命令	修改contrl=后内容！！
sqlldr transport@localconnect/www123com control=g:\2015_Autumn\毕设\车牌数据\车牌数据字符集更新\car_plate_input.ctl
***********************************************************************************************
--（4）概括存在的路口编号、路口名称、方向、时间	
select distinct lkbh,lkmc,fx,to_char(jgsj,'YYYY-MM-DD') from tianjin_data_20160315	--修改！！
				order by lkbh,lkmc,fx, to_char(jgsj,'YYYY-MM-DD');
***********************************************************************************************




--车牌数据和卡口情况概括

select * from TIANJIN_DATA_LUKOU t;
select  distinct to_char(jgsj,'YYYY-MM-DD') from tianjin_data_20160315 order by to_char(jgsj,'YYYY-MM-DD') ;

--卡口管理部门
select distinct departmentid from TIANJIN_DATA_LUKOU;

--车牌涉及	路口编号（两张表的连接）
select * from tianjin_data_20160315 where rownum<100;
select distinct  lkbh from tianjin_data_20160315;


--车牌涉及的路口编号及行政区
/* select distinct a.lkbh,c.regionid,c.regionname from 
	(select distinct  lkbh from tianjin_data_20160315) a, --interger：lkbh
	TIANJIN_DATA_LUKOU b,  --char：spottingid;number(6,0):areacode
	tianjin_region c	--number(10,0):regionid
	where to_char(a.lkbh) = b.spottingid and c.regionid = b.areacode; */

--车牌涉及的路口编号及路口名称
select distinct  lkbh ,lkmc from tianjin_data_20160315;


--车牌涉及的路口编号、名称、方向、方向含义
select distinct  lkbh ,lkmc, fx,fxmc from tianjin_data_20160315;

--查看相同路口不同卡口的原因
select distinct lkbh,lkmc,to_char(jgsj,'YYYY-MM-DD') from tianjin_data_20160315
				where lkbh=1204000539 order by lkmc, to_char(jgsj,'YYYY-MM-DD');

--查看咸阳路与渭水道事故点周边卡口编号，名称，方向，日期
select distinct lkbh,lkmc,fx,to_char(jgsj,'YYYY-MM-DD') from tianjin_data_20160315
				where lkbh in (1204000536,1204000553,1204000545,1204000552
								,1204000903,1204000723,1204000763)
					  and  to_char(jgsj,'YYYY-MM-DD')='2015-12-25'
				order by lkbh,lkmc,fx, to_char(jgsj,'YYYY-MM-DD');
				
--查看q4的卡口编号，名称，方向，日期
select distinct lkbh,lkmc,fx,to_char(jgsj,'YYYY-MM-DD') from tianjin_data_20160315
				where to_char(jgsj,'YYYY-MM-DD')<'2016'
				order by lkbh,lkmc,fx, to_char(jgsj,'YYYY-MM-DD');

--选择2015/12/10黄河道与天明路交叉口事故，提取黄河道与临潼路打点记录
select lkbh,lkmc,fx,to_char(jgsj,'YYYY-MM-DD HH24:MI:SS') from  tianjin_data_20160315
				where 	lkbh = 1204000723 --临潼路与黄河道交叉口编号
						and to_char(jgsj,'YYYY-MM-DD HH24:MI:SS')>'2015-12-10 14:30:00'
						and to_char(jgsj,'YYYY-MM-DD HH24:MI:SS')<'2015-12-10 16:30:00'
				order by to_char(jgsj,'YYYY-MM-DD HH24:MI:SS');



--选择2016/1/9海光寺交叉口事故，提取海光寺打点记录
select lkbh,lkmc,fx,to_char(jgsj,'YYYY-MM-DD HH24:MI:SS') from  tianjin_data_20160315
				where 	lkbh = 1204000534 --临潼路与黄河道交叉口编号
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-09'
				order by fx,to_char(jgsj,'YYYY-MM-DD HH24:MI:SS');

--选择2016/1/9海光寺交叉口方向2事故，提取海光寺打点记录
select to_char(jgsj,'YYYY-MM-DD HH24:MI:SS') from  tianjin_data_20160315
				where 	lkbh = 1204000534 --临潼路与黄河道交叉口编号
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-09'
						and fx = 2
				order by fx,to_char(jgsj,'YYYY-MM-DD HH24:MI:SS');

				
--选择2016/1/9黄河咸阳交叉口方向1
select to_char(jgsj,'YYYY-MM-DD HH24:MI:SS') from  tianjin_data_20160315
				where 	lkbh = 1204000536 --黄河咸阳交叉口
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-09'
						and fx = 1
				order by to_char(jgsj,'YYYY-MM-DD HH24:MI:SS');

--选择2016/1/9黄河临潼交叉口方向1
select to_char(jgsj,'YYYY-MM-DD HH24:MI:SS') from  tianjin_data_20160315
				where 	lkbh = 1204000723 --黄河临潼交叉口方向
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-09'
						and fx = 1
				order by to_char(jgsj,'YYYY-MM-DD HH24:MI:SS');




--选择2016/2/20海光寺fx2
create table haiguangsi_2_20 as
select jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000534 --海光寺fx2
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-20'
						and fx = 2
				order by jgsj;
--选择2016/2/20卫津路双峰道fx2
create table weijinshaungfeng_2_20 as
select jgsj ,hphm from  tianjin_data_20160315
        where   lkbh = 1204000558 --卫津路双峰道fx2
            and to_char(jgsj,'YYYY-MM-DD')='2016-02-20'
            and fx = 2
        order by jgsj;       
--创建以上两口匹配车牌的旅行时间
create table haiguang_weijin_time_2_20 as
select a.hphm,a.jgsj start_time,b.jgsj end_time,(b.jgsj-a.jgsj)*24*60*60 travel_time 
		from weijinshaungfeng_2_20 a,haiguangsi_2_20 b --a到b
		where a.hphm = b.hphm  --date类型相减为天数，数值类型
		order by  a.jgsj

			
--长江道青年路壳牌加油站前 长江广开四13X长江红旗13，2016/1/14 19:20

--长江广开四fx13
create table changjianggaungkaisi_1_14fx_13 as
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000539
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-14'
						and fx in (1,3)
				order by fx,jgsj;

--长江红旗fx13
create table changjianghongqi_1_14fx_13 as
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000552
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-14'
						and fx in (1,3)
				order by fx,jgsj;
--创建以上两口匹配车牌的旅行时间
create table cj_hq_gks_time_1_14 as
select a.fx,a.hphm,a.jgsj as time1,b.jgsj time2,abs(b.jgsj-a.jgsj)*24*60*60 travel_time 
		from changjianggaungkaisi_1_14fx_13 a,changjianghongqi_1_14fx_13 b --a到b
		where a.hphm = b.hphm  --date类型相减为天数，数值类型
				and a.fx = b.fx
		order by  a.jgsj				
 

--水上公园北道9号海鲜前 水上东路与天塔24 2016/2/2 16:55

--水上公园北道9号海鲜前 2016/2/2水上东路与天塔24fx2

select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000583
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-02'
						and fx=2
				order by fx,jgsj;

--水上公园北道9号海鲜前 2016/2/1,3水上东路与天塔24fx2

select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000583
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-01'
						and fx=2
				order by fx,jgsj;

select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000583
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-03'
						and fx=2
				order by fx,jgsj;
				
				
--水上公园东路动物园东门对面2016/2/11 18:30 水上东霞光24
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000824
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-11'
						and fx=4
				order by fx,jgsj;

--水上公园东路动物园东门对面2016/2/11 18:30 水上东霞光24
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000824
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-10'
						and fx=4
				order by fx,jgsj;
				
--水上公园东路动物园东门对面2016/2/11 18:30 水上东霞光24
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000824
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-12'
						and fx=4
				order by fx,jgsj;

--2016/2/26 8:50	460.00 	水上公园西路与长实道交口南侧 复康水上西2
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000824
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-12'
						and fx=4
				order by fx,jgsj;




--2016/2/26 16:30	60.00 	黄河道冶金路郭家菜饭馆对面 黄河密云13X黄河冶金13X黄河咸阳13
--(1)黄河冶金fx3
create table hh_yj_2_26 as
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000763
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
						and fx=3
				order by fx,jgsj;
--(2)黄河密云fx3
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000556
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
						and fx=3
				order by fx,jgsj;
--(3)黄河咸阳fx3
create table hh_xy_2_26 as
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000536
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
						and fx=3
				order by fx,jgsj;
--(4)黄河冶金到黄河咸阳的旅行时间
create table hhyj_hhxy_2_26_traveltime as
select a.hphm,a.jgsj start_time,b.jgsj end_time,(b.jgsj-a.jgsj)*24*60*60 travel_time 
		from hh_yj_2_26 a,hh_xy_2_26 b --a到b
		where a.hphm = b.hphm  --date类型相减为天数，数值类型
				and b.jgsj>a.jgsj
		order by  a.jgsj				
				
--(4)的筛选条件:旅行时间大于500s的去掉
delete from hhyj_hhxy_2_26_traveltime where travel_time>500; 				

--最终确定为fx3！！！以下（1）（2）（3）错误，有东至西行驶
--(1)黄河冶金fx1
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000763
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
						and fx=1
				order by fx,jgsj;
--(2)黄河密云fx1
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000556
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
						and fx=1
				order by fx,jgsj;
--(3)黄河咸阳fx1
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000536
						and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
						and fx=1
				order by fx,jgsj;

--查询津DES578在2/26活动
select fx,jgsj ,hphm,lkbh,lkmc from  tianjin_data_20160315
				where 	to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
						and hphm = '津DES578'
				order by jgsj;
--查询津DES578所有活动
select fx,jgsj ,hphm,lkbh,lkmc from  tianjin_data_20160315
				where 	hphm = '津DES578'
				order by jgsj;				

				
				
				
--2016/1/7 15:25	420.00 	红旗路与长江道交口北侧停车线以北4米处 红旗长江24X红旗西湖24
--(1)红旗与长江fx2
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000552
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-07'
						and fx=2
				order by fx,jgsj;
--(2)红旗与长江fx2
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000552
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-07'
						and fx=2
				order by fx,jgsj;
--(3)红旗与长江fx2
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000552
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-07'
						and fx=2
				order by fx,jgsj;
--最终确定为fx1，有东至西行驶
--(1)红旗与长江fx4
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000552
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-07'
						and fx=4
				order by fx,jgsj;
--(2)红旗与长江fx4
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000552
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-07'
						and fx=4
				order by fx,jgsj;
--(3)红旗与长江fx4
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000552
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-07'
						and fx=4
				order by fx,jgsj;				
				
				
				
--2016/1/8 5:00	120.00 	黄河道与密云路交口 黄河密云24
--(1)黄河道与密云路交口fx2
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000556
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-08'
						and fx = 2
				order by fx,jgsj;
			
--(2)黄河道与密云路交口fx4
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000556
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-08'
						and fx =4
				order by fx,jgsj;				
				
				
				
--2016/1/8 10:00	30.00 	鞍山西道与卫津路交口 鞍山卫津134
--(1)鞍山西道与卫津路交口fx1
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000525
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-08'
						and fx = 1
				order by fx,jgsj;
			
--(2)鞍山西道与卫津路交口fx3
select fx,jgsj ,hphm from  tianjin_data_20160315
				where 	lkbh = 1204000525
						and to_char(jgsj,'YYYY-MM-DD')='2016-01-08'
						and fx =3
				order by fx,jgsj;				
				
				
--2016/2/26 8:50	460.00 	水上公园西路与长实道交口南侧 复康水上西2
--(1)复康路与水上公园西路交口以东200米路南侧fx3
select fx,jgsj ,hphm from  tianjin_data_20160315
        where   lkbh = 1204000887
            and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
            and fx = 3
        order by fx,jgsj;
      
--(2)复康路与水上公园西路交口以西250米路北侧fx1
select fx,jgsj ,hphm from  tianjin_data_20160315
        where   lkbh = 1204000888
            and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'
            and fx =1
        order by fx,jgsj; 				
				
**********************************************************************************
查询肇事车经过路径
--查询  津DES578  在  2016-02-26  活动（修改车牌和时间）
select fx,jgsj ,hphm,lkbh,lkmc from  tianjin_data_20160315
				where 	to_char(jgsj,'YYYY-MM-DD')='2016-02-26'	--修改！
						and hphm = '津DES578'  --修改！
				order by jgsj;
**********************************************************************************
查询事发点打点数据
--查询路口为 1204000888 在 2016-02-26 方向为 1 的打点数据（修改路口和日期和方向）
select fx,jgsj ,hphm from  tianjin_data_20160315
        where   lkbh = 1204000888	--修改！
            and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'	--修改！
            and fx =1	--修改！
        order by fx,jgsj; 	
**********************************************************************************
Matlab计算事发点流量累计曲线规律
**********************************************************************************
查询事发点上下游旅行时间
--查询路口编号为起点路口为 1204000763 终点路口为 1204000536 
--fx为 3 日期为 2016-02-26 的旅行时间（修改起终点路口和fx和日期）
select a.hphm,a.jgsj start_time,b.jgsj end_time,(b.jgsj-a.jgsj)*24*60*60 travel_time 
		from 	(select jgsj ,hphm from  tianjin_data_20160315
					where 	lkbh = 1204000763	--修改！
							and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'	--修改！
							and fx=3) a,	--修改！
				(select fx,jgsj ,hphm from  tianjin_data_20160315
					where 	lkbh = 1204000536	--修改！
							and to_char(jgsj,'YYYY-MM-DD')='2016-02-26'	--修改！
							and fx=3) b 	--修改！
		where a.hphm = b.hphm
				and b.jgsj>a.jgsj	--a到b
		order by  a.jgsj;		
**********************************************************************************
Matlab计算事发点上下游旅行时间规律
**********************************************************************************		
				
--测试
select * from TIANJIN_DATA_LUKOU t;
select * from tianjin_data_20160315 where rownum<100;
select * from tianjin_region;

select * from TIANJIN_DATA_LUKOU a,
      (select * from tianjin_data_20160315 where rownum<100) b
      where a.spottingid = to_char(b.lkbh);

select c.regionid,c.regionname from TIANJIN_DATA_LUKOU b, tianjin_region c
				where c.regionid = b.areacode;




















