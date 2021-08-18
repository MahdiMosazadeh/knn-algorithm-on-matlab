clear;
clc;
tic
load('brCan_data-1.mat');
brCan_data=brCan_data';
brCan_data(1,:)=[];
class=brCan_data(10,:);
brCan_data(10,:)=[];
[class index]=sort(class);
brCan_data=brCan_data(:,[index]);
clear index;
for j=1:458
    for i=1:9
        if brCan_data(i,j)==0
            brCan_data(i,j)=mean(brCan_data(i,1:458));
        end
    end
end
for j=459:699
    for i=1:9
        if brCan_data(i,j)==0
            brCan_data(i,j)=mean(brCan_data(i,459:699));
        end
    end
end
class(class==2)=1;
class(class==4)=2;
data(1,:)=class;
data(2:10,:)=brCan_data;
xtrain=data(:,[1:120 459:578]);
xtest=data(:,[121:458 579:699]);

