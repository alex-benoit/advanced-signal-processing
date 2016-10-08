clear all

%Part 1.3.1----------------------------------------------------------------
N = 10000;
v = randn(1,N);
bins = 50;help ksdensity$

figure(1)
set(gcf,'Color','w')
pdf(v,bins)
title('PDF of 10000 random samples normally distributed')
xlabel('Sample Number', 'FontSize', 9)
ylabel('Reltaive Frequency', 'FontSize', 9)



%Part 1.3.2----------------------------------------------------------------
figure(2)
set(gcf,'Color','w')
bins = 20;

N = 100;
subplot(1,3,1)
pdf(rp3(1,N),bins)
axis([-1 2 0 0.7])
title('PDF of RP3 w/ N=100')
xlabel('Value', 'FontSize', 9)
ylabel('Reltaive Frequency', 'FontSize', 9)

N = 1000;
subplot(1,3,2)
pdf(rp3(1,N),bins)
axis([-1 2 0 0.7])
title('PDF of RP3 w/ N=1000')
xlabel('Value', 'FontSize', 9)
ylabel('Reltaive Frequency', 'FontSize', 9)

N = 10000;
subplot(1,3,3)
pdf(rp3(1,N),bins)
axis([-1 2 0 0.7])
title('PDF of RP3 w/ N=10000')
xlabel('Value', 'FontSize', 9)
ylabel('Reltaive Frequency', 'FontSize', 9)

%Part 1.3.3----------------------------------------------------------------
figure(3)
set(gcf,'Color','w')
bins = 20;

N = 100;
subplot(1,3,1)
pdf(rp1(1,N),bins)
axis([-2 4 0 0.5])
title('PDF of RP1 w/ N=100')
xlabel('Value', 'FontSize', 9)
ylabel('Reltaive Frequency', 'FontSize', 9)

N = 1000;
subplot(1,3,2)
pdf(rp1(1,N),bins)
axis([0 20 0 0.08])
title('PDF of RP1 w/ N=1000')
xlabel('Value', 'FontSize', 9)
ylabel('Reltaive Frequency', 'FontSize', 9)

N = 10000;
subplot(1,3,3)
pdf(rp1(1,N),bins)
axis([0 200 0 0.006])
title('PDF of RP1 w/ N=10000')
xlabel('Value', 'FontSize', 9)
ylabel('Reltaive Frequency', 'FontSize', 9)
