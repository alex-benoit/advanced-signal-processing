clear all

%Part 2.2------------------------------------------------------------------
x = randn(1,1000);
y = filter(ones(9,1),(1),x); %Moving Average Filter
[corr_wgn,time_lag] = xcorr(y,20,'unbiased');

figure(1)
set(gcf,'Color','w')
stem(time_lag,corr_wgn)
xlabel('Time lag')
title('Unbiased estimate of ACF for MA filtered WGN')

