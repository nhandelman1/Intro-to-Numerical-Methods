1;

function gaussel_arithmetic_counts(n, actual_add_count, actual_mult_count)
    book_add_count = (2*n^3 + 3*n^2 - 5*n)/6
    actual_add_count
    printf("\n")
    book_mult_count = (n^3 + 3*n^2 - n)/3
    actual_mult_count
    printf("\n")
endfunction

function gausspp_arithmetic_counts(n, actual_add_count, actual_mult_count, actual_comp_count)
    expected_add_count = (2*n^3 + 3*n^2 - 5*n)/6
    actual_add_count
    printf("\n")
    expected_mult_count = (n^3 + 3*n^2 - n)/3 + (n^2+n)/2 - 1
    actual_mult_count
    printf("\n")
    book_comp_count = 3/2*n*(n-1)
    actual_comp_count
    printf("\n")
endfunction

%  Input #1 for Gaussian Elimination with Backward Substitution
printf("Input #1 for Gaussian Elimination with Backward Substitution\n");
n = 4
AA = [1 -1 2 -1 -8; 2 -2 3 -3 -20; 1 1 1 0 -2; 1 -1 4 3 4]

[BB,X, add_count, mult_count] = gaussel(AA, n);
BB
X
gaussel_arithmetic_counts(n, add_count, mult_count);
pause;

%  Input #2 for Gaussian Elimination with Backward Substitution
printf("Input #2 for Gaussian Elimination with Backward Substitution\n");
n = 2
AA = [30.00 591400 591700; 5.291 -6.130 46.78]

[BB,X, add_count, mult_count] = gaussel(AA, n);
BB
X
gaussel_arithmetic_counts(n, add_count, mult_count);

pause;

%  Input #1 for Gaussian Elimination with Scaled Partial Pivoting
printf("Input #1 for Gaussian Elimination with Scaled Partial Pivoting\n");
n = 2
AA = [30.00 591400 591700; 5.291 -6.130 46.78]

[BB,X, add_count, mult_count, comp_count] = gausspp(AA, n);
BB
X
gausspp_arithmetic_counts(n, add_count, mult_count, comp_count);

pause;

%  Input #2 for Gaussian Elimination with Scaled Partial Pivoting
printf("Input #2 for Gaussian Elimination with Scaled Partial Pivoting\n");
n = 3
AA = [2.11 -4.21 0.921 2.01; 4.01 10.2 -1.12 -3.09; 1.09 0.987 0.832 4.21]

[BB,X, add_count, mult_count, comp_count] = gausspp(AA, n);
BB
X
gausspp_arithmetic_counts(n, add_count, mult_count, comp_count);