load data
infile 'g:\2015_Autumn\����\��������\���������ַ�������\lhp_tianjin_data_2015q3_gbk.txt'
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