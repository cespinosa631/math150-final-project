%% Math 150 Final Project Code Group 4
clc; clear all
data = readtable('150projectDATA.xlsx');

%% Taking average of each parameters columnwise
% Define the ODE system
a = mean(data{:,3});
b = mean(data{:,4});
c = mean(data{:,5});
%dydt = @(t,y) [a*y(1)+ y(2)+y(3);y(1)+ b*y(2)+y(3)];
dydt = @(x,y) [a*x^2; b*x; c*1] .* y;
%@(T,Y)[AY(1)+BY(2)+CY(3); DY(1)+EY(2)+FY(3); GY(1)+HY(2)+I*Y(3)]

% Define the initial conditions
% try to start with average
% 
y0 = [0,0,0];

% Define the time interval over which to solve the ODE system
%tspan = [1970, 2022];
%tspan = [0, 52];
tspan = [data.Year(1) data.Year(end)];

% Solve the ODE system using ode45
[t, y] = ode45(dydt, tspan,y0);
% Plot the results
%plot(t, y(:,1), 'r-', t, y(:,2), 'b-', t, y(:,3), 'g-');
%legend('Yield', 'Unemployment', 'Inflation');
%xlabel('Time');
%ylabel('Value');
x = data.Year;
y_fit = a*x.^2 + b*x + c;
y_data = data.Return;
plot(x, y_fit, 'b-', x, y_data, 'ro');
legend('Fitted curve', 'Data');%% Using linear regression
%% Using linear regression 

fig(1) = figure
plot(data{:,3})
title('Annnual Yield')

fig(2) = figure
plot(data{:,4})
title('Unemployment')

fig(3) = figure
plot(data{:,5})
title('Inflation Rate')

%% fitting a linear regression model to our data
year = data{:,1};
ann_yield = data{:,3};
unemp = data{:,4};
infl_rate = data{:,5};
r_return = data{:,2};

b1 = zeros(1,3);
b1(1) = year\ann_yield;
b1(2) = year\unemp;
b1(3) = year\infl_rate;
b1

f = @(x) b(1)*x;

hold on
%plot(f)
plot(data{:,4})
hold off



%% Testing LR
% load accidents
% x = hwydata(:,14); %Population of states
% y = hwydata(:,4); %Accidents per state
% format long
% b1 = x\y
% p = @()

% plot(ann_yield, data{:,2})

lr1(ann_yield, unemp, infl_rate, r_return)


%% Brownian Motion
%BPATH1 Brownian path simulation
init = 1970;
ending = 2022;

randn('state',100) % set the state of randn
T = 2022; N = 500; dt =T/N;
dW = zeros(1,N); % preallocate arrays ...
W = zeros(1,N); % for efficiency

dW(1) = sqrt(dt)*randn; % first approximation outside the loop ...
W(1) = dW(1); % since W(0) = 0 is not allowed

for j = 2:N
    dW(j) = sqrt(dt)*randn; % general increment
    W(j) = W(j-1) + dW(j);
end
plot([0:dt:T],[0,W],'r-') % plot W against t
xlabel('t','FontSize',16)
ylabel('W(t)','FontSize',16,'Rotation',0)

