clear all

x = randn(1000,1);
figure(1)
set(gcf,'Color','w')
plot(x, 'bo')
title('Distribution of the random values of X')
xlabel('Sample number')
ylabel('Value of x')

%Part 1.1.1----------------------------------------------------------------
x_mean = mean(x);
disp(['Sample mean = ', num2str(x_mean)]);

%Part 1.1.2----------------------------------------------------------------
x_stand_dev = std(x);
disp(['Sample standard deviation = ', num2str(x_stand_dev)]);

%Part 1.1.3----------------------------------------------------------------
ensemble = randn(1000,10);

figure(2)
set(gcf,'Color','w')
subplot(1,2,1)
x_mean = mean(ensemble,1)
bar(x_mean)
title('Mean of the ensemble')
xlabel('Sample number')
ylabel('Value of the sample mean')
axis([0 11 -0.20 0.20])
subplot(1,2,2)
x_stand_dev = std(ensemble,1)
bar(x_stand_dev)
title('Standard deviation of the ensemble')
xlabel('Sample number')
ylabel('Value of the sample standard deviation')
axis([0 11 0 1.4])

%Part 1.1.4----------------------------------------------------------------
ix = -5*1:0.01:5*1;
iy = pdf('normal', ix, 0, 1);

figure(3)
set(gcf,'Color','w')
%10 bins & 1000 samples
subplot(1,4,1)
bins = 10;
bin_width = 8/bins;
m = -4:bin_width:4;
n = hist(x,m);
bar(m,n/sum(n*bin_width));
axis([-5 5 0 0.5])
hold on
plot(ix,iy,'r','Linewidth',2);
hold off
title('10 bins/1000 samples')
xlabel('Sample number')
ylabel('Relative frequency')
legend('Empirical','Theoretical');
%100 bins & 1000 samples
subplot(1,4,2)
bins = 100;
bin_width = 8/bins;
m = -4:bin_width:4;
n = hist(x,m);
bar(m,n/sum(n*bin_width));
axis([-5 5 0 0.5])
hold on
plot(ix,iy,'r','Linewidth',2);
hold off
title('100 bins/1000 samples')
xlabel('Sample number')
ylabel('Relative frequency')
%10 bins & 100000 samples
x = randn(100000,1); %new x with 100,000 samples instead of 1000
bins = 10;
subplot(1,4,3)
bin_width = 8/bins;
m = -4:bin_width:4;
n = hist(x,m);
bar(m,n/sum(n*bin_width));
axis([-5 5 0 0.5])
hold on
plot(ix,iy,'r','Linewidth',2);
hold off
title('10 bins/100,000 samples')
xlabel('Sample number')
ylabel('Relative frequency')
%100 bins & 100000 samples
subplot(1,4,4)
bins = 100;
bin_width = 8/bins;
m = -4:bin_width:4;
n = hist(x,m);
bar(m,n/sum(n*bin_width));
axis([-5 5 0 0.5])
hold on
plot(ix,iy,'r','Linewidth',2);
hold off
title('100 bins/100,000 samples')
xlabel('Sample number')
ylabel('Relative frequency')


