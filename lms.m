function [y,err,dplot] = lms(x,z_noise,mu,M)
L = length(x);
y = zeros(1,L);
err = zeros(1,L);
w = zeros(M,1);
dplot = zeros(M,M-1);

for i = M:L
    x_2 = x(i:-1:i-M+1);
    y(i) = w'*x_2;
    err(i) = z_noise(i)-y(i);
    w = w+mu*conj(err(i))*x_2;
    dplot = horzcat(dplot,w);
end

figure(1)
set(gcf,'Color','w')
subplot(1,2,1)
plot(dplot(1,:),'b')
hold on
plot(dplot(2,:),'c')
plot(dplot(3,:),'g')
plot(dplot(4,:),'k')
plot(dplot(5,:),'r')
title('Time evolution of the estimated filter coefficients for mu=0.01')
xlabel('Sample number')
ylabel('Adaptive weight')

subplot(1,2,2)
plot(err.^2)
title('Time evolution for the outut error square for mu=0.01')
xlabel('Sample number')
ylabel('Squared error')

figure(2)
set(gcf,'Color','w')
hold on
plot(z_noise)
plot(y,'r')
title('Theoretical output and LMS estimate for mu=0.01')
xlabel('Sample number')
ylabel('Amplitude')

