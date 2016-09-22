function [string,n] = vector_to_string(vector,n)
%���룺vector��������n��Ҫת��Ϊ���ַ�����symbol��
%�����string�����صľ���n��symbol���ַ���������=vector���ȣ�n=Ҫת��Ϊ���ַ�����symbol��
m1 = max(vector); %��Ԫ�� = �������ֵ
m2 = min(vector);  %��Ԫ�� = ������Сֵ
bin_length = (m1-m2)/n;  %���䳤��
string = arrayfun(@(x)char(ceil((x-m2)/bin_length)+64),vector); %��ÿ��vector��Ԫ��ת��Ϊ1~n��symbol�ַ���������=ԭ�ַ���
string(string == '@') = 'A';  %��Сֵ�����⣬��char(64)���char(65)=A 
end