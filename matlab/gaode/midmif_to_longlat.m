%% mif to link longlat

function midmif_to_longlat(folder,mid_cnum)

	file = dir([folder,'*.mif']);
	%struct vector:num=num of mif files,f1=name(char_array),f2=date(char_array)
	%f3=bytes(num),f4=isdir(bool),f5=datenum(date)
	num_file = length(file);	%sigle=num of mif files
	for nth_file = 1:num_file	
		filename = file(nth_file).name(1:end-4);	%char_array=filename without ext
		disp(['midmif_to_longlat:',num2str(nth_file),':',filename]);
		
		%down:deal with mif file
		fid_mif = fopen([folder,filename,'.MIF']);
		%single = id of opening filename.mif in folder

		%initiation
		num_link = 0;	%single = num of link
		tline = fgetl(fid_mif);
		%char_array:one line in mid file without \r\n

		while ischar(tline)
			Line_index = strfind(tline,'Line');
			Pline_index = strfind(tline,'Pline');

			if ~isempty(Line_index)		%if tline contains 'Line'
				num_link = num_link+1;
				tline_split = strsplit(tline,' ');
				%cell_vector: num=5,content=longlatstr or 'Line'
				%cell_vector(i):i=1:'Line';i=2:'node1 long';i=3:'node1 lat'
				%i=4:'node2 long';i=5:'node2 lat'
				link(num_link).longlat = [str2double(tline_split{2}),str2double(tline_split{3})
										str2double(tline_split{4}),str2double(tline_split{5})];
				tline = fgetl(fid_mif);
				continue;					
			end

			if ~isempty(Pline_index)	%if tline contanis 'Pline'
				num_link = num_link+1;

				%initiation
				link(num_link).longlat = [];
				tline = fgetl(fid_mif);
				Pen_index = strfind(tline,'Pen');

				while (isempty(Pen_index))
					tline_split = strsplit(tline,' ');
					%cell_vector: num=2,content=longlatstr
					%cell_vector(i):i=1:'node long';i=2:'node lat'
					link(num_link).longlat = [link(num_link).longlat
											str2double(tline_split{1}),str2double(tline_split{2})];				
					%iteration
					tline = fgetl(fid_mif);
					Pen_index = strfind(tline,'Pen');
				end
				continue;
			end
			tline = fgetl(fid_mif);
		end

		%down:deal with mid file
		fid_mid = fopen([folder,filename,'.MID']);
		%single = id of opening filename.mid in folder

		%initiation
		num_link = 0;	%single = num of link
		tline = fgetl(fid_mid);
		%char_array:one line in mid file without \r\n
		
		while ischar(tline)
			num_link = num_link+1;
			tline_split = strsplit(tline,',');
			%tline_split:cell vector,content=char_array fields of 1 mesh_roadid
			%tline_split{i}:ref mid files
			link(num_link).mesh = str2double(tline_split{mid_cnum(1)}(end-5:end-1));
			link(num_link).road_id = str2double(tline_split{mid_cnum(2)});
			link(num_link).node_start = str2double(tline_split{mid_cnum(3)});
			link(num_link).node_end = str2double(tline_split{mid_cnum(4)});
			link(num_link).road_length = str2double(tline_split{mid_cnum(5)});
			%iteration
			tline = fgetl(fid_mid);
		end
		save([folder,filename,'.mat'],'link');
        clear link; %del to avoid overlap to other link mat files
	end
end
