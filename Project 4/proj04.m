func = @(x)e^x;
a = -1;
b = 1;
n = 362;
approx_integral = simpson(func, a, b, n);

if(isnan(approx_integral))
    printf('Invalid Input. n must be positive and even.\n');
else
    fprintf('Integral(%i, %i) of %s = %.15d. Approximated with %i intervals.\n', a, b, substr(func2str(func), 6), approx_integral, n);
endif