function addglobal()
	global_str = who('global');
	for i =1:size(global_str,1) %��Ԫ��=��i��ȫ�ֱ�������size(global_str,1)��
 	eval(['global ',global_str{i,1}]);
    temp = eval(global_str{i,1});
    assignin('base',global_str{i,1},temp)
	end
end