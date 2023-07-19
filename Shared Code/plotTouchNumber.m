load("TouchNumber.mat");

my_colors();
markers = ["o", "+", "*", "x", "square"];

for i = 1:5
    scatter([100 200 500 750 1000 1500 2000], 1000*allaverages(:, i), 30, colors(i,:), markers(i));
    hold on
end

for i = 1:5
    plot([100 200 500 750 1000 1500 2000], 1000*allaverages(:, i), "color", colors(i,:));
end

my_defaults([488   342   724   415])
xlabel("Training Points");
ylabel("Average Error (mm)");
line([500, 500], [0 30], "color", "k", "linewidth", 2, "linestyle", "--")
text(510, 28, "Selected Point", "FontSize", 15);
legend({"Parallel"; "No Pattern"; "Radial"; "Concentric"; "Full CB"},...
    "location", "ne");
legend boxoff