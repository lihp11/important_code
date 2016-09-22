function [A]=speedinterp(A)
%对矩阵的为0的元素进行插值，让其等于最近的周围元素
m = size(A,1);  %单元素，行数
n = size(A,2);  %单元素，列数
    for i=1:n
        r = find(A(:,i)==0); %行数=A中第i列为0的个数，列1=在A(:,i)中的行位置
        for j = 1:size(r)	%r的行数
            for k=1:(m-1)	%最大加减m-1次
                if (r(j)+k)<=m && A(r(j)+k,i)~=0
                    A(r(j),i) = A(r(j)+k,i);	%用下k个元素替代上面的
                    break
                elseif (r(j)-k)>=1 && A(r(j)-k,i)~=0
                    A(r(j),i) = A(r(j)-k,i); %用上k个元素替代上面的
                    break
                end 
            end
        end
    end
end