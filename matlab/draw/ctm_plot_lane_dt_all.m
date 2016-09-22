function ctm_plot_lane_dt_all(input,lowcap)
%记录每个时间间隔所有lane的车队长，延误时间，input_cell排队车数（对output_lane而言=0），output_cell出去车数（对input_lane而言=0）
global dt_length dt_delay dt_waiting_length dt_out_length;  
%行数=全过程经历的s数，列数=16，内容=各lane的车队长，延误时间，input_cell排队车数（对output_lane而言=0），output_cell出去车数（对input_lane而言=0）
figure('name',['道路车辆数qin=',num2str(input),',cap=',num2str(lowcap)]);
for i =1:16
subplot(4,4,i);
plot(1:size(dt_length,1),dt_length(:,i)); %第i条lane的车队长度单位时间间隔的变化
xlabel('time(number of dt)'); ylabel('lane length');
if ismember(i,[1 4 6 8 9 11 14 15])
title(['lane',num2str(i),'(input)']);
else
title(['lane',num2str(i),'(normal)']);    
end
end
saveas(gcf,['道路车辆数qin',num2str(input),'cap',num2str(lowcap),'.fig']);

figure('name',['道路延误qin=',num2str(input),',cap=',num2str(lowcap)]);
for i =1:16
subplot(4,4,i);
plot(1:size(dt_delay,1),dt_delay(:,i)); %第i条lane的延误时间单位时间间隔的变化
xlabel('time(number of dt)'); ylabel('lane delay');
if ismember(i,[1 4 6 8 9 11 14 15])
title(['lane',num2str(i),'(input)']);
else
title(['lane',num2str(i),'(normal)']);    
end
end
saveas(gcf,['道路延误qin',num2str(input),'cap',num2str(lowcap),'.fig']);

figure('name',['道路排队qin=',num2str(input),',cap=',num2str(lowcap)]);
for i =1:16
subplot(4,4,i);
plot(1:size(dt_waiting_length,1),dt_waiting_length(:,i)); %第i条lane的input_cell排队车数（对output_lane而言=0）单位时间间隔的变化
xlabel('time(number of dt)'); ylabel('lane waiting length');
if ismember(i,[1 4 6 8 9 11 14 15])
title(['lane',num2str(i),'(input)']);
else
title(['lane',num2str(i),'(normal)']);    
end
end
saveas(gcf,['道路排队qin',num2str(input),'cap',num2str(lowcap),'.fig']);

figure('name',['道路输出数qin=',num2str(input),',cap=',num2str(lowcap)]);
output_index = [2 3 5 7 10 12 13 16 17 18 19 20 21 22 23 24];
for i =1:16
subplot(4,4,i);
plot(1:size(dt_out_length,1),dt_out_length(:,output_index(i))); %第i条lane的output_cell出去车数（对input_lane而言=0）单位时间间隔的变化
xlabel('time(number of dt)'); ylabel('lane out length');
title(['lane',num2str(output_index(i))]);
if ismember(output_index(i),14:24)
title(['lane',num2str(output_index(i)),'(output)']);
else
title(['lane',num2str(output_index(i)),'(normal)']);    
end
end
saveas(gcf,['道路输出数qin',num2str(input),'cap',num2str(lowcap),'.fig']);

end