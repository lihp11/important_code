% 恢复时间与input和lowcap的关系
clc,clear;
close all;
[A,leg] = xlsread('事故车牌结合分析tj16q1.xlsx','CTM仿真结果','J3:L72');
%A:行数=仿真场景数，列1=input flow，列2=事故点cap，列3=恢复时间
input_flow = A(:,1);
lowcap = A(:,2);
rectime = A(:,3);
plot3(input_flow,lowcap,rectime,'o');

figure('NumberTitle', 'off','name','恢复时间dura23');
[input_flow2d,lowcap2d] = meshgrid(0:0.05:0.8,0:0.05:2);  %生成input_flow，lowcap的二维网格
rectime2d = griddata(input_flow,lowcap,rectime,input_flow2d,lowcap2d);    %行列=up网络维数，内容=网格点对应消散时间
surf(input_flow2d,lowcap2d,rectime2d);

%down：增加图片修饰
colorbar;
xlabel('输入流量(veh/s)');
ylabel('道路通行能力(veh/s)');
zlabel('恢复时间(min)');
saveas(gcf,['恢复时间dura23','.fig']);
shading interp;  %去掉网格线
