function f = datFFTdoe(input)
L = length(input);
Fs = 44100;
NFFT = 2^nextpow2(L);
theogfft = fft(input,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(theogfft(1:NFFT/2+1)))

