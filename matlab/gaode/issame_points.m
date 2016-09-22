function [flag] = issame_points( point1,point2 )
%判断两个点是同一个点
%point1和2：行数=2，列1=经度，列2=纬度
    flag = 0;
    if sum(abs(point1-point2)) <=0.00001
        flag = 1;
    end    
end

