function sol = romberg(fun, a, b, max, n, eps)
% Performs Romberg Integration on a function on a given interval, also 
% used Richarson extrapolation on the Composite Midpoint rule since the 
% recursive formula is the same and we are able to integrate functions
% where the starting point in undefined, ie. integral on [0,1] of sin(x)/x
% 
% Inputs
% fun - the function to integrate
% a - Integration start
% b - Integration end
% max - maximum number of rows for Romberg table
% n - defines the number of subintervals in the Trapezoid/Midpoint rule
% eps - order of accuracy 
%
% Outputs
% sol - solution of the Romberg integration/integration to the desired 
%       order of accuracy

 
R = zeros(max, max);
if isnan(fun(a)) || fun(a)==inf || fun(a)==-inf
    for k=1:max  
    % Composite midpoint rule for n subintervals
    R(k,1) = midcomp(fun, a, b, n*2^(k-1));
        % Romberg recursive formula
        for j=1:k-1
            R(k,j+1) = (4^j*R(k,j)-R(k-1,j))/(4^j-1);
            % Check if entries are within desired order of accuracy
            if abs(R(k,j+1)-R(k-1,j)) < eps
                sol = R(k,j+1);
                break;
            % reached the end of the table and did not get desired order     
            elseif k == max
                error( 'Integration did not converge to desired order' );
            end
        end
    end
else
    for k=1:max  
        % Composite trapezoidal rule for n subintervals
        R(k,1) = trapcomp(fun, a, b, n*2^(k-1)); 
        % Romberg recursive formula
        for j=1:k-1
            R(k,j+1) = (4^j*R(k,j)-R(k-1,j))/(4^j-1);
            % Check if entries are within desired order of accuracy
            if abs(R(k,j+1)-R(k,j)) < eps
                sol=R(k,j+1);
                break;
            % reached the end of the table and did not get desired order
            elseif k == max
                error( 'Romberg integration did not converge to desired order' );
            end
        end
    end
end
