%% link����ʱ�䴦��
clc,clear;
[A,leg] = xlsread('HHYJ_HHXY_2_26_TRAVELTIME.xlsx');
%A������=trip������1=travel_time
%leg:cell���飬����=trip��+1����һ��Ϊ���⣩����1=���⣨1�У�+yyyy/MM/dd HH:mm:ss�������ࣩ����2=���⣨1�У�+�մ������ࣩ

link_travel_time = A;%����=trip������1=travel_time

leg = leg(2:end,1); %����=trip������1=yyyy/MM/dd HH:mm:ss��
day_time = datetime(leg,'InputFormat','yyyy/MM/dd HH:mm:ss');%����=trip������1=day_time datetime����
day_time_vec = datevec(day_time);%����=trip������1-��6=������ʱ���루double��
day_second = day_time_vec(:,4)*60*60+day_time_vec(:,5)*60+day_time_vec(:,6);
%up������=trip������1=����������·��second��

secondstamp_traveltime = [day_second,link_travel_time];
%����=trip������1=����������·��second������2=travel_time

%% �ķ�λ���޳�����
index_negtive_drop = secondstamp_traveltime(:,2)<=0;
secondstamp_traveltime(index_negtive_drop,:) = [];
%up������=ȥ��traveltime<0�����������1=����������·��second������2=travel_time

Q75 = prctile(secondstamp_traveltime(:,2),75);
Q25 = prctile(secondstamp_traveltime(:,2),25);
R = Q75-Q25;    %��Ԫ��=��λ������
lower_bound = Q25-1.5*R; %��Ԫ��=traveltime����
upper_bound = Q75+1.5*R;

index_row_drop = secondstamp_traveltime(:,2)>=upper_bound | secondstamp_traveltime(:,2)<=lower_bound;
secondstamp_traveltime(index_row_drop,:) = [];
%up������=ȥ��traveltime<0���ķ�λ��ȥ������������1=����������·��second������2=travel_time

%% ����ʱ��-����ʱ��ͼ
figure;
plot(secondstamp_traveltime(:,1),secondstamp_traveltime(:,2));
figure;
scatter(secondstamp_traveltime(:,1),secondstamp_traveltime(:,2));

















