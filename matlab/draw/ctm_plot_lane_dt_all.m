function ctm_plot_lane_dt_all(input,lowcap)
%��¼ÿ��ʱ��������lane�ĳ��ӳ�������ʱ�䣬input_cell�Ŷӳ�������output_lane����=0����output_cell��ȥ��������input_lane����=0��
global dt_length dt_delay dt_waiting_length dt_out_length;  
%����=ȫ���̾�����s��������=16������=��lane�ĳ��ӳ�������ʱ�䣬input_cell�Ŷӳ�������output_lane����=0����output_cell��ȥ��������input_lane����=0��
figure('name',['��·������qin=',num2str(input),',cap=',num2str(lowcap)]);
for i =1:16
subplot(4,4,i);
plot(1:size(dt_length,1),dt_length(:,i)); %��i��lane�ĳ��ӳ��ȵ�λʱ�����ı仯
xlabel('time(number of dt)'); ylabel('lane length');
if ismember(i,[1 4 6 8 9 11 14 15])
title(['lane',num2str(i),'(input)']);
else
title(['lane',num2str(i),'(normal)']);    
end
end
saveas(gcf,['��·������qin',num2str(input),'cap',num2str(lowcap),'.fig']);

figure('name',['��·����qin=',num2str(input),',cap=',num2str(lowcap)]);
for i =1:16
subplot(4,4,i);
plot(1:size(dt_delay,1),dt_delay(:,i)); %��i��lane������ʱ�䵥λʱ�����ı仯
xlabel('time(number of dt)'); ylabel('lane delay');
if ismember(i,[1 4 6 8 9 11 14 15])
title(['lane',num2str(i),'(input)']);
else
title(['lane',num2str(i),'(normal)']);    
end
end
saveas(gcf,['��·����qin',num2str(input),'cap',num2str(lowcap),'.fig']);

figure('name',['��·�Ŷ�qin=',num2str(input),',cap=',num2str(lowcap)]);
for i =1:16
subplot(4,4,i);
plot(1:size(dt_waiting_length,1),dt_waiting_length(:,i)); %��i��lane��input_cell�Ŷӳ�������output_lane����=0����λʱ�����ı仯
xlabel('time(number of dt)'); ylabel('lane waiting length');
if ismember(i,[1 4 6 8 9 11 14 15])
title(['lane',num2str(i),'(input)']);
else
title(['lane',num2str(i),'(normal)']);    
end
end
saveas(gcf,['��·�Ŷ�qin',num2str(input),'cap',num2str(lowcap),'.fig']);

figure('name',['��·�����qin=',num2str(input),',cap=',num2str(lowcap)]);
output_index = [2 3 5 7 10 12 13 16 17 18 19 20 21 22 23 24];
for i =1:16
subplot(4,4,i);
plot(1:size(dt_out_length,1),dt_out_length(:,output_index(i))); %��i��lane��output_cell��ȥ��������input_lane����=0����λʱ�����ı仯
xlabel('time(number of dt)'); ylabel('lane out length');
title(['lane',num2str(output_index(i))]);
if ismember(output_index(i),14:24)
title(['lane',num2str(output_index(i)),'(output)']);
else
title(['lane',num2str(output_index(i)),'(normal)']);    
end
end
saveas(gcf,['��·�����qin',num2str(input),'cap',num2str(lowcap),'.fig']);

end