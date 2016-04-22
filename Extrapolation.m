%% Numerical Analysis 2 Katrina Petroske
% Write a Romberg Integration code that accepts interval [a,b], function to
% be integrated, minimum number of subintervals, and the desired order of 
% accuracy. Validate the code with a grid refinement study.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Input Values %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = input('Integration start: a = ');
b = input('Integration end: b = ');
n = input('Minimum number of subintervals: n = ');
fun = input('Function must be of the form "@(x) (some function)" : f(x) = ','s');
% test to make sure user entered correct thing 
k = strfind(fun,'@(x)');
while isempty(k) || k(1)~=1
    disp('Remember to put @(x) at the begining')
    fun = input('Function must be of the form "@(x) (some function)" : f(x) = ','s');
    k = strfind(fun,'@(x)');
end
fun = str2func(fun);
% force order to be 10 or less R_(k,k)-R_(k+1,k+1)<=10^-ord
ord = input('Order (10 or less): order = ');
while ord > 10
   disp('Order is too large')
   ord = input('Order (10 or less): order = ');
end
eps=10^(-ord);

%%%%%%%%%%%%%%%%%%%%%%%%% Romberg Integration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sol = romberg(fun, a, b, 15, n, eps);
fprintf('The solution is : %f \n', sol);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Grid Refinement %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
max = input('Maximum number of rows for Romberg Table: max = ');
act = input('Actual solution of Integral: act = ');

I = rombergGrid(fun, a, b, max);
% Compute the error
error = abs(I-act);

% Find the ratios of the error for each column of the Romberg table
ratio=zeros(max,max);
for i=1:max
    e = error(:,i);
    for j=i:max-1
        ratio(j+1,i)=e(j)/e(j+1);
    end
end




