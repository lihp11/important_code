%% timespace plot with frag longlat and tsmat
function tsplot(frag_points,tsmat)
	%frag_points:rownum=num of frags+1,c1=long,c2=lat
	%tsmat:rownum=num_interval,cnum=num of frags,
	%content=values(speed) to display
	num_interval = size(tsmat,1);
	%single=num of interval=rownum of tsmat
	num_roadfrag = length(frag_points)-1;

	tgap = 0.00003*24*60/num_interval;
	%single=gap in zaxis when plot each interval,1min=0.00003

set(0,'defaultfigurecolor','w')  %set default backcolor
figure('Name','tsplot');
colormap('jet');
cmax = 80;
cmin =20;
caxis([cmin cmax])
colorbar;
colorbar('YTick',20:10:80,'YTickLabel',{'80','70','60','50','40','30','20'})
%YTick:80=read,20=blue
set(gca,'ZTick',0.00003*1440*[0,0.25,0.5,0.75,1],'ZTickLabel',{'0','6','12','18','24'})
%Ztick for time
tic;
	for nth_interval = 1:num_interval
		disp(['tsplot:dealing with ',num2str(nth_interval),' interval'])

		time_begin = (nth_interval-1)*tgap;	%single=nth_interval's begin z value
		time_end = nth_interval*tgap;	%single=nth_interval's end z value

		for nth_frag = 1:num_roadfrag
			patch_points = [frag_points(nth_frag,1),frag_points(nth_frag,2),time_begin
							frag_points(nth_frag+1,1),frag_points(nth_frag+1,2),time_begin
							frag_points(nth_frag+1,1),frag_points(nth_frag+1,2),time_end
							frag_points(nth_frag,1),frag_points(nth_frag,2),time_end];
			patch_color = cmax+cmin-tsmat(nth_interval,nth_frag);    %speed higer means color lower and bluer
			line_order = 1:4;
			patch('Faces',line_order,'vertices',patch_points,...
					'FaceVertexCData',patch_color,'facecolor','flat',...
					'edgecolor','none');
			hold on;
		end
	end
	view(120,30)
	xlabel('longtitude');
	ylabel('latitude');
	zlabel('time')
	title('tsplot')
toc;
end
