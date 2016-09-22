%% link struct_array to shuffled_link without taking ring into accout
function newlink = link_connect(link)
% arrange rows of link
	newlink = link(1);
	remain_link = link(2:end);
	for nth_row = 1:(length(link)-1)
		shiftrow = 1;
		while ~(issame_points(remain_link(shiftrow).longlat(1,:),newlink(1).longlat(1,:)) || ...
				issame_points(remain_link(shiftrow).longlat(end,:),newlink(1).longlat(1,:)) || ...
				issame_points(remain_link(shiftrow).longlat(1,:),newlink(end).longlat(end,:)) || ...
				issame_points(remain_link(shiftrow).longlat(end,:),newlink(end).longlat(end,:)) )
			shiftrow = shiftrow+1;
		end

		if (issame_points(remain_link(shiftrow).longlat(1,:),newlink(1).longlat(1,:)))
			%if find same points of newlink's beigin point
			%exchange remain_link(shifrow)'s node_start and node_end and flipud remain_link(shiftrow).longlat
			temp = remain_link(shiftrow).node_start;
			remain_link(shiftrow).node_start = remain_link(shiftrow).node_end;
			remain_link(shiftrow).node_end = temp;
			remain_link(shiftrow).longlat = flipud(remain_link(shiftrow).longlat);
			
			%increase newlink and decrease remain_link
			newlink = [remain_link(shiftrow),newlink];
			remain_link(shiftrow) = [];	%del new remain_link's matched shiftrow
		elseif (issame_points(remain_link(shiftrow).longlat(end,:),newlink(1).longlat(1,:)))
			%if find same points of newlink's beigin point
			newlink = [remain_link(shiftrow),newlink];
			remain_link(shiftrow) = [];	%del new remain_link's matched shiftrow
		elseif (issame_points(remain_link(shiftrow).longlat(1,:),newlink(end).longlat(end,:)))
			%if find same points of newlink's end point
			newlink = [newlink,remain_link(shiftrow)];
			remain_link(shiftrow) = [];	%del new remain_link's matched shiftrow
		else
			%if find same points of newlink's end point
			%exchange remain_link(shifrow)'s node_start and node_end and flipud remain_link(shiftrow).longlat
			temp = remain_link(shiftrow).node_start;
			remain_link(shiftrow).node_start = remain_link(shiftrow).node_end;
			remain_link(shiftrow).node_end = temp;
			remain_link(shiftrow).longlat = flipud(remain_link(shiftrow).longlat);

			newlink = [newlink,remain_link(shiftrow)];
			remain_link(shiftrow) = [];	%del new remain_link's matched shiftrow
		end		
	end
end