
%
%  Numerical Methods MAT/CSC 381
%  Project 02:
%
%  Write MATLAB functions to implement the bisection algorithm and secant
%  algorithm for finding the solution to the problem below. Provide a graph of the
%  equation to illustrate f(x) = 0. Use intervals (0.1, 4.0), (0.3, 8.0) and converge
%   to a tolerance of 1.0e-12.
%
%  For each interval determine the bound for number of iterations of the bisection
%  algorithm to ensure the tolerance of 1.0e-12.
%
%  Illustrate mathematically the single-precision round-off error between the two
%  midpoint calculations provided on page 37 (section 2.2).
%

clear all
close all

% setup the function
f = inline('plate_factor(1.00,1.00,x) - 0.5')

% plot the function
fplot( f , [0.01, 4.0] );

% solve using the bisection algorithm
%  using first interval of (0.1, 4.0)
bisection(f,0.1, 4.0, 1.0e-12, 50)

% solve using the bisection algorithm
%  using second interval of (0.3, 8.0)
bisection(f,0.3, 8.0, 1.0e-12, 50)

% solve using the bisection algorithm
%  using first interval of (0.1, 4.0)
secant(f,0.1, 4.0, 1.0e-12, 50)

% solve using the bisection algorithm
%  using second interval of (0.3, 8.0)
secant(f,0.3, 8.0, 1.0e-12, 50)
