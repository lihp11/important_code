%%CPI,����,����,��֤,��ͨ·��ָ��

%% ���ݶ�ȡ
clc,clear,close all;
stock = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��֤.xlsx',1,'D2:D63');%����=169��ѡȡ��������,��1=��Ʊ����ָ�����ӽ���Զ��
stock = flipud(stock);%����=169��ѡȡ��������,��1=��Ʊ����ָ������Զ������
disp('��ָ֤����ȡ��ϣ�');

cpi_tongbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\����CPIָ��.xlsx',1,'G1:G62');%����=99��ѡȡ���·�����,��1=cpi���ӽ���Զ��
cpi_tongbi = flipud(cpi_tongbi); %����=101��ѡȡ���·�����,��1=cpiͬ����������Զ������
cpi_huanbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\����CPIָ��.xlsx',1,'H1:H62');%����=99��ѡȡ���·�����,��1=cpi���ӽ���Զ��
cpi_huanbi = flipud(cpi_huanbi); %����=101��ѡȡ���·�����,��1=cpi������������Զ������
disp('CPI����ȡ��ϣ�');

housebj_huanbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��������.xlsx',1,'A2:A63'); %down8:ȫ��
housebj_huanbi = flipud(housebj_huanbi);
housebj_tongbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��������.xlsx',1,'B2:B63');
housebj_tongbi = flipud(housebj_tongbi);
housesh_huanbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��������.xlsx',1,'C2:C63');
housesh_huanbi = flipud(housesh_huanbi);
housesh_tongbi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��������.xlsx',1,'D2:D63');
housesh_tongbi = flipud(housesh_tongbi);  %����=62.��1=����ͬ�Ȼ򻷱�ָ��
disp('����ָ����ȡ��ϣ�');

usa_unemploy = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\����ʧҵ��.xlsx',1,'C2:C63'); %��ֵʧҵ��
usa_unemploy = flipud(usa_unemploy); 
disp('usa_unemploy��ȡ��ϣ�');

usa_cpi = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\�������������ָ��.xlsx',1,'C2:C63'); %��ֵ��ۻ��ȱ仯��
usa_cpi = flipud(usa_cpi);
disp('usa_cpi��ȡ��ϣ�');

gasoline_93_price =  xlsread('g:\2015_Autumn\transport_research\��Ԥ����\�ͼ�����.xlsx',1,'E4:E65'); %93���ͼ۸�
gasoline_93_price = flipud(gasoline_93_price);
gasoline_97_price =  xlsread('g:\2015_Autumn\transport_research\��Ԥ����\�ͼ�����.xlsx',1,'G4:G65'); %97���ͼ۸�
gasoline_97_price = flipud(gasoline_97_price);
disel_price = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\�ͼ�����.xlsx',1,'I4:I65'); %����
disel_price = flipud(disel_price);
disp('�й��ͼ۶�ȡ��ϣ�');

bj_city_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',1,'E2:E63'); 
tj_city_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',1,'E275:E336');
bj_city_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',1,'F2:F63'); 
tj_city_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',1,'F275:F336'); 
bj_city_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',1,'G2:G63'); 
tj_city_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',1,'G275:G336'); 
disp('���������н�ָͨ���ȡ��ϣ�');


tj_urban_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',2,'C2:C63'); 
tj_urban_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',2,'D2:D63'); 
tj_urban_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',2,'E2:E63'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_heping_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'F2:F63'); 
tj_heping_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'G2:G63'); 
tj_heping_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'H2:H63'); 
disp('����ƽ����ָͨ���ȡ��ϣ�');

tj_hebei_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'F1094:F1155'); 
tj_hebei_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'G1094:G1155'); 
tj_hebei_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'H1094:H1155'); 
disp('���ӱ�����ָͨ���ȡ��ϣ�');

tj_hedong_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'F275:F336'); 
tj_hedong_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'G275:G336'); 
tj_hedong_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'H275:H336'); 
disp('���Ӷ�����ָͨ���ȡ��ϣ�');

