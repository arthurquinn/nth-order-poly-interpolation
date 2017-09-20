function P = Pn(X, x, y)

    %n is the degree of Pn
    n = length(x) - 1;
    
    %total is the total num of x,y pairs
    total = length(X);
    
    %L is matrix of our Lagrange values
    L = ones(n+1,total); 

    %Foreach degree
    for i = 0:n
        %Calculate the corresponding Lagrange value
        for k = 0:n
            %Compute product for all i != k (X-xi)/(xk-xi)
            if i == k
                continue
            end
            L(k+1,:) = L(k+1,:).*(X - x(i+1))/(x(k+1)-x(i+1));
        end
    end 

    %Return result of interpolation as vector of estimated y values
    P = y * L;
end

