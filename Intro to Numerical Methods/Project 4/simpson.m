%composite simpson's rule
%integral(a,b)f(x)dx = h/3[f(a) + 2sum(n/2-1, j=1)f(xsub(2j)) + 4sum(n/2, j=1)f(xsub(2j-1)) + f(b)] - (b-a)h4/180*f^(4)(mu)
%func: function being integrated
%a,b: lower, upper limits of integration
%n: number of intervals, must be even and positive
function approx_integral = simpson(func, a, b, n)
if(n<=0 || mod(n,2) == 1)
    approx_integral = NaN;
    return;
endif

h = (b-a)/n; 
sum_of_evens = 0;
sum_of_odds = 0;

%sum of evens and sum of odds
for j=1:n/2-1
    x = a + 2*j*h;
    sum_of_evens = sum_of_evens + func(x); %sum(n/2-1, j=1)f(xsub(2j))
    sum_of_odds = sum_of_odds + func(x-h); %sum(n/2, j=1)f(xsub(2j-1))
endfor    

%add last term of sum of odds
sum_of_odds = sum_of_odds + func(a + (n-1)*h); %f(xsub(2(n/2)-1)) 

approx_integral = h/3*(func(a) + 2*sum_of_evens + 4*sum_of_odds + func(b));

endfunction
