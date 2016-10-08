function [prediction_gain] = speech_predictor(input,adapt_gain)
N = 30;
mu = adapt_gain;

x_input = input;
L = length(x_input);
y_1 = zeros(1,L);
y_2 = zeros(1,L);
y_tot = zeros(1,L);
w_1 = zeros(1,1);
w_2 = zeros(1,1);
err = zeros(1,L);
dplot1 = [];
dplot2 = [];

for i = N:L
    x_1(i) = x_input(i-1);
    x_2(i) = x_input(i-2);
    y_1(i) = w_1'*x_1(i);
    y_2(i) = w_2'*x_2(i);
    y_tot(i) = y_1(i)+y_2(i);
    err(i) = x_input(i)-y_tot(i);
    w_1 = w_1+mu*conj(err(i))*x_1(i);     
    w_2 = w_2+mu*conj(err(i))*x_2(i);
end

prediction_gain = 10*log10(var(x_input)/var(err))

plot(y_tot, 'r')
jleg1 = legend('Original exract of audio','Estimated output using predictor');


