function [y] = pdf(v, bins)
[f,x] = hist(v, bins);
bar(x,f/trapz(x,f));
% hold on
% [f, x1] = ksdensity(v);
% plot(x1,f,'r','LineWidth',2)
% hold off
end

