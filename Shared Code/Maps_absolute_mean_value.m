%% Plot the distribution of the absolute value of the average response in each plot. 
out = readmatrix('out_CB_rep.csv');
inp = readmatrix('inp_CB_rep.csv');

%To clean inp data
inp = filloutliers(inp,"nearest");

A = abs(inp);
meanA = mean(A,2);
scatter(out(1:2500,1), out(1:2500,2),40,meanA,'filled');
cmp = getPyPlot_cMap('RdPu');
colormap(cmp);



