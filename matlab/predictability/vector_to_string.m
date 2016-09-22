function [string,n] = vector_to_string(vector,n)
%输入：vector：向量，n：要转化为的字符串的symbol数
%输出：string：返回的具有n个symbol的字符串，长度=vector长度，n=要转化为的字符串的symbol数
m1 = max(vector); %单元素 = 向量最大值
m2 = min(vector);  %单元素 = 向量最小值
bin_length = (m1-m2)/n;  %区间长度
string = arrayfun(@(x)char(ceil((x-m2)/bin_length)+64),vector); %把每个vector的元素转化为1~n的symbol字符串，长度=原字符串
string(string == '@') = 'A';  %最小值较特殊，将char(64)变成char(65)=A 
end