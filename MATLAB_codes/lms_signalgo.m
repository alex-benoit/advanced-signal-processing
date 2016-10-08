function [y,err,dplot] = lms_signalgo(algorithm,x,mu,M)
L = length(x);
y = zeros(L,M);
err = zeros(L,1);
w = zeros(L,1);
dplot = mu;

for i = M+1:L
    w(i) = y(i,:)*x(i-1:-1:i-M);
    err(i) = x(i) - w(i);
            
    if (algorithm == 0)
        y(i+1,:) = y(i,:) + dplot*err(i)*x(i-1:-1:i-M)';
    elseif (algorithm == 1)
        y(i+1,:) = y(i,:) + dplot*sign(err(i))*x(i-1:-1:i-M)';
    elseif (algorithm == 2)
        y(i+1,:) = y(i,:) + dplot*err(i)*sign(x(i-1:-1:i-M))';
    else 
        y(i+1,:) = y(i,:) + dplot*sign(err(i))*sign(x(i-1:-1:i-M))';
    end
end

end