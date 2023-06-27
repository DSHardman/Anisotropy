%%Script to plot error vs distance to the center. 

%% calculation of the errors
LocalizationErrors = errors(:,1);

%%Transforming out to distance to the center
%% C are the coordinates of the center. It might change from  sample to sample

C = [0.03347 -0.297];
D = zeros(size(LocalizationErrors,1),1);
for i = 1:size(LocalizationErrors,1)
    D(i,1)=sqrt((target(i,1)-C(1,1))^2+(target(i,2)-C(1,2))^2);
end

%Sorting the data 

a=strings(size(LocalizationErrors,1),1);
for i = 1:size(LocalizationErrors,1)
    if (D(i,1) < 0.01)
        a(i,1) = 'Area1';
    elseif (D(i,1) > 0.01) && (D(i,1) < 0.02)
        a(i,1) = 'Area2';
    elseif (D(i,1) > 0.02) && (D(i,1) < 0.03)
        a(i,1) = 'Area3';
    else 
        a(i,1) = 'Area4';    
    end
end

boxplot(LocalizationErrors,a)




