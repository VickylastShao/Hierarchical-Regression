clc
clear
close all

samplenum=1000;

% x 均匀分布 y 正态分布
% x=rand(samplenum,1)*2*1-1;
% y=x+normrnd(0,0.3,samplenum,1);
% % x 正态分布 y 均匀分布
% x=normrnd(0,0.3,samplenum,1);
% y=x+rand(samplenum,1)*2*0.5-0.5;
% x 均匀分布 y 均匀分布
% x=rand(samplenum,1)*2*1-1;
% y=x+rand(samplenum,1)*2*0.5-0.5;
% % x 正态分布 y 正态分布
x=normrnd(0,0.3,samplenum,1);
y=x+normrnd(0,0.3,samplenum,1);



figure
hold on


axis([-1 1 -1 1]);


pr = polyfit(x,y,2);
xr = -1:0.001:1;
yr = polyval(pr,xr);
plot(xr,yr,'b');

x1s=x(polyval(pr,x)<y,1);
y1s=y(polyval(pr,x)<y,1);
x2s=x(polyval(pr,x)>y,1);
y2s=y(polyval(pr,x)>y,1);


pr1 = polyfit(x1s,y1s,2);
xr1 = -1:0.001:1;
yr1 = polyval(pr1,xr1);
plot(xr1,yr1,'r');

x11s=x1s(polyval(pr1,x1s)<y1s,1);
y11s=y1s(polyval(pr1,x1s)<y1s,1);
x12s=x1s(polyval(pr1,x1s)>y1s,1);
y12s=y1s(polyval(pr1,x1s)>y1s,1);


pr2 = polyfit(x2s,y2s,2);
xr2 = -1:0.001:1;
yr2 = polyval(pr2,xr2);
plot(xr2,yr2,'r');

x21s=x2s(polyval(pr2,x2s)<y2s,1);
y21s=y2s(polyval(pr2,x2s)<y2s,1);
x22s=x2s(polyval(pr2,x2s)>y2s,1);
y22s=y2s(polyval(pr2,x2s)>y2s,1);



plot(x11s,y11s,'b.');
plot(x12s,y12s,'r.');
plot(x21s,y21s,'g.');
plot(x22s,y22s,'k.');



