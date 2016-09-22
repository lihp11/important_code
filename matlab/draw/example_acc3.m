% This is a testinf script for ctm_matlab toolkit.
% A network including four intersections are modeled and simulated in this
% script.
function example_acc3(input_vol,lowcap,acc_cycles)

build_ctm_4int_acc2;


% run the simulation for n cycles
n = 120;
%% 设置初始车辆数和信号
% initial the queue lengths of all normal and input lanes
% Note that the queue lengths of the output lanes need not be initialized.
x = zeros(16,n+1); %行数=16（非outputlane的lane数），列数=周期数+1，内容=车辆数
x(:,1) = 1.5*[46;56;22;19;12;26;39;39;44;32;21;24;59;57;12;16];
ini_4int_queues(x(:,1)); %12段路，理论上24个lane_queue_length，排除8个output_lane=16
%up：lane指多车道lane，排队长度=各车道排队之和

c = 90; %一个信号灯周期
u_n = [40;40;36;36];%相位时间，行数=4，列数=1
ug = zeros(4,n); %行数=交叉口数4，列数=运行周期数，内容=交叉口该周期的

%% 设置进入流量等
global ctm_lanes;
global ctm_cells;
type = zeros(24,1);
type(:) = arrayfun(@(x) x.type,ctm_lanes); %行数 = lane数24，列1=type类型
q_n = zeros(16,1);
q_n(type==0) = 0.1; %lane type【0(normal)|1(input)|2(output)】

q_n(type==1) = input_vol;   %行数==16（非outputlane的lane数），列1=流入率  

w = zeros(16,n);  %行数=16，列数=周期数n，内容=临时增加的各lane流入率（veh/s）


delay = zeros(1,n); %行数=1，列数=周期数n，内容=延误
output = zeros(24,n); %行数=lane数，列数=周期数n，内容=流出车数，（对inputlane而言=0）


%% 开始仿真
for i=1:n  %第i个运行周期
    if ismember(i,10:10+acc_cycles)
        ctm_cells(1,340).cap = lowcap; %假设lane10 的第340号元胞cap变为原来的三分之一并持续acc_cycles个周期
    else
        ctm_cells(1,340).cap = 6;
    end
    disp(['正在运行第',num2str(i),'个周期']);
    ug(:,i) = u_n; %相位时间，行数=4，列数=周期数
%     w(:,i) = 0.1*sin(i*pi/2.5)*q_n;%行数=16，列1=临时增加的各lane流入率（veh/s）
%     w(:,i) = rand*0.2*q_n;
     x(:,i+1) = ctm_4int(q_n+w(:,i),c,ug(:,i));  %行数=16（非outputlane的lane数），列数=周期数+1，内容=车辆数
    %q：行数=16，列1=流率（veh/s） 
    %c:单元素=信号周期
    %u：行数=交叉口数4，列1=4个交叉口再经历过一个相位后的到达时间
%     delay(i) = ctm_read_total_delay(); 

%     ctm_reset_delay();   %每个周期开始前，令all元胞延误=0

%     output(:,i) = ctm_read_lane_outputs();
    %行数=lane数，列数=周期数n，内容=流出车数，（对inputlane而言=0）
    
%     ctm_clean_outputs();

end

addglobal();
global dt_cell_length;
column_time_gary(dt_cell_length(ctm_lanes(1,14).o_cell:ctm_lanes(1,14).d_cell,:),true);
title('上游14号路元胞时空变化');
saveas(gcf,['上游14号路元胞时空acccycle',num2str(acc_cycles),'qin',num2str(input_vol),'cap',num2str(lowcap),'.fig']);
column_time_gary(dt_cell_length(ctm_lanes(1,10).o_cell:ctm_lanes(1,10).d_cell,:),true);
title('事故10号路元胞时空变化');
saveas(gcf,['事故10号路元胞时空acccycle',num2str(acc_cycles),'qin',num2str(input_vol),'cap',num2str(lowcap),'.fig']);

clc,clear,clear global;
close all; %关闭所有figure图框
end



