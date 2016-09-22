%% gaode daily_data to timespace speed array
function tsstruct = dailydata_to_tsstruct(time,longlat,speed,frag_points,time_interval)
%time:rownum=many(m),c1=time like 2015110116203100；
%longlat:rownum=m,c1=long,c2=lat(can be any road points like origin_points(shuffled) or 
%cube longlat but all must continuous and spread the road you want)
%speed：rownum=m,c1=speed
%frag_points:rownum=num of frags+1,c1=long,c2=lat
%time_interval:single=time interval of tsstruct array in min
tic;
num_interval = 24*60/time_interval;		%single=num of timeinterval in a day
num_roadfrag = length(frag_points)-1;	%single=num of road fragment
m = length(longlat);
%single = rownum of data
month = fix(time./(1e8)) - (2015*1e2);  
%rownum=m,c1=month
day = fix(time./(1e6)) - (2015*1e4+month*1e2);  
%rownum=m,c1=day
hour = fix(time./(1e4)) - (2015*1e6+month*1e4+day.*1e2);
%rownum=m,c1=hour
minute = fix(time./(1e2)) - (2015*1e8+month*1e6+day.*1e4+hour.*1e2);
%rownum=m,c1=minute

past_minute = hour*60+minute;
%rownum=m,c1=total minute in one day
index_interval = floor(past_minute/time_interval)+1;
%rownum=m,c1=data is in c1'th interval of one day
index_frag = get_fragindex(longlat,frag_points);

% initiation
for nth_interval = 1:num_interval
	for nth_frag = 1:num_roadfrag
		tsstruct(nth_interval,nth_frag).speed = [];
		%tsstruct:struct array,rownum=num_interval,cnum=num_roadfrag
		%tsstruct(nth_interval,nth_frag):struct,f1=speed(vector)
		%f2=num_stamp(num of stamp points),f3=avg_speed(NaN if none)
	end
end
% add data points to frag
for nth_data = 1:m
	if index_frag(nth_data)>0
		tsstruct(index_interval(nth_data),index_frag(nth_data)).speed = ...
			[tsstruct(index_interval(nth_data),index_frag(nth_data)).speed;speed(nth_data)];
	end
end
% calc frag's num_stamp
for nth_interval = 1:num_interval
	for nth_frag = 1:num_roadfrag
		tsstruct(nth_interval,nth_frag).num_stamp = length(tsstruct(nth_interval,nth_frag).speed);
		tsstruct(nth_interval,nth_frag).avg_speed = mean(tsstruct(nth_interval,nth_frag).speed);
	end
end

toc;
disp('一天计算完毕！');
end