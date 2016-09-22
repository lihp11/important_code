% 此函数将输入的时间序列矩阵用灰度表示
function h_f=column_time_gary(A,n)
%A：时间序列矩阵，行数=道路多个部分，列数=时间单元数，内容=道路该部分的属性
%n：逻辑变量，true表示列数=时间单元数；false时：行数=时间单元数
if ~n  %如果false
    A=A';
end
h_f = figure;
imagesc(A);
h_c = colorbar;
h_c.Label.String = '元胞车辆数';
h_a = gca;
h_a.Title = text(0,0,'元胞车辆数-时间变化图');
h_a.XLabel = text(0,0,'时间单元数');
h_a.YLabel = text(0,0,'元胞编号');
% h_a.XAxisLocation = 'top';
colormap parula;
set(gcf,'color','white');
set(gca, 'CLim', [0, 6]);
end