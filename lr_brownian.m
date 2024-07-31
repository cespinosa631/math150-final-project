% importing our data
data = readtable('150projectDATA.xlsx');

r_return = data{:,2};
ann_yield = data{:,3};
unemp = data{:,4};
infl_rate = data{:,5};

% visualizing our data
subplot(1,3,1);
plot(data{:,3})
title('Annnual Yield')

subplot(1,3,2);
plot(data{:,4})
title('Unemployment')

subplot(1,3,3);
plot(data{:,5})
title('Inflation Rate')


% fitting a least squares to each of our parameters
model = fitlm(1:53, infl_rate);

% plotting our lrm with our data
figure(3)
plot(model)

% Adding brownian motion to our model


%% Testing
lr1(ann_yield, unemp, infl_rate, r_return)