clear all

%Part 2.1------------------------------------------------------------------
x = randn(1,1000);
[corr_wgn,time_lag] = xcorr(x,999,'unbiased');

figure(1)
set(gcf,'Color','w')
plot(time_lag,corr_wgn)
title('Unbaiased estimate of the ACF for a 1000 sample realisation of WGN')
xlabel('Time lag')

figure(2)
set(gcf,'Color','w')
subplot(2, 1, 1)
set(gcf,'Color','w')
stem(time_lag,corr_wgn);
zoom xon
zoom(20)
axis ([-50 50 -inf 1.1])
title('Unbaiased estimate of the ACF for WGN range (-50, 50)')
xlabel('Time lag')

subplot(2, 1, 2)
set(gcf,'Color','w')
stem(time_lag,corr_wgn)
axis ([900 999 -inf 1.1])
title('Unbaiased estimate of the ACF for WGN range (900, 999)')
xlabel('Time lag')





