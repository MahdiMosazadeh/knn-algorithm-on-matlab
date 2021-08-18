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

p=0;
for i=1:459
test=xtest(2:10,i);
for j=1:240
train=xtrain(2:10,j);
s=0;
  for k=1:9
    s=s+((test(k)-train(k))^2);
  end
d(j)=sqrt(s);
c(j)=xtrain(1,j);
end

[d index]=sort(d);
c=c([index]);
for t=13:1:25
f=c(1:t);
n1=numel(f(f==1));
n2=numel(f(f==2));
if n1>=5
break;
end
if n2>=5
break;
end
end
if n1>n2
   yc=1;
else
   yc=2;
end
if yc==xtest(1,i)
p=p+1;
end
end
CCR=(p/459)*100
toc












