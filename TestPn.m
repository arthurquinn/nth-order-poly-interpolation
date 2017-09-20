function TestPn(n)

X = -5:0.001:5;
A = (2*rand(1,n+1)-1).*[1:n+1];
Y = A(1);
Y = Y + A(2)*X;
for i = 2:n
    Y = Y + A(i+1).*X.^i;
end

% generate a n-th order polynomial using A as coefficients
% sample (n+1) data points (x,y)

idx = randsample(length(X),n+1);
x = zeros(1,n+1);
y = zeros(1,n+1);
for i = 0:n
    x(i+1) = X(idx(i+1));
    y(i+1) = Y(idx(i+1));
end

P = Pn(X,x,y);

figure;
plot(X,Y,'k-','linewidth',2);hold on; grid on;
plot(X,P,'r--','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('y');
plot(x,y,'go','linewidth',3);
set(gca,'xtick',min(X):max(X));
title(['polynomial, n = ' num2str(n)]);


end

