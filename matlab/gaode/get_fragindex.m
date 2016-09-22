%% data longlat and fragpoints to index_frag index
function index_frag = get_fragindex(longlat,frag_points)
	%longlat:rownum=many(m),c1=long,c2=lat
	%frag_points:rownum=num of frags+1,c1=long,c2=lat
	%index_frag:vector,rownum=m
	m = length(longlat);
	%single = rownum of data
	index_frag = zeros(m,1);
	%index_frag:vector:rownum=m,c1=index of frag
	num_roadfrag = length(frag_points)-1;	%single=num of road fragment
	
	for nth_data =1:m

		index = 1;
		%index:single=the nth_data's frag index
		while ((longlat(nth_data,1)-frag_points(index,1))*(longlat(nth_data,1)-frag_points(index+1,1))>0 ||...
				(longlat(nth_data,2)-frag_points(index,2))*(longlat(nth_data,2)-frag_points(index+1,2))>0)
			index = index+1;
			if (index>num_roadfrag)
				index = 0;		%can not find idnex_frag
				break;
			end
		end
		index_frag(nth_data) = index;
	end
end