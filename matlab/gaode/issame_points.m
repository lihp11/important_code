function [flag] = issame_points( point1,point2 )
%�ж���������ͬһ����
%point1��2������=2����1=���ȣ���2=γ��
    flag = 0;
    if sum(abs(point1-point2)) <=0.00001
        flag = 1;
    end    
end

