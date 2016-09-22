%%  plot line_road from link_struct_array and output line_longlat
function line_longlat = plot_line_road(shuffled_link,matname)
    line_longlat = shuffled_link(1).longlat;
    for nth_link = 2:length(shuffled_link)
        line_longlat = [line_longlat;shuffled_link(nth_link).longlat(2:end,:)]; %delete repeted start_node
    end
    figure('Name',matname);
    plot(line_longlat(:,1),line_longlat(:,2));  %return a line object
    axis equal;
    title(matname,'Interpreter', 'none');
end