clear all
close all

%Part 2.4.1----------------------------------------------------------------
figure(1)
set(gcf,'Color','w')

a1_low = -2.5;
a1_high = 2.5;
a2_low = -1.5;
a2_high = 1.5;
x = randn(1000,1);
a1 = a1_low + (a1_high - a1_low).*rand(1000,1);
a2 = a2_low + (a2_high - a2_low).*rand(1000,1);

for i= 1:1000
     if (a2(i) + a1(i) < 1) && (a2(i) - a1(i) < 1) && abs(a2(i)) < 1
     hold on
     plot(a1(i),a2(i),'*b');
     end
     if (a2(i) + a1(i) > 1) || (a2(i) - a1(i) > 1) || abs(a2(i)) > 1
     hold on
     plot(a1(i),a2(i),'*r');
     end
end

title('AR(2) stability plot for 1000 paris of random variables a1 and a2')
xlabel('Coefficient a1')
ylabel('Cofficient a2')
axis([-2.5 2.5 -1.5 1.5])

%Part 2.4.2----------------------------------------------------------------
load sunspot.dat
figure(2)
set(gcf,'Color','w')

subplot(3,1,1)
N = 5;
[corr_sunspot,time_lag] = xcorr(sunspot(1:N,2),N,'unbiased');
stem(time_lag,corr_sunspot,'r')
zero_mean = (sunspot(:,2)) - mean(sunspot(:,2));
[corr_sunspot_zm,time_mean_zm] = xcorr(zero_mean(1:N,1),N,'unbiased');
hold on
stem(time_mean_zm,corr_sunspot_zm,'b')
hold off
title('ACF for sunspot times series for a sample lenght of N=5')
xlabel('Time lag')
axis ([-5 5 0 1500])

subplot(3,1,2)
N = 20;
[corr_sunspot,time_lag] = xcorr(sunspot(1:N,2),N,'unbiased');
stem(time_lag,corr_sunspot,'r')
zero_mean = (sunspot(:,2))- mean(sunspot(:,2));
[corr_sunspot_zm,time_mean_zm] = xcorr(zero_mean(1:N,1),N,'unbiased');
hold on
stem(time_mean_zm,corr_sunspot_zm,'b')
hold off
title('ACF for sunspot times series for a sample lenght of N=20')
xlabel('Time lag')
axis ([-20 20 -500 1500])

subplot(3,1,3)
N = 250;
[corr_sunspot,time_lag] = xcorr(sunspot(1:N,2),N,'unbiased');
stem(time_lag,corr_sunspot,'r')
zero_mean = (sunspot(:,2))- mean(sunspot(:,2));
[corr_sunspot_zm,time_mean_zm] = xcorr(zero_mean(1:N,1),N,'unbiased');
hold on
stem(time_mean_zm,corr_sunspot_zm,'b')
hold off
title('ACF for sunspot times series for a sample lenght of N=250')
xlabel('Time lag')
axis ([-250 250 -5000 5000])

%Part 2.4.3----------------------------------------------------------------
ar_coeffs = [];
for order = 1:10
    ar_coeffs = aryule(sunspot(:,2),order);
    display(ar_coeffs)
end

sunspot_zm = zero_mean/std(sunspot(:,2));
for order = 1:10
    [ar_coeffs_zm, NoiseVariance, reflection_coeffs] = aryule(sunspot_zm,order);
    display(ar_coeffs_zm)
end

figure(3)
set(gcf,'Color','w')
stem(reflection_coeffs)
title('Reflection coefficients for different models orders for the sunspot series')
xlabel('Model Order')
ylabel('Reflection coefficient')
axis([0 11 -1 1])

%Part 2.4.4----------------------------------------------------------------
N = length(sunspot_zm);
for order=1:15
    [ar_coeffs,loss_fuction] = aryule(sunspot_zm,order);
    MDL(order) = log10(loss_fuction) + (order/N)*log10(N);
    AIC(order) = log10(loss_fuction) + (2*order)/N;
end

figure (4)
set(gcf,'Color','w')
title('MDL and  AIC for the standardised sunspot series')
xlabel('Model Order')
hold on
plot(MDL)
plot(AIC, 'r')

