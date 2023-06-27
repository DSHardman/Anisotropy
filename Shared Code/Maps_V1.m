out = readmatrix('out.csv');
inp = readmatrix('inp.csv');
M=131;
% Plot active electrode positions on LHS
subplot(1,2,1);
% Load electrode positions
load("lookup192.mat");
plotProbes(lookup, M);
title(string(M));

%To clean inp data
inp1 = filloutliers(inp,"nearest");

% Plot activation map on RHS
subplot(1,2,2);
scatter(out(:,1),out(:,2),40,inp1(:,M),'filled');