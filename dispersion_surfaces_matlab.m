clear all
close all
clc

cd '~/git/2D_bloch_wave_propagation_metamaterial/'
data = readtable('./export/modes.csv');
data = table2array(data);

[nr, nc] = size(data);

for i = 3:nc

figure(i-2)
tri=delaunay(data(:,1),data(:,2));
trisurf(tri,data(:,1),data(:,2),data(:,i))
title('Shape mode:', num2str(i-2))
xlabel('kx*l/\pi [-]')
ylabel('ky*l/\pi [-]')
zlabel('\Omega = \omega*l/c [-]')
grid on

fig = sprintf('shape_mode_%d.jpg', i-2);
cd '~/git/2D_bloch_wave_propagation_metamaterial/export/img/matlab/';
saveas(figure(i-2), fig)

end
cd '~/git/2D_bloch_wave_propagation_metamaterial/'
