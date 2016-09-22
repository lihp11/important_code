%����Lempel-Ziv��
function lz_entropy=lempel_ziv_entropy(string)
	%sting���ַ���
	n = length(string);

	for i=1:n
		if i==1
			sumlength = 1;
		else
			substring = string(i);
			sublength = 1;
			while ( ~isempty( strfind( string(1:i-1),substring ) ) )
				if (i-1+sublength==n)
					break;
				end
				sublength = sublength+1;
				substring = string(i:i-1+sublength);
			end
			if (isempty( strfind( string(1:i-1),substring ) ))	%����ԭ��Ϊ�����ִ�ʱ
				sumlength = sumlength+sublength;
			end
		end
	end
	lz_entropy = n*log(n)/(sumlength);
end