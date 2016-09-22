%%CPI,房价,天气,上证,交通路网指标

%% 数据读取
clc,clear,close all;
stock = xlsread('g:\2015_Autumn\transport_research\可预测性\上证.xlsx',1,'D2:D63');%行数=169（选取的天数）,列1=股票收盘指数（从近到远）
stock = flipud(stock);%行数=169（选取的天数）,列1=股票收盘指数（从远到近）
disp('上证指数读取完毕！');

cpi_tongbi = xlsread('g:\2015_Autumn\transport_research\可预测性\经济CPI指数.xlsx',1,'G1:G62');%行数=99（选取的月份数）,列1=cpi（从近到远）
cpi_tongbi = flipud(cpi_tongbi); %行数=101（选取的月份数）,列1=cpi同比增长（从远到近）
cpi_huanbi = xlsread('g:\2015_Autumn\transport_research\可预测性\经济CPI指数.xlsx',1,'H1:H62');%行数=99（选取的月份数）,列1=cpi（从近到远）
cpi_huanbi = flipud(cpi_huanbi); %行数=101（选取的月份数）,列1=cpi环比增长（从远到近）
disp('CPI数读取完毕！');

housebj_huanbi = xlsread('g:\2015_Autumn\transport_research\可预测性\房价数据.xlsx',1,'A2:A63'); %down8:全国
housebj_huanbi = flipud(housebj_huanbi);
housebj_tongbi = xlsread('g:\2015_Autumn\transport_research\可预测性\房价数据.xlsx',1,'B2:B63');
housebj_tongbi = flipud(housebj_tongbi);
housesh_huanbi = xlsread('g:\2015_Autumn\transport_research\可预测性\房价数据.xlsx',1,'C2:C63');
housesh_huanbi = flipud(housesh_huanbi);
housesh_tongbi = xlsread('g:\2015_Autumn\transport_research\可预测性\房价数据.xlsx',1,'D2:D63');
housesh_tongbi = flipud(housesh_tongbi);  %行数=62.列1=房价同比或环比指数
disp('房价指数读取完毕！');

usa_unemploy = xlsread('g:\2015_Autumn\transport_research\可预测性\美国失业率.xlsx',1,'C2:C63'); %现值失业率
usa_unemploy = flipud(usa_unemploy); 
disp('usa_unemploy读取完毕！');

usa_cpi = xlsread('g:\2015_Autumn\transport_research\可预测性\美国消费者物价指数.xlsx',1,'C2:C63'); %现值物价环比变化率
usa_cpi = flipud(usa_cpi);
disp('usa_cpi读取完毕！');

gasoline_93_price =  xlsread('g:\2015_Autumn\transport_research\可预测性\油价数据.xlsx',1,'E4:E65'); %93汽油价格
gasoline_93_price = flipud(gasoline_93_price);
gasoline_97_price =  xlsread('g:\2015_Autumn\transport_research\可预测性\油价数据.xlsx',1,'G4:G65'); %97汽油价格
gasoline_97_price = flipud(gasoline_97_price);
disel_price = xlsread('g:\2015_Autumn\transport_research\可预测性\油价数据.xlsx',1,'I4:I65'); %柴油
disel_price = flipud(disel_price);
disp('中国油价读取完毕！');

bj_city_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',1,'E2:E63'); 
tj_city_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',1,'E275:E336');
bj_city_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',1,'F2:F63'); 
tj_city_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',1,'F275:F336'); 
bj_city_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',1,'G2:G63'); 
tj_city_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',1,'G275:G336'); 
disp('北京天津城市交通指标读取完毕！');


tj_urban_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',2,'C2:C63'); 
tj_urban_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',2,'D2:D63'); 
tj_urban_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',2,'E2:E63'); 
disp('天津城六区交通指标读取完毕！');

tj_heping_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'F2:F63'); 
tj_heping_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'G2:G63'); 
tj_heping_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'H2:H63'); 
disp('天津和平区交通指标读取完毕！');

tj_hebei_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'F1094:F1155'); 
tj_hebei_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'G1094:G1155'); 
tj_hebei_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'H1094:H1155'); 
disp('天津河北区交通指标读取完毕！');

