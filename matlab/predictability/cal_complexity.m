function c = cal_complexity(s,alpha,normalize)
%输入：s：具有alpha个symbol的字符串，alpha = symbol个数，normalize：logical变量，是否标准化
  n = length(s);
  c = 1;
  l = 1;

  i = 0;
  k = 1;
  k_max = 1;
  stop = 0;

  while stop==0
    if s(i+k) ~= s(l+k);
      if k > k_max;
        k_max=k;
      end
      i=i+1;
        
      if i==l
        c=c+1;
        l=l+k_max;
        if l+1>n
          stop=1;
        else
          i=0;
          k=1;
          k_max=1;
        end
      else
        k=1;
      end
    else
      k=k+1;
      if l+k > n
        c=c+1;
        stop=1;
      end
    end
  end
  if normalize
%     # a la Lempel and Ziv (IEEE trans inf theory it-22, 75 (1976), 
%     # h(n)=c(n)/b(n) where c(n) is the kolmogorov complexity
%     # and h(n) is a normalised measure of complexity.
    b=n/(log(n)/log(alpha));
    c = c/b;
  end
end