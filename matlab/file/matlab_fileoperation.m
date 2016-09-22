%matlab file operation
clc,clear all;

%% linspace and structfun

%down:find 3 num from[1,4]
x1 = linspace(1,4,3);
S.a = @sin;
S.b = @cos;
S.c = @tan;
%down:x represent S.a,S.b,S.c respectively
%down:handlevarname=@funname=@(args)expr (can be fun args)  methods:handlevarname(args)
S2 = structfun(@(x)x(linspace(1,4,3)),S,'uniformoutput',false)

%% load & save
%save: save var into files mehond:save(filename,variables,fmt)
p = rand(1,10);
q = ones(3,3);
save('pqfile.txt','p','q','-ascii');	%tab as defalut delim
type('pqfile.txt');

%load function
			% load(filename) loads data from filename.
			% If filename is an ASCII file, then load(filename) creates a double-precision array containing data from the file.
			% example
			% load(filename,variables) loads the specified variables from the MAT-file, filename.
			% example
			% load(filename,'-ascii') treats filename as an ASCII file, regardless of the file extension.
			% load(filename,'-mat') treats filename as a MAT-file, regardless of the file extension.
			% load(filename,'-mat',variables) loads the specified variables from filename.
			% example
			% S = load(___) loads data into S, using any of the input arguments in the previous syntax group.
			% If filename is a MAT-file, then S is a structure array.
			% If filename is an ASCII file, then S is a double-precision array containing data from the file.
	%load mat variable
filename = 'durer.mat';
myVars = {'X','caption'}; %Ã‚Â¿Ãƒâ€°Ãƒâ?ÃƒÆ’Ãƒâ€¢ÃƒÂ½Ãƒâ?ÃƒÂ²
S = load(filename,myVars{:});
	%load ascii files:load ascii need:(1)all nums;(2)delims can vary or combine using ,;\s\t
a = magic(4);
b = ones(2, 4) * -5.7;
c = [8 6 4 2];
save('mydata.dat','a','b','c','-ascii')
clear('a','b','c');
load ('mydata.dat', '-ascii');
	%load using regular expression
load('mydata.mat','-regexp','^Mon|^Tue|^Wed');	%load var beginning from Mon or Tue or Wed

%% regular expression
%regexp mehonds:[startIndex,endIndex] = regexp(str,expression)
str = '<title>My Title</title><p>Here is some text.</p>';
expression = '<(\w+).*>.*</\1>';
[tokens,matches] = regexp(str,expression,'tokens','match');

%regexprep :replace searched regstr with reg,methods:newStr = regexprep(str,expression,replace,option1,...optionM)
str = 'here are two sentences. neither is capitalized.';
expression = '(^|\.)\s*.';
replace = '${upper($0)}';	 % ${} use matlab command,$0=expression
newStr = regexprep(str,expression,replace);

%regexptranslate:	method:regexptranslate(type,expr)
files = ['test1.mat, myfile.mat, newfile.txt, ' ...
         'jan30.mat, table3.xls'];
regexp(files, regexptranslate('wildcard', '*.mat'), 'match');
regexptranslate('wildcard','*.mat');  %.*\.mat

%strfind:find pattern from str,return index.	method:k = strfind(str,pattern)
str = 'Find the starting indices of a pattern in a character vector';
k = strfind(str,'in') ;%     2    15    19    40

str = {'How much wood would a woodchuck chuck';
       'if a woodchuck could chuck wood?'};
idx = strfind(str,'wood');

%strcmp:compare if s1 and s2 are equal.		method:tf = strcmp(s1,s2)  (s1=s2 return 1 else 0)
s1 = 'Yes';
s2 = 'No';
tf = strcmp(s1,s2); %0

s1 = 'upon';
s2 = {'Once','upon';
      'a','time'};
tf = strcmp(s1,s2); %2*2array

s1 = {'Time','flies','when';
      'you''re','having','fun.'};
