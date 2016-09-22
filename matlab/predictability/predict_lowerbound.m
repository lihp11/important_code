%计算可预测性下限regularaty
function lowpredict = predict_lowerbound(string,interval)
	n = length(string);	%单元素=字符数
	regularity=[];
	for i=2:n
		string_front = string(1:i-1);
		%向量：string的第i个字符前的字符串
		index_front = 1:i-1;
		
		index_mod = index_front(mod(i-index_front,interval)==0);
		%向量：内容=前i-1个字符中与第i个字符相距interval的字符位置
		string_mod = string_front(index_mod);
		%向量：内容=与index_mod对应的子串
		string_mod_unique = unique(string_mod);
		for j = 1:length(string_mod_unique)
			num(j) = length(strfind(string_mod,string_mod_unique(j)));
		end
		if (~isempty(string_mod_unique))
			regularity(end+1) = max(num)/sum(num);
			%向量：维数=其前有interval间隔的字符数，内容=下限值
		end
		num = [];
	end
		lowpredict = mean(regularity);
end
