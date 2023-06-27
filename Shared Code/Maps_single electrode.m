out = readmatrix('out_CAM09_12.csv');
inp = readmatrix('inp_CAM09_12.csv');
M=108;
% Plot active electrode positions on LHS
subplot(1,2,1);
% Load electrode positions
load("lookup192.mat");
plotProbes(lookup, M);
title(string(M));

%To clean inp data
inp1 = filloutliers(inp,"nearest");

% Plot activation map on RHS
cmp = getPyPlot_cMap('RdBu_r');
subplot(1,2,2);
scatter(out(1:2500,1),out(1:2500,2),40,inp1(1:2500,M),'filled');
colormap(cmp);

