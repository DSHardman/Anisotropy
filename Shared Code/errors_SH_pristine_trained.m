%% To use a trained network to predict outputs using other inputs 
out = readmatrix('out_CAM09_18.csv');
inp = readmatrix('inp_CAM09_18.csv');

positions = out(:,1:2);
inp = normalize(inp);

%% Standardize outputs between 0 and 1


ypred = predict(net, inp);

pred = zeros(size(ypred));
pred(:,1) = ypred(:,1)/10;
pred(:,2) = ypred(:,2);
pred(:,3) = ypred(:,3)/10;

errors = pred - out;

amb = getPyPlot_cMap('Purples');
localization = rssq(errors(:,1:2).');
scatter(positions(:,1), positions(:,2), 40, localization, 'filled');
colormap(amb);
title('Localisation (m)');

errors = [rssq(errors(:,1:2).').' errors(:,3:end)];
errormeans = mean(abs(errors))
