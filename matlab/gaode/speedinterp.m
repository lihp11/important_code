function [A]=speedinterp(A)
%�Ծ����Ϊ0��Ԫ�ؽ��в�ֵ����������������ΧԪ��
m = size(A,1);  %��Ԫ�أ�����
n = size(A,2);  %��Ԫ�أ�����
    for i=1:n
        r = find(A(:,i)==0); %����=A�е�i��Ϊ0�ĸ�������1=��A(:,i)�е���λ��
        for j = 1:size(r)	%r������
            for k=1:(m-1)	%���Ӽ�m-1��
                if (r(j)+k)<=m && A(r(j)+k,i)~=0
                    A(r(j),i) = A(r(j)+k,i);	%����k��Ԫ����������
                    break
                elseif (r(j)-k)>=1 && A(r(j)-k,i)~=0
                    A(r(j),i) = A(r(j)-k,i); %����k��Ԫ����������
                    break
                end 
            end
        end
    end
end