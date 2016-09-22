%% expressway and vegetable
clc,clear,close all;
load('veget.mat');
% hb_bj_g2:rnum=52(d),c1=beijing ,c2=langfang,content=expressway daily avg_speed
% hb_bj_g4:rnum=52(d),c1=baoding,c2=beijing,c3=shijiazhuang,content=expressway daily avg_speed
% hb_bj_g6:rnum=52(d),c1=beijing,c2=zhangjiakou,content=expressway daily avg_speed
% sd_bj103:rnum=52(d),c1=beijing,c2=tianjin,content=expressway daily avg_speed
% sd_bj205:rnum=52(d),c1=binzhou,c2=cangzhou,c3=tianjin,c4=zibo,content=expressway daily avg_speed
% veget_price:rnum=52(d),c1=����,c2=��,c3=��ײ�,c4=����,c5=����,c6=���ܲ�,c7=�ƹ�,
%c8=����,c9=�۲�,c10=����,c11=С�ײ�,c12=�Ͳ�,c13=�����,content=price

% calc R of self
R_g2 = corrcoef(hb_bj_g2);
R_g4 = corrcoef(hb_bj_g4);
R_g6 = corrcoef(hb_bj_g6);
R_103 = corrcoef(sd_bj103);
R_205 = corrcoef(sd_bj205);
R_veget = corrcoef(veget_price);    %1,11,12,13 vs 2,3,4,5,6,9,10

set(0,'defaultfigurecolor','w')  %set default backcolor
figure('Name','���״洢');
plot(1:51,veget_price(:,[1,11,12,13]));
figure('Name','�״洢');
plot(1:51,veget_price(:,[2:6,9,10]));

veget_expway = [veget_price,hb_bj_g2,hb_bj_g4,hb_bj_g6,sd_bj103,sd_bj205];
%veget_expway:rnum=52(d),c1-c13:veget_price,c14-c15:hb_bj_g2,c16-c18:hb_bj_g4,
%c19-c20:hb_bj_g6,c21-22:sd_bj103,c23-c26:sd_bj205
R_veget_expway = corrcoef(veget_expway);

%% �״洢��ĳЩ����
figure('Name','�����״洢�߲�');
x_date = 1:51;
y_vegetprice = veget_expway(:,2:5);
y_expwayspeed = veget_expway(:,[17,20]);
[ax,h_l1,h_l2]=plotyy(x_date,y_vegetprice,x_date,y_expwayspeed,'plot');

	% set(ax(1),'XColor','k','YColor','b');
	% set(ax(2),'XColor','k','YColor','r');

% set xlabel,ylabel1,ylabel2
xlabel('����','fontname','����','FontWeight','bold','FontSize',12)

h_ylabel1 = get(ax(1),'ylabel');	% text object
set(h_ylabel1,'string','�˼�(Ԫ/��)','fontname','����',...
	'FontWeight','bold','FontSize',12);
h_ylabel2 = get(ax(2),'ylabel');
set(h_ylabel2,'string','�ٶ�(km/h)','fontname','����',...
	'FontWeight','bold','FontSize',12);
set(h_l2,'linewidth',1.5);

% set legend
		% legend([h_l1',h_l2'],{'��','��ײ�','����','����','G4����-����','G6����-�żҿ�'});
legend(h_l1',{'��','��ײ�','����','����'});
legend(h_l2',{'G4����-����','G6����-�żҿ�'});

% set xtick
set(ax,'xlim',[0,52],'xtick',5:5:50,'xticklabel',{'5-05','5-10',...
	'5-15','5-20','5-25','5-30','6-04','6-09','6-14','6-19'});
	%gca = ax(1),but  ax(2) also have x property

% set ylim1,ylime2,interval
set(ax(1),'ylim',[0,5],'ytick',0:5);
set(ax(2),'ylim',[50,100],'ytick',50:10:100);

%set title
title('�״洢�߲����������״��','fontname','����',...
	'FontSize',14,'FontWeight','bold');



%% ���״洢��ĳЩ����
figure('Name','���ٲ��״洢�߲�');
x_date = 1:49;
y_vegetprice = veget_expway(3:51,[1,11,12,13]);
y_expwayspeed = veget_expway(1:49,[15,17,19]);
[ax,h_l1,h_l2]=plotyy(x_date,y_vegetprice,x_date,y_expwayspeed,'plot');

	% set(ax(1),'XColor','k','YColor','b');
	% set(ax(2),'XColor','k','YColor','r');

% set xlabel,ylabel1,ylabel2
xlabel('����','fontname','����','FontWeight','bold','FontSize',12)

h_ylabel1 = get(ax(1),'ylabel');	% text object
set(h_ylabel1,'string','�˼�(Ԫ/��)','fontname','����',...
	'FontWeight','bold','FontSize',12);
h_ylabel2 = get(ax(2),'ylabel');
set(h_ylabel2,'string','�ٶ�(km/h)','fontname','����',...
	'FontWeight','bold','FontSize',12);
set(h_l2,'linewidth',1.5);

% set legend
legend(h_l1',{'����','С�ײ�','�Ͳ�','�����'});
legend(h_l2',{'G2����-�ȷ�','G4����-����','G6����-����'});

% set xtick
set(ax,'xlim',[0,50],'xtick',3:5:53,'xticklabel',{'5-05','5-10',...
	'5-15','5-20','5-25','5-30','6-04','6-09','6-14','6-19'});
	%gca = ax(1),but  ax(2) also have x property

% set ylim1,ylime2,interval
set(ax(1),'ylim',[0,10],'ytick',0:10);
set(ax(2),'ylim',[50,100],'ytick',50:10:100);

%set title
title('���״洢�߲����������״��','fontname','����',...
	'FontSize',14,'FontWeight','bold');



