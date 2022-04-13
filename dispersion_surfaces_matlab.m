clear all
close all
clc

cd '~/git/2D_bloch_wave_propagation_metamaterial/'
data = readtable('./export/modes.csv');
data = table2array(data);

[nr, nc] = size(data);

%% Plot dispersion surfaces

for i = 3:nc

figure(i-2)
tri=delaunay(data(:,1),data(:,2));
trisurf(tri,data(:,1),data(:,2),data(:,i))
title('Shape mode:', num2str(i-2))
xlabel('kx \cdot l/\pi [-]')
ylabel('ky \cdot l/\pi [-]')
zlabel('\Omega = \omega \cdot l/c [-]')
grid on

% Save figures
fig = sprintf('shape_mode_%d.jpg', i-2);
cd '~/git/2D_bloch_wave_propagation_metamaterial/export/img/matlab/3d/';
saveas(figure(i-2), fig)

end
cd '~/git/2D_bloch_wave_propagation_metamaterial/'

%% Contour plot

for j = 3:nc

[Ux,Ix] = unique(data(:,1));                               % Determine Frame Lengths
dIx = diff(Ix);                                            % Define Frame Length
Xr = reshape(data(:,1), dIx(1), []);                       % Create Matrix From Vector
Yr = reshape(data(:,2), dIx(1), []);                       % Create Matrix From Vector
Zr = reshape(data(:,j), dIx(1), []); 

figure(nc-2+j-2)
contourf(Xr, Yr, Zr)
xlabel('kx \cdot l/\pi [-]')
ylabel('ky \cdot l/\pi [-]')
title('\Omega = \omega\cdot l/c - Shape mode:', num2str(j-2))
colorbar
grid on

% Save figures
fig2 = sprintf('contour_plot_shape_mode_%d.jpg', j-2);
cd '~/git/2D_bloch_wave_propagation_metamaterial/export/img/matlab/contour/';
saveas(figure(nc-2+j-2), fig2)

end
cd '~/git/2D_bloch_wave_propagation_metamaterial/'