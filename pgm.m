function [psd] = pgm(x)
    N = length(x);
    n = 0:1:N-1;
    freq = 0:1:N-1;
    freq = freq';
    periodogram = exp(-1i*2*pi*freq*n/N);
    psd = (abs(x'*periodogram).^2)/N;
    freq = freq/N;
    plot(freq, psd, 'r')
    xlabel('Normalised frequency')
    ylabel('Estimated PSD')
    grid on
%     psd_filt = filter(0.2*[1 1 1 1 1 ],1, psd);
%     stem(freq, psd_filt)
%     xlabel('Normalised frequency')
%     ylabel('Filtered PSD')
%     grid on