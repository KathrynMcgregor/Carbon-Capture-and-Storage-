%Species Data
clc;
clear;
close all;


species_order = ["BE","CP","DF","EL","GF","HL","JL","LEC","LP","NF","OK","RC","SAB","SP","SS","WH"];

%Young
class_25 = ["YC 10 S 1.2","YC 20 S 1.4","YC 24 S 1.7", "YC 12 S 1.7","YC 30 S 1.8","YC 14 S 1.7"...
    "YC 14 S 1.7","YC 24 S 1.5","YC 14 S 1.5","YC 22 S 1.5","YC 8,8,8 S 1.2,2.5,3","YC 24 S 1.5"...
    "YC 12,12,12, S 1.5,2.5,3","YC 14 Spacing 1.4","YC 24 S 1.7","YC 24 S 1.5"];
carbon_25 = [408.8300,480.1400,655.5700,401.3700,580.5300,437.5400,456.0100,575.4300,416.3500,450.2100,448.1900,...
    520.1400, 611.6600,391.7000,548.7500,593.8600];

%Old
class_100 = ["Yield Class 10,10,10 Spacing 1.2,2.5,3","Yield class 20 Spacing 1.4",...
    "Yield class24 Spacing1.7","Yield class12 Spacing1.7","Yield class30 Spacing1.8","Yield class14 Spacing1.7"...
    "Yield class14 Spacing1.7","Yield class24 Spacing1.5","Yield class14 Spacing1.5","Yield class22 Spacing1.5"...
    "Yield Class 8,8,8 Spacing 1.2,2.5,3","Yield class24 Spacing1.5","Yield Class 12,12,12, Spacing 1.5,2.5,3"...
     "Yield class14 Spacing2","Yield class24 Spacing2",  "Yield class24 Spacing1.5"];
carbon_100 = [1.3713e+03,1.2651e+03,1.7367e+03,894.9300,1.5958e+03,934.1800,985.4000,1.8169e+03,1.1998e+03,1.5424e+03...
  1.1156e+03,1.6085e+03,1.2628e+03,1.1862e+03,1.5638e+03, 1.6656e+03];

figure(1)
scatter([1:16],carbon_25,'k','+','LineWidth',1)
hold on
set(gca,'xtick',[1:16],'xticklabel',species_order)
xtickangle(45)
xlabel('Species');
ylabel('Cumulative Carbon Sequestration After 25 Years of Growth (tCO2/ha)');

%Highlighting which species are broadleaved 
scatter(1,carbon_25(1),'g','+','LineWidth',1)
scatter(11,carbon_25(11),'g','+','LineWidth',1)
scatter(13,carbon_25(13),'g','+','LineWidth',1)

legend('Conifer','Broadleaved');

hold off

figure(2)
scatter([1:16],carbon_100,'k','+','LineWidth',1)
hold on

set(gca,'xtick',[1:16],'xticklabel',species_order)
xtickangle(45)
xlabel('Species');
ylabel('Cumulative Carbon Sequestration After 100 Years of Growth (tCO2/ha)');

%Highlighting which species are broadleaved 
scatter(1,carbon_100(1),'g','+','LineWidth',1)
scatter(11,carbon_100(11),'g','+','LineWidth',1)
scatter(13,carbon_100(13),'g','+','LineWidth',1)

legend('Conifer','Broadleaved');

hold off

%Ranking the species 
[~,p] = sort((carbon_100),'descend');
r = 1:length(carbon_100);
r(p) = r'



  
