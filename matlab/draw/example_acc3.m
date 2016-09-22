% This is a testinf script for ctm_matlab toolkit.
% A network including four intersections are modeled and simulated in this
% script.
function example_acc3(input_vol,lowcap,acc_cycles)

build_ctm_4int_acc2;


% run the simulation for n cycles
n = 120;
%% ���ó�ʼ���������ź�
% initial the queue lengths of all normal and input lanes
% Note that the queue lengths of the output lanes need not be initialized.
x = zeros(16,n+1); %����=16����outputlane��lane����������=������+1������=������
x(:,1) = 1.5*[46;56;22;19;12;26;39;39;44;32;21;24;59;57;12;16];
ini_4int_queues(x(:,1)); %12��·��������24��lane_queue_length���ų�8��output_lane=16
%up��laneָ�೵��lane���Ŷӳ���=�������Ŷ�֮��

c = 90; %һ���źŵ�����
u_n = [40;40;36;36];%��λʱ�䣬����=4������=1
ug = zeros(4,n); %����=�������4������=����������������=����ڸ����ڵ�

%% ���ý���������
global ctm_lanes;
global ctm_cells;
type = zeros(24,1);
type(:) = arrayfun(@(x) x.type,ctm_lanes); %���� = lane��24����1=type����
q_n = zeros(16,1);
q_n(type==0) = 0.1; %lane type��0(normal)|1(input)|2(output)��

q_n(type==1) = input_vol;   %����==16����outputlane��lane��������1=������  

w = zeros(16,n);  %����=16������=������n������=��ʱ���ӵĸ�lane�����ʣ�veh/s��


delay = zeros(1,n); %����=1������=������n������=����
output = zeros(24,n); %����=lane��������=������n������=��������������inputlane����=0��


%% ��ʼ����
for i=1:n  %��i����������
    if ismember(i,10:10+acc_cycles)
        ctm_cells(1,340).cap = lowcap; %����lane10 �ĵ�340��Ԫ��cap��Ϊԭ��������֮һ������acc_cycles������
    else
        ctm_cells(1,340).cap = 6;
    end
    disp(['�������е�',num2str(i),'������']);
    ug(:,i) = u_n; %��λʱ�䣬����=4������=������
%     w(:,i) = 0.1*sin(i*pi/2.5)*q_n;%����=16����1=��ʱ���ӵĸ�lane�����ʣ�veh/s��
%     w(:,i) = rand*0.2*q_n;
     x(:,i+1) = ctm_4int(q_n+w(:,i),c,ug(:,i));  %����=16����outputlane��lane����������=������+1������=������
    %q������=16����1=���ʣ�veh/s�� 
    %c:��Ԫ��=�ź�����
    %u������=�������4����1=4��������پ�����һ����λ��ĵ���ʱ��
%     delay(i) = ctm_read_total_delay(); 

%     ctm_reset_delay();   %ÿ�����ڿ�ʼǰ����allԪ������=0

%     output(:,i) = ctm_read_lane_outputs();
    %����=lane��������=������n������=��������������inputlane����=0��
    
%     ctm_clean_outputs();

end

addglobal();
global dt_cell_length;
column_time_gary(dt_cell_length(ctm_lanes(1,14).o_cell:ctm_lanes(1,14).d_cell,:),true);
title('����14��·Ԫ��ʱ�ձ仯');
saveas(gcf,['����14��·Ԫ��ʱ��acccycle',num2str(acc_cycles),'qin',num2str(input_vol),'cap',num2str(lowcap),'.fig']);
column_time_gary(dt_cell_length(ctm_lanes(1,10).o_cell:ctm_lanes(1,10).d_cell,:),true);
title('�¹�10��·Ԫ��ʱ�ձ仯');
saveas(gcf,['�¹�10��·Ԫ��ʱ��acccycle',num2str(acc_cycles),'qin',num2str(input_vol),'cap',num2str(lowcap),'.fig']);

clc,clear,clear global;
close all; %�ر�����figureͼ��
end