s2 = {'Time','drags','when';
      'you''re','anxiously','waiting.'};
tf = strcmp(s1,s2); %2*3array

%strcmpi:strcmp ignoring case.
A = {'Handle Graphics', 'Statistics';   ...
     '  Toolboxes', 'MathWorks'};

B = {'Handle Graphics', 'Signal Processing';    ...
     'Toolboxes', 'MATHWORKS'};
match = strcmpi(A, B); 	%2*2array

%strncmp:strcmp only front n chars.
chars2compare = length('Kansas City, KS') - 2;
strncmp('Kansas City, KS', 'Kansas City, MO', chars2compare); %1

%strjoin:cellarray to string methodÂ£Â»str = strjoin(C,delimiter) or str = strjoin(C)
C = {'one','two','three'};
str = strjoin(C); %one two three

C = {'Newton','Gauss','Euclid','Lagrange'};
str = strjoin(C,', '); %Newton, Gauss, Euclid, Lagrange

%strcatÂ£Âºnstring to string 	method:s = strcat(s1,...,sN)
s1 = 'Good';
s2 = 'morning';
s = strcat(s1,s2); %Goodmorning

s1 = {'abcde','fghi'};
s2 = {'jkl','mn'};
s = strcat(s1,s2);	%  'abcdejkl'    'fghimn'

firstnames = {'Abraham'; 'George'};
lastnames = {'Lincoln'; 'Washington'};
names = strcat(lastnames, {', '}, firstnames);	% r1='Lincoln, Abraham',r2= 'Washington, George'

%strsplit string to nstring		mehods:C = strsplit(str,delimiter,Name,Value)
data = '1.21, 1.985, 1.955, 2.015, 1.885';
C = strsplit(data,', ') %1*5cellarray

data = '1.21m/s1.985m/s 1.955 m/s2.015 m/s 1.885m/s';
[C,matches] = strsplit(data,'\s*m/s\s*','DelimiterType','RegularExpression');
			% C = 
			%     '1.21'    '1.985'    '1.955'    '2.015'    '1.885'    ''
			% matches = 
			%     'm/s'    'm/s '    ' m/s'    ' m/s '    'm/s'	
	%multiple delimiters 			
str = 'The rain in Spain stays mainly in the plain.';
[C,matches] = strsplit(str,{' ','ain'},'CollapseDelimiters',true);
			% C = 
			%   Columns 1 through 9
			%     'The'    'r'    'in'    'Sp'    'stays'    'm'    'ly'    'in'    'the'
			%   Columns 10 through 11
			%     'pl'    '.'
			% matches = 
			%   Columns 1 through 9
			%     ' '    'ain '    ' '    'ain '    ' '    'ain'    ' '    ' '    ' '
			%   Column 10
			%     'ain'

%% text import

%importdata
			% A = importdata(filename)example
			% A = importdata('-pastespecial')example
			% A = importdata(___,delimiterIn)
			% A = importdata(___,delimiterIn,headerlinesIn)example
			% [A,delimiterOut,headerlinesOut] = importdata(___)
data = importdata('gdp_person.txt',' ',2);
data1 = importdata('pqfile.txt',' ');
data2 = importdata('mydata.dat',' ');

%dlmread
			% M = dlmread(filename)
			% M = dlmread(filename,delimiter)
			% M = dlmread(filename,delimiter,R1,C1)
			% M = dlmread(filename,delimiter,[R1 C1 R2 C2])
M = dlmread('rand.txt','',[2 2 4 4]);
M = dlmread('rand.txt','','C3..E5');

%% fileXXX

%fopen  method1:fileID = fopen(filename,permission,machinefmt,encodingIn)
		%method2:[filename,permission,machinefmt,encodingOut] = fopen(fileID)
		%machinefmt = order of bytes,encoding = 'GBK' in china sys 
