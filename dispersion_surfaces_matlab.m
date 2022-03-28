clear all
close all
clc

data = readtable('./export/data.csv');
data = table2array(data);

plot3(data(:,1), data(:,2), data(:,3))
xlabel('kx*l1 [-]');
ylabel('ky*l2 [-]');
zlabel('Frequency [MHz]');