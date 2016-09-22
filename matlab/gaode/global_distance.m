%n��2��γ�����n-1���������
function L = global_distance(points)   

len = size(points,1);
if len >1
    y = points(:,2);     %%%%%%γ��
    x = points(:,1);     %%%%%%����
    R =6400000;
    L = 0;
    for i =1:len-1
        L(i,1) = R * acos(cosd(y(i))*cosd(y(i+1))*cosd(x(i)-x(i+1))+sind(y(i))*sind(y(i+1)));
    end
else
    L =0;
end
end