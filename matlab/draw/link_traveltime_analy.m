%% link旅行时间处理
clc,clear;
[A,leg] = xlsread('HHYJ_HHXY_2_26_TRAVELTIME.xlsx');
%A：行数=trip数，列1=travel_time
%leg:cell数组，行数=trip数+1（多一行为标题），列1=标题（1行）+yyyy/MM/dd HH:mm:ss串（其余），列2=标题（1行）+空串（其余）

link_travel_time = A;%行数=trip数，列1=travel_time

leg = leg(2:end,1); %行数=trip数，列1=yyyy/MM/dd HH:mm:ss串
day_time = datetime(leg,'InputFormat','yyyy/MM/dd HH:mm:ss');%行数=trip数，列1=day_time datetime类型
day_time_vec = datevec(day_time);%行数=trip数，列1-列6=年月日时分秒（double）
day_second = day_time_vec(:,4)*60*60+day_time_vec(:,5)*60+day_time_vec(:,6);
%up：行数=trip数，列1=当天入上游路口second戳

secondstamp_traveltime = [day_second,link_travel_time];
%行数=trip数，列1=当天入上游路口second戳，列2=travel_time

%% 四分位法剔除噪声
index_negtive_drop = secondstamp_traveltime(:,2)<=0;
secondstamp_traveltime(index_negtive_drop,:) = [];
%up：行数=去掉traveltime<0后的行数，列1=当天入上游路口second戳，列2=travel_time

Q75 = prctile(secondstamp_traveltime(:,2),75);
Q25 = prctile(secondstamp_traveltime(:,2),25);
R = Q75-Q25;    %单元素=分位数极差
lower_bound = Q25-1.5*R; %单元素=traveltime下限
upper_bound = Q75+1.5*R;

index_row_drop = secondstamp_traveltime(:,2)>=upper_bound | secondstamp_traveltime(:,2)<=lower_bound;
secondstamp_traveltime(index_row_drop,:) = [];
%up：行数=去掉traveltime<0且四分位法去噪后的行数，列1=当天入上游路口second戳，列2=travel_time

%% 绘制时间-旅行时间图
figure;
plot(secondstamp_traveltime(:,1),secondstamp_traveltime(:,2));
figure;
scatter(secondstamp_traveltime(:,1),secondstamp_traveltime(:,2));

















