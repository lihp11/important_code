%% mesh_roadid points to cube_length points (longlat)
% ring or not ring all is ok
function cube_longlat = points_interp(origin_points,cube_length)
%origin_points:c_num=num of points(for ring:+1),c1=long,c2=lat
%cube_length£ºlength of cube
%cube_points: array:r_num=num of cube_length+1(repeated start(cannot>cube_length with last cubepoint))
%c1 = long,c2=lat
adj_length = global_distance(origin_points);
%vector:num=length(origin_points)-1,contens=length of adjacent node
%for ring's originpoints:the start will be repeated
cum_length = cumsum(adj_length);
%vector:num=length(origin_points)-1,contens=length of cumulative length
num_cube = floor(cum_length(end)/cube_length);
%single=num of cubes(<full length/cube_length)

cube_longlat(1,:) = origin_points(1,:);
for nth_cube = 1:num_cube
	cube_longlat(nth_cube+1,1) = interp1([0;cum_length],origin_points(:,1),cube_length*nth_cube);
	cube_longlat(nth_cube+1,2) = interp1([0;cum_length],origin_points(:,2),cube_length*nth_cube);
	%array:rownum=nth_cube+1,c1=long,c2=lat
end

%% add last special point of origin_points,no matter ring or lineroad
cube_longlat(end+1,:) = origin_points(end,:);
%array:rownum=nth_cube+2,c1=long,c2=lat
end