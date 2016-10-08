clear all

%Part 4.3------------------------------------------------------------------
x = randn(1000,1);      
b = [1 2 3 2 1];   
a = (1);
y = (filter(b,a,x))/std(filter(b,a,x));           
noise = sqrt(0.1)*randn(1000,1); 
z_noise = y + noise;
mu_orig = 0.01;
gear(x,z_noise,mu_orig,5)
