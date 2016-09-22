%计算可预测性上限
function uppredict = predict_upperbound(string)
	n = length(string);	%单元素=字符数
	N = length(unique(string));	%symbol数
	lz_entropy = zeros(n,1);
	%up:行数=字符数，列1=相应行字符及之前字符的条件熵的上限
	for i=1:n
		lz_entropy(i,1) = lempel_ziv_entropy(string(1:i));
	end
	lz_entropy_mean = mean(lz_entropy);

	%由N和lz_entropy计算上限,参数方程采用 @(未知数，参数)(方程) 的形式
	lz_para_equation = @(x,c)(-(x*log(x)/log(2)+(1-x)*log(1-x)/log(2))+(1-x)*log(N-1)/log(2)-c);
	uppredict = fzero( @(x)lz_para_equation(x,lz_entropy_mean),0.5);

end