tj_hexi_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'F548:F609'); 
tj_hexi_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'G548:G609'); 
tj_hexi_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'H548:H609'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_hongqiao_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'F1367:F1430'); 
tj_hongqiao_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'G1367:G1430'); 
tj_hongqiao_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'H1367:H1430'); 
disp('����������ָͨ���ȡ��ϣ�');

tj_nankai_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'F821:F882'); 
tj_nankai_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'G821:G882'); 
tj_nankai_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',3,'H821:H882'); 
disp('����Ͽ�����ָͨ���ȡ��ϣ�');

tj_freeway_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',4,'C2:C63'); 
tj_freeway_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',4,'D2:D63'); 
tj_freeway_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',4,'E2:E63'); 
disp('������·��ָͨ���ȡ��ϣ�');

tj_outring_vf = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',5,'C2:C63'); 
tj_outring_vm = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',5,'D2:D63'); 
tj_outring_conjestion_index = xlsread('g:\2015_Autumn\transport_research\��Ԥ����\��򼾶ȱ�����������_ÿ��3��.xlsx',5,'E2:E63'); 
disp('����⻷��ָͨ���ȡ��ϣ�');
rand_num = rand(1,61);
fix_num = ones(1,61);
indicator_cell = {stock,...
    cpi_tongbi,cpi_huanbi,...
    housebj_huanbi,housebj_tongbi,housesh_huanbi,housesh_tongbi,...
    usa_unemploy,...
    usa_cpi,...
    gasoline_93_price,gasoline_97_price,disel_price,...
    bj_city_vf,tj_city_vf,bj_city_vm,tj_city_vm,bj_city_conjestion_index,tj_city_conjestion_index,...
    tj_urban_vf,tj_urban_vm,tj_urban_conjestion_index,...
    tj_heping_vf,tj_heping_vm,tj_heping_conjestion_index,...
    tj_hebei_vf,tj_hebei_vm,tj_hebei_conjestion_index,...
    tj_hedong_vf,tj_hedong_vm,tj_hedong_conjestion_index,...
    tj_hexi_vf,tj_hexi_vm,tj_hexi_conjestion_index,...
    tj_hongqiao_vf,tj_hongqiao_vm,tj_hongqiao_conjestion_index,...
    tj_nankai_vf,tj_nankai_vm,tj_nankai_conjestion_index,...
    tj_freeway_vf,tj_freeway_vm,tj_freeway_conjestion_index,...
    tj_outring_vf,tj_outring_vm,tj_outring_conjestion_index,...
    rand_num,fix_num}'; %����=ָ����������,����=1,����=��ָ��vector����������
num_indicator = length(indicator_cell);
%% ���ӶȺ�������
indicator_complexity = cell(9,1);  
%indicator_complexity��cell���飬����=9������=1��
%indicator_complexity{i,i}:����=ָ����=indicator_cell��Ԫ��������1=ָ�긴�Ӷ�
indicator_string = cell(9,1);
indicator_nsymbol = cell(9,1);
for i = 2:10
%�����ֵ��Сֵ�ֳɵ�������
[indicator_string{i-1,1},indicator_nsymbol{i-1,1}] = arrayfun(@(x)vector_to_string(x{:},i),indicator_cell,'UniformOutput',false); 
%indicator_string{i-1,1}��cell���飺����=ָ����,��1=��ָ���ַ�����
%indicator_nsymbol{i-1,1}��cell���飺����=ָ����,��1=ָ����������
indicator_complexity{i-1,1} = arrayfun(@(x,y,z)cal_complexity(x{:},y{:},z),indicator_string{i-1,1},indicator_nsymbol{i-1,1},ones(num_indicator,1));
%indicator_complexity{i-1,1}:����=ָ����,��1=���Ӷ�
end
complexity = zeros(num_indicator,9); %����=ָ��������i=�ֳ�i+1�������ָ�긴�Ӷ�
for i = 1:9
    complexity(:,i) = indicator_complexity{i,1};
end

% complexity(:,end+1) = arrayfun(@(x)x{:},indicator_complexity,'UniformOutput',false); %Uniform ����д��ڷǱ���ֵʱӦ�� 'UniformOutput' ����Ϊ false��
% %�Ὣarrayfunһ����ִ�����Ϊ9��1��cell
