load data
infile 'g:\2015_Autumn\����\��������\���������ַ�������\tianjin_data_nk_2016_gbk.txt'
into table tj_nk_16q1
replace
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(kkbh,
fx,
fxmc,
hphm,
hpzl,
hpzlmc,
lkbh,
lkmc,
jgsj "to_date(rtrim(:jgsj,'+08'),'YYYY-MM-DD HH24:MI:SS')"
)