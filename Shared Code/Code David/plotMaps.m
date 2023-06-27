% Plot single activation map

n = 2500; % How many points should be used in constructing sensitivity maps?
M = 80; % Which of the 192 maps should be plotted? 
magnitudes = inp;
positions = out(:,1:2) - [mean(out(:,1)) mean(out(:,2))];

radius = 0;
for i = 1:size(magnitudes, 1)
    [theta, rho] = cart2pol(positions(i,1), positions(i,2));
    radius = max(radius, rho);
end

for i = 1:size(magnitudes, 1)
    [theta, rho] = cart2pol(positions(i,1), positions(i,2));
    % Weight based on radial position, for better visualization
    magnitudes(i,:) = abs(magnitudes(i,:)*(1.1 - (rho*1000)/radius*1000));
    magnitudes(i,:) = normalize(magnitudes(i,:));
    % Minimize effect of outliers
    magnitudes(i,:) = tanh(magnitudes(i,:));
end

% Plot active electrode positions on LHS
subplot(1,2,1);
% Load electrode positions
load("lookup192.mat");
plotProbes(lookup, M);
title(string(M));

% Plot activation map on RHS
subplot(1,2,2);
interpolant = scatteredInterpolant(positions(1:n,1),...
    positions(1:n,2),magnitudes(:,M));
[xx,yy] = meshgrid(linspace(-radius,radius,1000));
mag_interp = interpolant(xx,yy);
% Remove points from outside circle
for k = 1:size(xx,1)
    for j = 1:size(xx,2)
        if xx(k,j)^2 + yy(k,j)^2 > radius^2
            mag_interp(k,j) = nan;
        end
    end
end
contourf(xx,yy,mag_interp, 20, 'LineStyle', 'none');
xlim([-radius-0.01 radius+0.01]);
ylim([-radius-0.01 radius+0.01]);
axis square
colorbar
set(gca, 'visible', 'off');
caxis([-0.5 0.5])
