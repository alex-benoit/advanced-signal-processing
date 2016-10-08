clear all

%Part 2.3.1----------------------------------------------------------------
x = randn(1,1000);
y = filter(ones(9,1),(1),x);
[corr_wgn,time_lag] = xcorr(x,y,20,'unbiased');

figure(1)
set(gcf,'Color','w')
subplot(1,2,1)
stem(time_lag,corr_wgn)
title('CCF of WGN x and filter output y (9th order)')
xlabel('Time lag')
axis ([-20 20 -0.2 1.2])

%Part 2.3.2----------------------------------------------------------------
x = randn(1,1000);
y = filter(ones(15,1),(1),x);   
[corr_wgn,time_lag] = xcorr(x,y,20,'unbiased');

subplot(1,2,2)
stem(time_lag,corr_wgn)
title('CCF of WGN x and filter output y (15th order)')
xlabel('Time lag')
axis ([-20 20 -0.2 1.2])