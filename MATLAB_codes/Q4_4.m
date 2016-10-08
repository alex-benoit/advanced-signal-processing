clear all
close all

%Part 4.4------------------------------------------------------------------
x = randn(1000,1);
order = 2;
N = 3;
mu = 0.01;

b = (1);
a = [1 0.9 0.2];
x_input = filter(b,a,x);
L = length(x);
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
    dplot1 = horzcat(dplot1,w_1);
    dplot2 = horzcat(dplot2,w_2);
end

figure(1)
set(gcf,'Color','w')
hold on
plot(dplot1,'r')
plot(dplot2)
title('Time evolution of a1 and a2 for mu=0.1')
xlabel('Sample number')
legend('a1','a2');
grid on