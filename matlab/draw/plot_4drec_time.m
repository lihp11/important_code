% �ָ�ʱ����input��lowcap�Ĺ�ϵ
clc,clear;
close all;
[A,leg] = xlsread('�¹ʳ��ƽ�Ϸ���tj16q1.xlsx','CTM��ά����','L2:O197');
%A:����=���泡��������1=input flow����2=�¹ʵ�cap����3=����ʱ�䣬��4=�ָ�ʱ��
input_flow = A(:,1);
lowcap = A(:,2);
clear_time = A(:,3);
rectime = A(:,4);


[input_flow3d,lowcap3d,clear_time3d] = meshgrid(0:0.05:0.7,0:0.05:1.9,0:5:100);  %����input_flow��lowcap��ά����
rectime3d = griddata(input_flow,lowcap,clear_time,rectime,input_flow3d,lowcap3d,clear_time3d);    %����ҳ=up����ά��������=������Ӧ��ɢʱ��

%����������Ƭ
figure('NumberTitle', 'off','name','�ָ�ʱ��_����������Ƭ4d');
slice(input_flow3d,lowcap3d,clear_time3d,rectime3d,[0.1,0.2,0.3,0.4,0.5,0.6],[],[]);
colorbar;
xlabel('��������(veh/s)');
ylabel('ʣ�೵����');
zlabel('���ʱ��ʱ��(min)');
shading interp;  %ȥ��������
set(gcf,'color','white');
set(gca,'ytick',[0 0.5 1 1.5 2],'yticklabel',1.5*[0 0.5 1 1.5 2]);
saveas(gcf,['�ָ�ʱ��_����������Ƭ4d','.fig']);

%ʣ�೵������Ƭ
figure('NumberTitle', 'off','name','�ָ�ʱ��_ʣ�೵������Ƭ4d');
slice(input_flow3d,lowcap3d,clear_time3d,rectime3d,[],[0,0.3,0.6,0.9,1.2,1.5,1.8],[]);
colorbar;
xlabel('��������(veh/s)');
ylabel('ʣ�೵����');
zlabel('���ʱ��ʱ��(min)');
shading interp;  %ȥ��������
set(gcf,'color','white');
set(gca,'ytick',[0 0.5 1 1.5 2],'yticklabel',1.5*[0 0.5 1 1.5 2]);
saveas(gcf,['�ָ�ʱ��_ʣ�೵������Ƭ4d','.fig']);

%���ʱ����Ƭ
figure('NumberTitle', 'off','name','�ָ�ʱ��_���ʱ����Ƭ4d');
slice(input_flow3d,lowcap3d,clear_time3d,rectime3d,[],[],[5,20,35,50,65,80,95]);
colorbar;
xlabel('��������(veh/s)');
ylabel('ʣ�೵����');
zlabel('���ʱ��ʱ��(min)');
shading interp;  %ȥ��������
set(gcf,'color','white');
set(gca,'ytick',[0 0.5 1 1.5 2],'yticklabel',1.5*[0 0.5 1 1.5 2]);
saveas(gcf,['�ָ�ʱ��_���ʱ����Ƭ4d','.fig']);


%��������ݹ���(3�Ա�����1�����)
t_predict1 = interp3(input_flow3d,lowcap3d,clear_time3d,rectime3d,0.2,0.5,10*(1:9)); 
t_predict2 = interp3(input_flow3d,lowcap3d,clear_time3d,rectime3d,0.5,1.1,10*(1:6)); 
%up2�����Σ���������·ͨ�����������ʱ��
