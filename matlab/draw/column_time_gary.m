% �˺����������ʱ�����о����ûҶȱ�ʾ
function h_f=column_time_gary(A,n)
%A��ʱ�����о�������=��·������֣�����=ʱ�䵥Ԫ��������=��·�ò��ֵ�����
%n���߼�������true��ʾ����=ʱ�䵥Ԫ����falseʱ������=ʱ�䵥Ԫ��
if ~n  %���false
    A=A';
end
h_f = figure;
imagesc(A);
h_c = colorbar;
h_c.Label.String = 'Ԫ��������';
h_a = gca;
h_a.Title = text(0,0,'Ԫ��������-ʱ��仯ͼ');
h_a.XLabel = text(0,0,'ʱ�䵥Ԫ��');
h_a.YLabel = text(0,0,'Ԫ�����');
% h_a.XAxisLocation = 'top';
colormap parula;
set(gcf,'color','white');
set(gca, 'CLim', [0, 6]);
end