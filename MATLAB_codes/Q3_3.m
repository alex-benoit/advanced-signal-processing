clear all

%Part 3.3.1----------------------------------------------------------------
phone_number = unidrnd(10, 1, 8)-1
f_samp = 32768;
t_samp = 1/f_samp;
t_tone = 0.25*f_samp;

dial_tone_sig = [];

duration = [];
for temp = 1:172032
    duration(temp) = 5.25*temp/172032;
end

for time_increment=1:t_tone
    dial_tone_sig(time_increment) = dial_tone_genenrator(0,time_increment/t_tone);
end
for time_increment=t_tone*2:t_tone*3
    dial_tone_sig(time_increment) = dial_tone_genenrator(2,time_increment/t_tone);
end
for time_increment=t_tone*4:t_tone*5
    dial_tone_sig(time_increment) = dial_tone_genenrator(0,time_increment/t_tone);
end

j=1;
for time_increment=6:2:20
    digit = phone_number(j);
    for time_increment = t_tone*time_increment:t_tone*(time_increment+1)
        dial_tone_sig(time_increment) = dial_tone_genenrator(digit,time_increment/t_tone);
    end 
    j=j+1;
end

figure(1)
set(gcf,'Color','w')
subplot(3,1,1)
plot(duration, dial_tone_sig)
title('Representation of the Dial Tone Signal for different time ranges')
xlabel('Time (s)')
ylabel('Signal apmitude')
axis([0 5.5 -2 2])
subplot(3,1,2)
plot(duration, dial_tone_sig)
xlabel('Time (s)')
ylabel('Signal apmitude')
axis([0 0.7 -2 2])
subplot(3,1,3)
plot(duration, dial_tone_sig)
xlabel('Time (s)')
ylabel('Signal apmitude')
axis([0.5 0.51 -2 2])

figure(2)
set(gcf,'Color','w')
spectrogram(dial_tone_sig, 8192,0, 8192, 32768,'yaxis');
title('Spectrogram for the dial tone signal for the number: ')

%Part 3.3.4----------------------------------------------------------------
noise = randn(1,172032);
figure(3)
low_noise_dialtone = dial_tone_sig + 0.10*noise;
subplot(1,3,1)
set(gcf,'Color','w');
spectrogram(low_noise_dialtone,512,256,512,32768,'yaxis');
title('Spectrogram for DTS w/ low noise')

medium_noise_dialtone = dial_tone_sig + 0.55*noise;
subplot(1,3,2)
set(gcf,'Color','w');
spectrogram(medium_noise_dialtone,512,256,512,32768,'yaxis');
title('Spectrogram for DTS w/ medium noise')

high_noise_dialtone = dial_tone_sig + 2*noise;
subplot(1,3,3)
set(gcf,'Color','w');
spectrogram(high_noise_dialtone,512,256,512,32768,'yaxis');
title('Spectrogram for DTS w/ high noise')

figure(4)
set(gcf,'Color','w')
subplot (3,1,1)
plot(duration, low_noise_dialtone)
title('Dial Tone Signal representation with different amounts of noise')
xlabel('Time (s)')
ylabel('Signal amplitude')
axis([0 5.5 -5 5])
subplot (3,1,2)
plot(duration, medium_noise_dialtone)
xlabel('Time (s)')
ylabel('Signal amplitude')
axis([0 5.5 -5 5])
subplot (3,1,3)
plot(duration, high_noise_dialtone)
xlabel('Time (s)')
ylabel('Signal amplitude')
axis([0 5.5 -10 10])

figure(5)
set(gcf,'Color','w')
subplot (1,2,1)
plot(duration, dial_tone_sig)
title('Close-up of the dial tone signal with medium noise')
xlabel('Time (s)')
ylabel('Signal apmitude')
axis([0.5 0.505 -2 2])
subplot (1,2,2)
plot(duration, medium_noise_dialtone)
xlabel('Time (s)')
ylabel('Signal apmitude')
axis([0.5 0.505 -2 2])