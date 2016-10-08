clear all

%Part 3.2.1----------------------------------------------------------------
x = randn(1064,1);
y = filter((1),[1 0.9],x);
y = y(41:1064);

figure(1)
set(gcf,'Color','w')
[h,w]= freqz((1),[1 0.9],512);
subplot(1,2,1)
hold on
pgm(y);
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2);
axis([0 0.5 0 180]);
title('Periodogram of high-pass filtered WGN (red) and filter theoretical output (blue)')

subplot(1,2,2)
hold on
pgm(y);
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2);
axis([0.4 0.5 0 180]);
