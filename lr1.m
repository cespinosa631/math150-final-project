% A function defined for least square regression
function [model] = lr1(interest,unemploy,inflation, rreturn)

% Combine predictor variables into a matrix
X = [interest, unemploy, inflation];

% Fit a linear model with all predictor variables and rreturn as response
model = fitlm(X,rreturn);

% Extract the coefficients of the line of best fit
coeffs = model.Coefficients.Estimate;

% Plot data points and line of best fit
scatter(interest, rreturn, 'o', 'DisplayName', 'Interest Rate')
hold on
scatter(unemploy, rreturn, 'o', 'DisplayName', 'Unemployment Rate')
hold on
scatter(inflation, rreturn, 'o', 'DisplayName', 'Inflation Rate')
hold on
plot(X,coeffs(4)*X+coeffs(3)*X+coeffs(2)*X+coeffs(1),'r','LineWidth',2)
xlabel('Interest Rate, Unemployment Rate, Inflation Rate')
ylabel('Rate of Return')
legend()

% Display the model coefficients and R-squared value
disp(model.Coefficients)
disp(model.Rsquared)
end
