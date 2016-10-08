clear all

%Part 1.2.1 Signal RP1-----------------------------------------------------
data1 = rp1(100,100);
mean_rp1 = mean(data1);
stddev_rp1 = std(data1);
figure(1)
set(gcf,'Color','w')
subplot(1,2,1)
stem(mean_rp1)
title('RP1 ensemble mean w/ M=100,N=100', 'FontSize', 9)
ylabel('Mean', 'FontSize', 9)
xlabel('Member Number', 'FontSize', 9)
subplot(1,2,2)
stem(stddev_rp1)
title('RP1 ensemble standard deviation w/ M=100,N=100', 'FontSize', 9)
ylabel('Standard Deviation', 'FontSize', 9)
xlabel('Member Number', 'FontSize', 9)

%Part 1.2.1 Signal RP2-----------------------------------------------------
data2 = rp2(100,100);
mean_rp2 = mean(data2);
stddev_rp2 = std(data2);
figure(3)
set(gcf,'Color','w')
subplot(1,2,1)
stem(mean_rp2);
title('RP2 ensemble mean w/ M=100,N=100', 'FontSize', 9)
ylabel('Mean', 'FontSize', 9)
xlabel('Member Number', 'FontSize', 9)
subplot(1,2,2)
stem(stddev_rp2)
title('RP2 ensemble standard deviation w/ M=100,N=100', 'FontSize', 9)
ylabel('Standard Deviation', 'FontSize', 9)
xlabel('Member Number', 'FontSize', 9)

%Part 1.2.1 Signal RP3-----------------------------------------------------
data3 = rp3(100,100);
mean_rp3 = mean(data3);
stddev_rp3 = std(data3);
figure(5)
set(gcf,'Color','w')
subplot(1,2,1)
stem(mean_rp3)
title('RP3 ensemble mean w/ M=100,N=100', 'FontSize', 9)
ylabel('Mean', 'FontSize', 9)
xlabel('Member Number', 'FontSize', 9)
subplot(1,2,2)
stem(stddev_rp3)
title('RP3 ensemble standard deviation w/ M=100,N=100', 'FontSize', 9)
ylabel('Standard Deviation', 'FontSize', 9)
xlabel('Member Number', 'FontSize', 9)

%Part 1.2.2 Signal RP1-----------------------------------------------------
data4(:,:,1) = rp1(4,1000);
mean2_rp1 = mean(data4(:,:,1),2);
stddev2_rp1 = std(data4(:,:,1),1,2);
figure(2)
set(gcf,'Color','w')
subplot(1,2,1)
stem(mean2_rp1)
title('RP1 time mean w/ M=4,N=1000', 'FontSize', 9)
ylabel('Mean', 'FontSize', 9)
xlabel('Realisation Number', 'FontSize', 9)
subplot(1,2,2)
stem(stddev2_rp1)
title('RP1 time standard deviation w/ M=4,N=1000', 'FontSize', 9)
ylabel('Standard Deviation', 'FontSize', 9)
xlabel('Realisation Number', 'FontSize', 9)

%Part 1.2.2 Signal RP2-----------------------------------------------------
data5 = rp2(4,1000);
mean2_rp2 = mean(data5(:,:,1),2);
stddev2_rp2 = std(data5(:,:,1),1,2);
figure(4)
set(gcf,'Color','w')
subplot(1,2,1)
stem(mean2_rp2)
title('RP2 time mean w/ M=4,N=1000', 'FontSize', 9)
ylabel('Mean', 'FontSize', 9)
xlabel('Realisation Number', 'FontSize', 9)
subplot(1,2,2)
stem(stddev2_rp2)
title('RP2 time standard deviation w/ M=4,N=1000', 'FontSize', 9)
ylabel('Standard Deviation', 'FontSize', 9)
xlabel('Realisation Number', 'FontSize', 9)

%Part 1.2.2 Signal RP3-----------------------------------------------------
data6 = rp3(4,1000);
mean2_rp3 = mean(data6(:,:,1),2);
stddev2_rp3 = std(data6(:,:,1),1,2);
figure(6)
set(gcf,'Color','w')
subplot(1,2,1)
stem(mean2_rp3)
title('RP3 time mean w/ M=4,N=1000', 'FontSize', 9)
ylabel('Mean', 'FontSize', 9)
xlabel('Realisation Number', 'FontSize', 9)
subplot(1,2,2)
stem(stddev2_rp3)
title('RP3 time standard deviation w/ M=4,N=1000', 'FontSize', 9)
ylabel('Standard Deviation', 'FontSize', 9)
xlabel('Realisation Number', 'FontSize', 9)