tj_hedong_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'F275:F336'); 
tj_hedong_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'G275:G336'); 
tj_hedong_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'H275:H336'); 
disp('天津河东区交通指标读取完毕！');

tj_hexi_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'F548:F609'); 
tj_hexi_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'G548:G609'); 
tj_hexi_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'H548:H609'); 
disp('天津河西区交通指标读取完毕！');

tj_hongqiao_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'F1367:F1430'); 
tj_hongqiao_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'G1367:G1430'); 
tj_hongqiao_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'H1367:H1430'); 
disp('天津红桥区交通指标读取完毕！');

tj_nankai_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'F821:F882'); 
tj_nankai_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'G821:G882'); 
tj_nankai_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',3,'H821:H882'); 
disp('天津南开区交通指标读取完毕！');

tj_freeway_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',4,'C2:C63'); 
tj_freeway_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',4,'D2:D63'); 
tj_freeway_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',4,'E2:E63'); 
disp('天津快速路交通指标读取完毕！');

tj_outring_vf = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',5,'C2:C63'); 
tj_outring_vm = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',5,'D2:D63'); 
tj_outring_conjestion_index = xlsread('g:\2015_Autumn\transport_research\可预测性\天津季度报告数据需求_每天3点.xlsx',5,'E2:E63'); 
disp('天津外环交通指标读取完毕！');
rand_num = rand(1,61);
fix_num = ones(1,61);
indicator_cell = {stock,...
    cpi_tongbi,cpi_huanbi,...
    housebj_huanbi,housebj_tongbi,housesh_huanbi,housesh_tongbi,...
    usa_unemploy,...
    usa_cpi,...
    gasoline_93_price,gasoline_97_price,disel_price,...
    bj_city_vf,tj_city_vf,bj_city_vm,tj_city_vm,bj_city_conjestion_index,tj_city_conjestion_index,...
    tj_urban_vf,tj_urban_vm,tj_urban_conjestion_index,...
    tj_heping_vf,tj_heping_vm,tj_heping_conjestion_index,...
    tj_hebei_vf,tj_hebei_vm,tj_hebei_conjestion_index,...
    tj_hedong_vf,tj_hedong_vm,tj_hedong_conjestion_index,...
    tj_hexi_vf,tj_hexi_vm,tj_hexi_conjestion_index,...
    tj_hongqiao_vf,tj_hongqiao_vm,tj_hongqiao_conjestion_index,...
    tj_nankai_vf,tj_nankai_vm,tj_nankai_conjestion_index,...
    tj_freeway_vf,tj_freeway_vm,tj_freeway_conjestion_index,...
    tj_outring_vf,tj_outring_vm,tj_outring_conjestion_index,...
    rand_num,fix_num}'; %行数=指标类型数量,列数=1,内容=各指标vector（列向量）
num_indicator = length(indicator_cell);
%% 复杂度函数调用
indicator_complexity = cell(9,1);  
%indicator_complexity：cell数组，行数=9，列数=1；
%indicator_complexity{i,i}:行数=指标数=indicator_cell的元素数，列1=指标复杂度
indicator_string = cell(9,1);
indicator_nsymbol = cell(9,1);
for i = 2:10
%把最大值最小值分成的区间数
[indicator_string{i-1,1},indicator_nsymbol{i-1,1}] = arrayfun(@(x)vector_to_string(x{:},i),indicator_cell,'UniformOutput',false); 
%indicator_string{i-1,1}：cell数组：行数=指标数,列1=各指标字符串阵；
%indicator_nsymbol{i-1,1}：cell数组：行数=指标数,列1=指标类型数；
indicator_complexity{i-1,1} = arrayfun(@(x,y,z)cal_complexity(x{:},y{:},z),indicator_string{i-1,1},indicator_nsymbol{i-1,1},ones(num_indicator,1));
%indicator_complexity{i-1,1}:行数=指标数,列1=复杂度
end
complexity = zeros(num_indicator,9); %行数=指标数，列i=分成i+1个区间的指标复杂度
for i = 1:9
    complexity(:,i) = indicator_complexity{i,1};
end

% complexity(:,end+1) = arrayfun(@(x)x{:},indicator_complexity,'UniformOutput',false); %Uniform 输出中存在非标量值时应将 'UniformOutput' 设置为 false。
% %会将arrayfun一次性执行完毕为9×1的cell
