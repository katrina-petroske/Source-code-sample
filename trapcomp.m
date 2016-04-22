function sol = trapcomp(fun, a, b, n)
% Composite trapezoid rule
%    
% Inputs
% fun - the function to integrate
% a - Integration start
% b - Integration end
% n - Minimum number of subintervals
%
% Outputs
% sol - solution of the composite trapezoid rule
 
% Initialization
h = (b-a)/n;
x = a;
 
% Composite rule
sol = fun(a);
for k=2:n
    x  = x+h;
    sol = sol+2.*fun(x);
end
sol = (sol+fun(b))*h/2;
