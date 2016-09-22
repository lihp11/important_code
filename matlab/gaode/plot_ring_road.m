%%  plot ring_road from link_struct_array and output ring_longlat
function ring_longlat = plot_ring_road(shuffled_link,matname)
    ring_longlat = shuffled_link(1).longlat;
    for nth_link = 2:length(shuffled_link)
        ring_longlat = [ring_longlat;shuffled_link(nth_link).longlat(2:end,:)]; %delete repeted start_node
    end
    ring_longlat = [ring_longlat;ring_longlat(1,:)];    
    %array:c1=long,c2=lat,r_num=num of points+1
    figure('Name',matname);
    plot(ring_longlat(:,1),ring_longlat(:,2));  %return a ring object
    axis equal;
    title(matname,'Interpreter', 'none');
end