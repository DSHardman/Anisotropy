%%Error in the localization (mm). Using the results of the trained network

amb = getPyPlot_cMap('Purples');
localization = errors(:,1)*1000;
scatter(target(:,1),target(:,2),40, localization, 'filled');
colormap(amb);
title('Localisation (m)');