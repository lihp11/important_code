function addglobal()
	global_str = who('global');
	for i =1:size(global_str,1) %单元素=第i个全局变量，共size(global_str,1)个
 	eval(['global ',global_str{i,1}]);
    temp = eval(global_str{i,1});
    assignin('base',global_str{i,1},temp)
	end
end