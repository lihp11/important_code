% 恢复时间与input和lowcap的关系
clc,clear;
close all;
[A,leg] = xlsread('事故车牌结合分析tj16q1.xlsx','CTM四维仿真','L2:O197');
%A:行数=仿真场景数，列1=input flow，列2=事故点cap，列3=清理时间，列4=恢复时间
input_flow = A(:,1);
lowcap = A(:,2);
clear_time = A(:,3);
rectime = A(:,4);


[input_flow3d,lowcap3d,clear_time3d] = meshgrid(0:0.05:0.7,0:0.05:1.9,0:5:100);  %生成input_flow，lowcap三维网格
rectime3d = griddata(input_flow,lowcap,clear_time,rectime,input_flow3d,lowcap3d,clear_time3d);    %行列页=up网络维数，内容=网格点对应消散时间

%输入流量切片
figure('NumberTitle', 'off','name','恢复时间_输入流量切片4d');
slice(input_flow3d,lowcap3d,clear_time3d,rectime3d,[0.1,0.2,0.3,0.4,0.5,0.6],[],[]);
colorbar;
xlabel('输入流量(veh/s)');
ylabel('剩余车道数');
zlabel('清除时间时间(min)');
shading interp;  %去掉网格线
set(gcf,'color','white');
set(gca,'ytick',[0 0.5 1 1.5 2],'yticklabel',1.5*[0 0.5 1 1.5 2]);
saveas(gcf,['恢复时间_输入流量切片4d','.fig']);

%剩余车道数切片
figure('NumberTitle', 'off','name','恢复时间_剩余车道数切片4d');
slice(input_flow3d,lowcap3d,clear_time3d,rectime3d,[],[0,0.3,0.6,0.9,1.2,1.5,1.8],[]);
colorbar;
xlabel('输入流量(veh/s)');
ylabel('剩余车道数');
zlabel('清除时间时间(min)');
shading interp;  %去掉网格线
set(gcf,'color','white');
set(gca,'ytick',[0 0.5 1 1.5 2],'yticklabel',1.5*[0 0.5 1 1.5 2]);
saveas(gcf,['恢复时间_剩余车道数切片4d','.fig']);

%清除时间切片
figure('NumberTitle', 'off','name','恢复时间_清除时间切片4d');
slice(input_flow3d,lowcap3d,clear_time3d,rectime3d,[],[],[5,20,35,50,65,80,95]);
colorbar;
xlabel('输入流量(veh/s)');
ylabel('剩余车道数');
zlabel('清除时间时间(min)');
shading interp;  %去掉网格线
set(gcf,'color','white');
set(gca,'ytick',[0 0.5 1 1.5 2],'yticklabel',1.5*[0 0.5 1 1.5 2]);
saveas(gcf,['恢复时间_清除时间切片4d','.fig']);


%据体积数据估计(3自变量，1因变量)
t_predict1 = interp3(input_flow3d,lowcap3d,clear_time3d,rectime3d,0.2,0.5,10*(1:9)); 
t_predict2 = interp3(input_flow3d,lowcap3d,clear_time3d,rectime3d,0.5,1.1,10*(1:6)); 
%up2：依次，流量、道路通行能力、清除时间
