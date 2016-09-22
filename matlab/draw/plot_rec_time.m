% �ָ�ʱ����input��lowcap�Ĺ�ϵ
clc,clear;
close all;
[A,leg] = xlsread('�¹ʳ��ƽ�Ϸ���tj16q1.xlsx','CTM������','J3:L72');
%A:����=���泡��������1=input flow����2=�¹ʵ�cap����3=�ָ�ʱ��
input_flow = A(:,1);
lowcap = A(:,2);
rectime = A(:,3);
plot3(input_flow,lowcap,rectime,'o');

figure('NumberTitle', 'off','name','�ָ�ʱ��dura23');
[input_flow2d,lowcap2d] = meshgrid(0:0.05:0.8,0:0.05:2);  %����input_flow��lowcap�Ķ�ά����
rectime2d = griddata(input_flow,lowcap,rectime,input_flow2d,lowcap2d);    %����=up����ά��������=������Ӧ��ɢʱ��
surf(input_flow2d,lowcap2d,rectime2d);

%down������ͼƬ����
colorbar;
xlabel('��������(veh/s)');
ylabel('��·ͨ������(veh/s)');
zlabel('�ָ�ʱ��(min)');
saveas(gcf,['�ָ�ʱ��dura23','.fig']);
shading interp;  %ȥ��������
