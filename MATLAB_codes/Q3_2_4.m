clear all

%Part 3.2.4----------------------------------------------------------------

figure(1)
set(gcf,'Color','w')
title('Estimating the PSD using theory (blue), model-based (black), or periodogram based (red)')
axis([0.4 0.5 0 150])
hold on
xlabel('Normalised frequency')
ylabel('Estimated PSD')


[h,w]= freqz((1.0151),[1 0.9105],512);
plot(w/(2*pi),abs(h).^2, 'k', 'LineWidth', 2)

[h,w]= freqz((1),[1 0.9],512);
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2)

x = randn(1064,1);
y = filter((1),[1 0.9],x);
y = y(41:1064);
pgm(y);