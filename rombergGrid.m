function R = rombergGrid(fun, a, b, max)
% Romberg integration grid refinement study. 
% Starting with h=(b-a) to h=(b-a)/2^max
% 
% Inputs
% fun - the function to integrate
% a - Integration start
% b - Integration end
% max - maximum number of rows in the Romberg table
%
% Outputs
% R - Romberg Table

format short 
R = zeros(max, max);
if isnan(fun(a)) || fun(a)==inf || fun(a)==-inf
    for k=1:max  
    % Composite midpoint rule for 2^(k-1) subintervals
    R(k,1) = midcomp(fun, a, b, 2^(k-1));  
        % Romberg recursive formula
        for j=1:k-1
            R(k,j+1) = (4^j*R(k,j)-R(k-1,j))/(4^j-1);
        end
        disp(R(k,1:k));   % display Romberg table
        
    end
else
    for k=1:max 
        % Composite trapezoidal rule for 2^(k-1) subintervals
        R(k,1) = trapcomp(fun, a, b, 2^(k-1)); 
        % Romberg recursive formula
        for j=1:k-1
            R(k,j+1) = (4^j*R(k,j)-R(k-1,j))/(4^j-1);
        end
        disp(R(k,1:k));   % display Romberg table
    end
end