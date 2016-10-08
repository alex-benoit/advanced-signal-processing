clear all
close all

audio = audioread('s.wav');
audioinfo('s.wav')
audio = audio(2800:3799,1);
figure(1)
set(gcf,'Color','w')
hold on
grid on
plot(audio)
title('Comparaison of the voice signal and predictor output for mu=5, predictor order=30')
xlabel('Sample number')
ylabel('Signal apmlitude')

speech_predictor(audio,5)

% figure(2)
% set(gcf,'Color','w')
% hold on
% grid on
% plot(audio)
% title('Comparaison of the voice signal and predictor output for mu=15, predictor order=5')
% xlabel('Sample number')
% ylabel('Signal apmlitude')
% 
% speech_predictor(audio,15)
% 
% figure(3)
% set(gcf,'Color','w')
% hold on
% grid on
% plot(audio)
% title('Comparaison of the voice signal and predictor output for mu=30, predictor order=5')
% xlabel('Sample number')
% ylabel('Signal apmlitude')
% 
% speech_predictor(audio,30)