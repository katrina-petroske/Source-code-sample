function sol = midcomp(fun, a, b, n)
% Composite midpoint rule
%    
% Inputs
% fun - the function to integrate
% a - Integration start
% b - Integration end
% n - Minimum number of subintervals
%
% Outputs
% sol - solution of the composite midpoint rule
 
% Initialization
h = (b-a)/n;
x = a:h:b;

% Composite rule
sum=0;
for i=1:length(x)-1
    sum = sum+fun((x(i)+x(i+1))/2);
end
sol=h*sum;



