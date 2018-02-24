
%  Numerical Methods
%  MAT/CSC 381
%  Project 01

%  Create a report discussing the effects of accumulated roundoff 
%   in creating a sequence of numbers. Implement the following 
%   using software and express your answers graphically. Show that 
%   each method of computing the sequence yields the same numbers 
%   in exact arithmetic. Discuss which methods are better and 
%   which are worse.

clear all; close all;

M = 30;
n = 1:M;

% Compute the exact value using a direct formula using 
%    vector operations (note the dot operation .^)
x = (2/3) .^ (n-1);

% Set up initial terms of each sequence to start the recursion
p(1) = 1;
q(1) = 1;
q(2) = 2/3;
r(1) = 1;
r(2) = 2/3;
s(1) = 1;
s(2) = 2/3;

% Compute the single-step recursion to get the sequence p
for k=1:M-1
   p(k+1) = 2*p(k)/3;
end

% Compute the two-step recursions to get the sequences q, r, s
for k=1:M-2
   q(k+2) = (7/6)*q(k+1) - (1/3)*q(k);
   r(k+2) = (2)*r(k+1) - (8/9)*r(k);
   s(k+2) = (8/3)*s(k+1) - (4/3)*s(k);
end

% Compute the relative errors for each sequence using 
%   vector operations (note the dot operations . /)
relp = abs(x - p) ./ x;
relq = abs(x - q) ./ x;
relr = abs(x - r) ./ x;
rels = abs(x - s) ./ x;

% Plot results
hold on
semilogy(n,relp,'k', 'linewidth',2);
semilogy(n,relq,'r', 'linewidth',2);
semilogy(n,relr,'g', 'linewidth',2);
semilogy(n,rels,'b', 'linewidth',2);

legend('p','q','r','s');
title('Relative Error');
xlabel('Series Term (k)')
ylabel('Relative Error (log scale)')

