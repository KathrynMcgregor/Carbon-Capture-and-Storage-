%Carbon sequestration per hectare for different species and tree spacing
%Ranks best to worst species for carbon sequestration 
%Ranks best to worst spacings for carbon sequestration


clear;
clc;
close all;

%Read in file on the species BE
T = xlsread('BE.xls');

%How many years is the tree alive for (needs to be a multiple of 5)?
y = 100;

%Cumulative Carbon Sequestration master list
cum_c = T(:,11);

%Annual carbon sequestration master list
ann_c = [cum_c(1)]; %1.8
for i = 2:size(T,1)
    ann_c = [ann_c,cum_c(i)-cum_c(i-1)];
end 

%Build a list of the ages (0 to 200 in steps of 5)
ages = [];

for x = 5:5:200
    [ages] = [ages,x];
end 

%Build a list of the yield class values which are present in the file,
%preserving their order and if there are any repeats
yield_class = []; 
for i = 1:40:size(T,1)
    [yield_class] = [yield_class,T(i,2)];
end 

%Build a list of the spacings which are present in the file, preserving
%their order and if there are any repeats
spacings = []; 
for x = 1:40:size(T,1)
    [spacings] = [spacings,T(x,1)];
end

%Creating a list of the legend headings, the order the sets of data appears will be
%the same as the order the sets of data are plotted and named
legend_entry = "";

for i = 1:length(yield_class)
    yc = num2str(yield_class(i));
    sp = num2str(spacings(i));
    %The data sets are labelled by their yield class and spacing values 
    new_entry = strcat('Yield class ',num2str(yc),' Spacing ',num2str(sp));
    [legend_entry] = [legend_entry,new_entry];
end 


%Plotting cumulative sequestration over the life of a tree for all growing
%conditions
figure(1)
this_cum_c = [];
total_c = [];

 for i = 1:40:size(T,1)
     
     for j = i:i+39 
        [this_cum_c] = [this_cum_c,cum_c(j)];
     end
     
     hold on;
     
     %Builds a list of the total carbon sequestered after y years for each data set so it can
     %be ordered later 
     [total_c] = [total_c,this_cum_c(y/5)]; 
     
     plot(ages(1:(y/5)),this_cum_c(1:(y/5)))
     xlabel('Age (Years)');
     ylabel('Cumulative Carbon Sequestration (tCO2e/ha)');
     
     %The first element of the lengend_entry list is empty, so starts at 2
     %and ends at 13
     legend(legend_entry(2:(length(yield_class)+1)),'Location','northeastoutside')
     hold off 
     this_cum_c = [];
     
 end
 
 

 %After 100 years, which has sequestered the most? 
 n = find(total_c == max(total_c));
 %Maximum carbon sequestered
 max = max(total_c)
 %Yield class and spacing for the maximum
 name = legend_entry(n+1)
 
%Plotting best annual carbon sequestration
%This will start at the 40*n th data point


    
    
    
    
    
