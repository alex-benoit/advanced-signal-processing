clear all

%Part 3.2.5----------------------------------------------------------------
load sunspot.dat
y = filter((1),[1 0.9],sunspot);

figure(1)
set(gcf,'Color','w')
[h,w]= freqz((-1.37829),[1 0.678292],512); %AR(2) coeffs
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
