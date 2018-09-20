% d1=importdata('负荷.csv');
% d2=importdata('锅炉正平衡效率.csv');
% d3=importdata('氧量.csv');
% 
% d1=d1.data;
% d2=d2.data;
% d3=d3.data;
% 
% 
% B=table(d1,d2,d3);
% writetable(B,'data.csv')

% index=[];
% for i=1:(length(d1(:,1))-1)
%     if d1(i,1)==d1(i+1,1)
%     index=[index;i+1];
%     end
% end
% d1(index,:)=[];
% B=table(d1);
% writetable(B,'data.csv')

clc
clear
close all

d1=importdata('data.csv');
d1=d1.data;
deleteindex=unidrnd(length(d1(:,1)),[50000,1]);
d1(deleteindex,:)=[];
d1(d1(:,1)<510,:)=[];
figure
scatter(d1(:,1),d1(:,2),'b.')
axis([500 1000 93.5 96]);


x=d1(:,1);
y=d1(:,2);
z=d1(:,3);

figure
hold on
axis([500 1000 93.5 96]);


degree=3;

pr = polyfit(x,y,degree);
xr = 500:0.001:1000;
yr = polyval(pr,xr);
plot(xr,yr,'b');

x1s=x(polyval(pr,x)<y,1);
y1s=y(polyval(pr,x)<y,1);
x2s=x(polyval(pr,x)>y,1);
y2s=y(polyval(pr,x)>y,1);

z1s=z(polyval(pr,x)<y,1);
z2s=z(polyval(pr,x)>y,1);


pr1 = polyfit(x1s,y1s,degree);
xr1 = 500:0.001:1000;
yr1 = polyval(pr1,xr1);
plot(xr1,yr1,'r');

x11s=x1s(polyval(pr1,x1s)<y1s,1);
y11s=y1s(polyval(pr1,x1s)<y1s,1);
x12s=x1s(polyval(pr1,x1s)>y1s,1);
y12s=y1s(polyval(pr1,x1s)>y1s,1);

z11s=z1s(polyval(pr1,x1s)<y1s,1);
z12s=z1s(polyval(pr1,x1s)>y1s,1);


pr2 = polyfit(x2s,y2s,degree);
xr2 = 500:0.001:1000;
yr2 = polyval(pr2,xr2);
plot(xr2,yr2,'r');

x21s=x2s(polyval(pr2,x2s)<y2s,1);
y21s=y2s(polyval(pr2,x2s)<y2s,1);
x22s=x2s(polyval(pr2,x2s)>y2s,1);
y22s=y2s(polyval(pr2,x2s)>y2s,1);

z21s=z2s(polyval(pr2,x2s)<y2s,1);
z22s=z2s(polyval(pr1,x1s)>y1s,1);

plot(x11s,y11s,'b.');
plot(x12s,y12s,'r.');
plot(x21s,y21s,'g.');
plot(x22s,y22s,'k.');




figure
hold on
axis([500 1000 0 4]);
plot(x11s,z11s,'b.');
prxz = polyfit(x11s,z11s,degree);
xrz = 500:0.001:1000;
zrz = polyval(prxz,xrz);
plot(xrz,zrz,'r');



