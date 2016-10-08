clear all
close all

load vinyl.mat;
%Part 5.1------------------------------------------------------------------
%PERIODOGRAM
figure(1)
set(gcf,'Color','w')
subplot(1,2,1)
LEFT = s2h(:,1);
periodogram(LEFT);
subplot(1,2,2)
RIGHT = s2h(:,2);
periodogram(RIGHT) 

%Part 5.2------------------------------------------------------------------
%PRE FILTERING
figure(2)
set(gcf,'Color','w')
subplot(1,2,1)
LEFT_orig = s2h_original(:,1);
periodogram(LEFT_orig);
subplot(1,2,2)
RIGHT_orig = s2h_original(:,2);
periodogram(RIGHT_orig);

figure(3)
set(gcf,'Color','w')
subplot(1,2,1)
spectrogram(s2h(:,1),512,256,512,44100,'yaxis')
subplot(1,2,2)
spectrogram(s2h_original(:,1),512,256,512,44100,'yaxis')
title('xxxxxxxx')

figure(4)
set(gcf,'Color','w')
subplot(2,3,1)
LEFT_fft = datFFTdoe(LEFT);
title('left')
axis([0 2000 0 0.0065])
subplot(2,3,4)
RIGHT_fft = datFFTdoe(RIGHT);
title('right')
axis([0 2000 0 0.0065])
subplot(2,3,2)
LEFT_orig_fft = datFFTdoe(LEFT_orig);
title('left orig')
axis([0 2000 0 0.0065])
subplot(2,3,5)
RIGHT_orig_fft = datFFTdoe(RIGHT_orig);
title('right orig')
axis([0 2000 0 0.0065])

LEFT_tick = LEFT_fft - LEFT_orig_fft;
RIGHT_tick = RIGHT_fft - RIGHT_orig_fft;

% subplot(2,3,3)
% plot(LEFT_tick)
% title('left tick')
% axis([0 3000 0 0.005])
% subplot(2,3,6)
% plot(RIGHT_tick)
% axis([0 3000 0 0.005])
% title('right tick')

%Part 5.3------------------------------------------------------------------
%POST FILTERING
order = 3;
stopband_1 = [180/22050 220/22050]; 
[b2,a2] = butter(order,stopband_1,'stop');
RIGHT_filtered = filter(b2,a2,RIGHT);

stopband_2 = [1450/22050 1550/22050];
[b,a] = butter(3,stopband_2,'stop'); 
LEFT_filtered = filter(b,a,LEFT);
RIGHT_filtered = filter(b,a,RIGHT_filtered);

figure(5)
set(gcf,'Color','w')
subplot(2,1,1)
datFFTdoe(LEFT_filtered);
title('left filtered')
axis([0 2000 0 0.0065])
subplot(2,1,2)
datFFTdoe(RIGHT_filtered);
title('right filtered')
axis([0 2000 0 0.0065])

s2h_filtered = [LEFT_filtered,RIGHT_filtered];

%Part 5.4------------------------------------------------------------------
figure (6)

subplot(2,1,1)
hold on
[PSD_est1,Fxx] = periodogram(RIGHT_filtered,rectwin(length(RIGHT_filtered)),length(RIGHT_filtered));
plot(Fxx./pi,10*log10(PSD_est1),'g');
[PSD_est2,Fxx] = periodogram(RIGHT,rectwin(length(RIGHT)),length(RIGHT));
plot(Fxx./pi,10*log10(PSD_est2),'r');
[PSD_est3,Fxx] = periodogram(RIGHT_orig,rectwin(length(RIGHT_orig)),length(RIGHT_orig));
plot(Fxx./pi,10*log10(PSD_est3),'b');
title('xxxxx');
xlabel('xxxxx'); 
ylabel('xxxxx');
grid on;
axis([0 0.105 -200 20])
legend('filtered signal','corrupted signal','original signal')

quant_perfR = norm(PSD_est3-PSD_est1)/norm(PSD_est3);
pred_gainR = 10*log10(var(RIGHT_orig)/var(RIGHT_orig - RIGHT_filtered));

subplot(2,1,2)
hold on
[PSD_est1,Fxx] = periodogram(LEFT_filtered,rectwin(length(LEFT_filtered)),length(LEFT_filtered));
plot(Fxx./pi,10*log10(PSD_est1),'g');
[PSD_est2,Fxx] = periodogram(LEFT,rectwin(length(LEFT)),length(LEFT));
plot(Fxx./pi,10*log10(PSD_est2),'r');
[PSD_est3,Fxx] = periodogram(LEFT_orig,rectwin(length(LEFT_orig)),length(LEFT_orig));
plot(Fxx./pi,10*log10(PSD_est3),'b');
title('xxxxx');
xlabel('xxxxx'); 
ylabel('xxxxx');
grid on;
axis([0 0.105 -180 20])
legend('filtered signal','corrupted signal','original signal')

quant_perfL = norm(PSD_est3-PSD_est1)/norm(PSD_est3);
pred_gainL = 10*log10(var(LEFT_orig)/var(LEFT_orig - LEFT_filtered));

%Part 5.5------------------------------------------------------------------
figure(7)
[filtered_left,error,data1] = nlms_estim(LEFT,LEFT_orig,0.8,2);
figure(8)
[filtered_left1,error2,data2] = nlms_estim(LEFT,LEFT_orig,1,2);

%Part 5.6------------------------------------------------------------------
LEFT = um(:,1);
RIGHT = um(:,2);

LEFT_orig = um_original(:,1);
RIGHT_orig = um_original(:,2);

figure(9)
set(gcf,'Color','w')
subplot(2,3,1)
LEFT_fft = datFFTdoe(LEFT);
title('left')
axis([0 2000 0 0.022])
subplot(2,3,4)
RIGHT_fft = datFFTdoe(RIGHT);
title('right')
axis([0 2000 0 0.022])
subplot(2,3,2)
LEFT_orig_fft = datFFTdoe(LEFT_orig);
title('left orig')
axis([0 2000 0 0.022])
subplot(2,3,5)
RIGHT_orig_fft = datFFTdoe(RIGHT_orig);
title('right orig')
axis([0 2000 0 0.022])

order = 3;
stopband_1 = [180/22050 220/22050]; 
[b,a] = butter(order,stopband_1,'stop');
RIGHT_filtered = filter(b,a,RIGHT);

stopband_2 = [1450/22050 1550/22050];
[b,a] = butter(3,stopband_2,'stop'); 
LEFT_filtered = filter(b,a,LEFT);
RIGHT_filtered = filter(b,a,RIGHT_filtered);

set(gcf,'Color','w')
subplot(2,3,3)
datFFTdoe(LEFT_filtered);
title('left filtered')
axis([0 2000 0 0.022])
subplot(2,3,6)
datFFTdoe(RIGHT_filtered);
title('right filtered')
axis([0 2000 0 0.022])
