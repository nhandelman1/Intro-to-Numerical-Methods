A = load('-ascii','A.txt');
b = load('-ascii','b.txt');
x0 = zeros(20,1);
x1 = jacobi(A, b, x0, 10^-3)

A = [3,-1,1;-1,6,3;1,3,7];
b = [19;44;83];
x0 = zeros(3,1);
x1 = jacobi(A, b, x0, 10^-3)

A = [10,-1,2,0;-1,11,-1,3;2,-1,10,-1;0,3,-1,8];
b = [6;25;-11;15];
x0 = zeros(4,1);
x1 = jacobi(A, b, x0, 10^-3)