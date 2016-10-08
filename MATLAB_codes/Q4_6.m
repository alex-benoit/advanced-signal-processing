clear all

%Part 4.4------------------------------------------------------------------
x = randn(100000,1);
a = [1,0.9,0.2];
b = (1);
x_input = filter(b,a,x);
mu_in = 0.0001;

figure(1)
set(gcf,'Color','w')

subplot(2,2,1)
[estimation,err,w_mu] = lms_signalgo(0,x_input,mu_in,2);
plot(estimation)
title('No Sign - AR parameters estimation')
xlabel('Sample number')
ylabel('Signal amplitude')
legend('a1','a2')
axis([0 100000 -1 0.5])

subplot(2,2,2)
[estimation,err,w_mu] = lms_signalgo(1,x_input,mu_in,2);
plot(estimation)
title('Signed error - AR parameters estimation')
xlabel('Sample number')
ylabel('Signal amplitude')
legend('a1','a2')
axis([0 100000 -1 0.5])

subplot(2,2,3)
[estimation,err,w_mu] = lms_signalgo(2,x_input,mu_in,2);
plot(estimation)
title('Signed regressor - AR parameters estimation')
xlabel('Sample number')
ylabel('Signal amplitude')
legend('a1','a2')
axis([0 100000 -1 0.5])

subplot(2,2,4)
[estimation,err,w_mu] = lms_signalgo(3,x_input,mu_in,2);
plot(estimation)
title('Sign sign - AR parameters estimation')
xlabel('Sample number')
ylabel('Signal amplitude')
legend('a1','a2')
axis([0 100000 -1 0.5])

