% for i = 1:42
% scatter(positions(:, 1), positions(:, 2), 10, 'k', 'filled');
% hold on
% scatter(testpositions(i, 1), testpositions(i, 2), 40, 'r', 'filled');
% scatter(xpreds(i), ypreds(i), 40, 'g', 'filled');
% axis square
% title(string(i))
% pause()
% clf
% end

for i = 1:42
    sums = zeros(350, 1);
    for j = 1:350
        for k = 1:192
            sums(j) = sums(j) + abs(testinputs(i, k)*inputs(j, k));
        end
    end
    scatter(xoutputs, youtputs, 30, sums, 'filled');
    hold on
    scatter(testpositions(i, 1), testpositions(i, 2), 40, 'r', 'filled');
    axis square
    pause()
    clf
end