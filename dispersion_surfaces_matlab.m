clear all
close all
clc

data = readtable('./data.csv');
data = table2array(data);

plot3(data(:,1), data(:,2), data(:,3))
xlabel('kx*l1 [-]');
ylabel('ky*l2 [-]');
zlabel('omega [rad/s]');