fileID = fopen('mydata.dat','r','n');
[filename,permission,machinefmt,encodingOut] = fopen(fileID);
fclose(fileID);

%fseek   method1:fseek(fileID, offset, origin)
		%method2:status = fseek(fileID, offset, origin)

		% Create files test1.dat and test2.dat
		% Each character uses 8 bits (1 byte)
fid1 = fopen('test1.dat', 'w+');
fwrite(fid1, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');

fid2 = fopen('test2.dat', 'w+');
fwrite(fid2, 'Second File');

		% Seek to the 10th byte ('J'), read 5
fseek(fid1, 9, 'bof');
A = fread(fid1, 5, 'uint8=>char');
fclose(fid1);

		% Append to test2.dat
fseek(fid2, 0, 'eof');
fwrite(fid2, A);
fclose(fid2);

%frewind(fileID) = fseek(fileID,0,'bof')

%ftell:method:position = ftell(fileID)

%fread:method:A = fread(fileID,sizeA,precision,skip,machinefmt)
		%read entire file of unit8 data
fileID = fopen('nine.bin','w');
fwrite(fileID,[1:9]);
fclose(fileID);
fileID = fopen('nine.bin');
A = fread(fileID);
		%read entire file of double data(64bit)
fileID = fopen('doubledata.bin','w');
fwrite(fileID,magic(3),'double');
fclose(fileID);
fileID = fopen('doubledata.bin');
A = fread(fileID,[3 3],'double');
fclose(fileID);
		%read text file
fileID = fopen('mydata.dat');
A = fread(fileID,'*char')';
fclose(fileID);

		%read selected rows or columns from file
fileID = fopen('nine.bin','w');
fwrite(fileID,[1:9],'uint16');
fclose(fileID);
fileID = fopen('nine.bin');
A = fread(fileID,[2,3],'uint16');

		%read 2*unit16 into B and discard 2-bytes(one unit16 num)
frewind(fileID);
precision = '2*uint16';
skip = 2;
B = fread(fileID,[2,3],precision,skip);
fclose(fileID);

		%read and print hex
str = ['AB'; 'CD'; 'EF'; 'FA'];
fileID = fopen('bcd.bin','w');
fwrite(fileID,hex2dec(str),'ubit8');	%write binary ABCDEFFA into file
fclose(fileID);

fileID = fopen('bcd.bin');
onebyte = fread(fileID,4,'*ubit8');		%4*1 num vector
disp(dec2hex(onebyte));

frewind(fileID);
err = fread(fileID,8,'*ubit4');		%8*1 num vector=[11 10 13 12 15 14 10 15]'
disp(dec2hex(err));		%BADCFEAF

frewind(fileID);
correct = fread(fileID,8,'*ubit4','ieee-be');		%big-endian mode first A then B
disp(dec2hex(correct));		%ABCDEFA
fclose(fileID);

%fwrite: write binary to files,methods:count = fwrite(fileID,A,precision,skip,machinefmt)

		%write 4-byte integers to binary file
fileID = fopen('magic5.bin','w');
fwrite(fileID,magic(5),'integer*4');	%integer*4=4byte
fclose(fileID);

%fclose:method1:fclose(fileID)
		%method2:fclose('all')
		%method3:status = fclose('all');
%feof:to see if read to the end,method:status = feof(fileID)
fid = fopen('nine.bin','r');
fseek(fid,0,'eof');
fend = ftell(fid);		%single:18=num of bytes in nine.bin
x = feof(fid);		%single:0

fseek(fid,0,'bof');
data = fread(fid);
x = feof(fid);		%single:1

%ferror
		% message = ferror(fileID)
		% [message, errnum] = ferror(fileID)
		% [...] = ferror(fileID, 'clear')


%% text format import

%textscan:output is a cell array
str = '0.41 8.24 3.57 6.24 9.27';
C = textscan(str,'%f');	%like c++, do not read space, but can skip at beginning
C2 = textscan(str,'%3.1f %*1d');

fileID = fopen('scan1.dat');
C = textscan(fileID,'%s %s %f32 %d8 %u %f %f %s %f');
fclose(fileID);
celldisp(C);

		%remove a literal string
fileID = fopen('scan1.dat');
C = textscan(fileID,'%s Level%d %f32 %d8 %u %f %f %s %f');
fclose(fileID);
disp(C{2});
disp(class(C{2}));

		%skip the remainder of a line
fileID = fopen('scan1.dat');
dates = textscan(fileID,'%s %*[^\n]');	%read untile meet \n(not inlcude) and drop it
fclose(fileID);
disp(dates{1});

		%Specify Delimiter and Empty Value Conversion
fileID = fopen('data.csv');
C = textscan(fileID,'%f %f %f %f %u8 %f ',...
'Delimiter',',','EmptyValue',-Inf);
fclose(fileID);

		%Treat Repeated Delimiters as One
fileID = fopen('data3.csv');
C = textscan(fileID,'%f %f %f %f','Delimiter',',',...
'MultipleDelimsAsOne',1);
fclose(fileID);
celldisp(C);

		% Specify Repeated Conversion Specifiers and Collect Numeric Data
fileID = fopen('grades.txt');
formatSpec = '%s';
N = 4;
C_text = textscan(fileID,formatSpec,N,'Delimiter','|');
C_data0 = textscan(fileID,'%d %f %f %f');
		%collect the consecutive columns of the same class into a single array
frewind(fileID);
C_text = textscan(fileID,'%s',N,'Delimiter','|');
C_data1 = textscan(fileID,['%d',repmat('%f',[1,3])],'CollectOutput',1);
fclose(fileID);

		%Read or Skip Quoted Strings and Numeric Fields
fileID = fopen('names.txt','r');
C = textscan(fileID,'%q %*q %*d %f','Delimiter',',');
fclose(fileID);
celldisp(C);

		%Read Foreign-Language Dates
fileID = fopen('myfile.txt','w','n','ISO-8859-15');
fprintf(fileID,'1 Januar 2014, 20.2, 100.5 \n');
fprintf(fileID,'1 Februar 2014, 21.6, 102.7 \n');
fprintf(fileID,'1 March 2014, 20.7, 99.8 \n');
fclose(fileID);

fileID = fopen('myfile.txt','r','n','ISO-8859-15');
C = textscan(fileID,'%{dd MMMM yyyy}D %f %f',...
    'DateLocale','de_DE','Delimiter',',');
fclose(fileID);

		%Read Nondefault Control Characters
lyric = sprintf('Blackbird\fsinging\fin\fthe\fdead\fof\fnight');
C = textscan(lyric,'%s','delimiter',sprintf('\f'));
		%Resume a Text Scan of a String
lyric = 'Blackbird singing in the dead of night';
[firstword,pos] = textscan(lyric,'%9c',1);	%pos=9(\s)
lastpart = textscan(lyric(pos+1:end),'%s');

%fscanf: output is an array
x = 1:1:5;
y = [x;rand(1,5)];
fileID = fopen('nums2.txt','w');
fprintf(fileID,'%d %4.4f\n',y);
fclose(fileID);
type('nums2.txt');

fileID = fopen('nums2.txt','r');
formatSpec = '%d %f';
sizeA = [2 Inf];
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);

%fileread:method:text = fileread(filename)
A = fileread('pqfile.txt');

%dlmwrite
M = magic(3)*pi;
dlmwrite('myFile.txt',M,'delimiter','\t','precision',3);
type('myFile.txt');

%fprintf:methos:fprintf(fileID,formatSpec,A1,...,An)
A1 = [9.9, 9900];
A2 = [8.8,  7.7 ; ...
      8800, 7700];
formatSpec = 'X is %4.2f meters or %8.3f mm\n';
fprintf(formatSpec,A1,A2);