clear all

%Part 3.1.1----------------------------------------------------------------
figure(1)
set(gcf,'Color','w')
x_128 = randn(128,1);
subplot(1,3,1)
psd_128 = pgm(x_128);
title('Filtered PSD estim 128-sample WGN')

set(gcf,'Color','w')
x_256 = randn(256,1);
subplot(1,3,2)
psd_256 = pgm(x_256);
title('Filtered PSD estim 256-sample WGN')

set(gcf,'Color','w')
x_512 = randn(512,1);
subplot(1,3,3)
psd_512 = pgm(x_512);
title('Filtered PSD estim 512-sample WGN')

%Part 3.1.2----------------------------------------------------------------
x = randn(1024,1);
seg1  = x(1:128);
seg2  = x(129:256);
seg3  = x(257:384);
seg4  = x(385:512);
seg5  = x(513:640);
seg6  = x(641:768);
seg7  = x(769:896);
seg8  = x(897:1024);

figure(2)
subplot(2,4,1)
psd_all(1,:) = pgm(seg1);
subplot(2,4,2)
psd_all(2,:) = pgm(seg2);
subplot(2,4,3)
psd_all(3,:) = pgm(seg3);
subplot(2,4,4)
psd_all(4,:) = pgm(seg4);
subplot(2,4,5)
psd_all(5,:) = pgm(seg5);
subplot(2,4,6)
psd_all(6,:) = pgm(seg6);
subplot(2,4,7)
psd_all(7,:) = pgm(seg7);
subplot(2,4,8)
psd_all(8,:) = pgm(seg8);

%Part 3.1.3----------------------------------------------------------------
for i=1:128
    psd_avg(i) = mean(psd_all(:,i));
end

figure(3)
set(gcf,'Color','w')

subplot(3,1,1)
plot(psd_128, 'r')
title('Original periodogram for 128-sample of WGN')
xlabel('Normalised frequency')

subplot(3,1,2)
plot(psd_avg, 'm')
title('Average periodogram for eight 128-sample segments of WGN')
xlabel('Normalised frequency')

psd_avg_filt = filter(0.2*[1 1 1 1 1 ],1, psd_avg);
subplot(3,1,3)
plot(psd_avg_filt, 'b')
title('Filtered average periodogram for eight 128-sample segments of WGN')
xlabel('Normalised frequency')

mean_original = mean(psd_128)
mean_average = mean(psd_avg)
mean_avg_filtered = mean(psd_avg_filt)

std_original = std(psd_128)
std_avg = std(psd_avg)
std_avg_filt = std(psd_avg_filt)




