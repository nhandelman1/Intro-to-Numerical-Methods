% 
% Jacobi's iterative method for solving linear systems of equations
%
%  Method used from equation 7.2 (pg 293)
% Faires, J. Douglas, and Richard Burden. 
%  "Numerical Methods" fourth ed., (2013).
%
function [x1] = jacobi (A, b, x0, TOL)

% calculate size of array A
nsize = size(A);
n = nsize(1);

% zero out new x vector  x^(k)
%  x0 = x^(k-1)
x1 = zeros(n,1);

% initialize distance between x0 and x1
dist = 1.0;
iter = 1;

%A = D - L - U
D = diag(A); %extract diagonal elements into a vector

if(prod(D) == 0) %D is not invertible if there is a 0 on the diagonal
    return;
endif

D = diag(D); %create diagonal matrix
L = -tril(A, -1);
U = -triu(A, 1);

%D inverse, Tj and Cj
Dinv = inv(D);
Tj = Dinv*(L+U);
Cj = Dinv*b;

while (dist > TOL)

    % Jacobi iterative method goes here
    x1=Tj*x0+Cj;
    
    % after the iteration, calculate the distance
    % between the vectors
    dist = max( abs(x1 - x0)) / max(abs(x1));
    
    % print out some useful information
    printf('%d %f\n', iter, dist);
    
    % assign x^k = x^(k-1)
    x0 = x1;
    
    % increment iteration counter
    iter = iter + 1;

endwhile

endfunction
