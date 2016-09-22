%�����Ԥ��������
function uppredict = predict_upperbound(string)
	n = length(string);	%��Ԫ��=�ַ���
	N = length(unique(string));	%symbol��
	lz_entropy = zeros(n,1);
	%up:����=�ַ�������1=��Ӧ���ַ���֮ǰ�ַ��������ص�����
	for i=1:n
		lz_entropy(i,1) = lempel_ziv_entropy(string(1:i));
	end
	lz_entropy_mean = mean(lz_entropy);

	%��N��lz_entropy��������,�������̲��� @(δ֪��������)(����) ����ʽ
	lz_para_equation = @(x,c)(-(x*log(x)/log(2)+(1-x)*log(1-x)/log(2))+(1-x)*log(N-1)/log(2)-c);
	uppredict = fzero( @(x)lz_para_equation(x,lz_entropy_mean),0.5);

end