clear all

%Part 4.1------------------------------------------------------------------
x = randn(1000,1);      
order = 4;
b = [1 2 3 2 1];   
a = [1];
y = (filter(b,a,x))/std(filter(b,a,x));         % normalise system output            
noise = sqrt(0.1)*randn(1000,1);                % add noise sigma = 0.1
z_noise = y + noise;                              
SNR = var(y)/var(noise);

temp_R = xcorr(x,order,'unbiased');  
temp_p = xcorr(z_noise,x,order,'unbiased');     
R_xx = temp_R(1+order:(2*order)+1);
R_xx = toeplitz(R_xx);   
p_zx = temp_p(1+order:(2*order)+1);       

opt_coeffs = R_xx\p_zx;
opt_coeffs = opt_coeffs*sqrt(sum(b.*b));               % 

