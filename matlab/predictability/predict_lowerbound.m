%�����Ԥ��������regularaty
function lowpredict = predict_lowerbound(string,interval)
	n = length(string);	%��Ԫ��=�ַ���
	regularity=[];
	for i=2:n
		string_front = string(1:i-1);
		%������string�ĵ�i���ַ�ǰ���ַ���
		index_front = 1:i-1;
		
		index_mod = index_front(mod(i-index_front,interval)==0);
		%����������=ǰi-1���ַ������i���ַ����interval���ַ�λ��
		string_mod = string_front(index_mod);
		%����������=��index_mod��Ӧ���Ӵ�
		string_mod_unique = unique(string_mod);
		for j = 1:length(string_mod_unique)
			num(j) = length(strfind(string_mod,string_mod_unique(j)));
		end
		if (~isempty(string_mod_unique))
			regularity(end+1) = max(num)/sum(num);
			%������ά��=��ǰ��interval������ַ���������=����ֵ
		end
		num = [];
	end
		lowpredict = mean(regularity);
end
