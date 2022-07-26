%% Numerical methods implementation in MATLAB.
%
% Author: Cristiano Fraga G. Nunes <cfgnunes@gmail.com>

clc;
close all;
format short;

% Imports
addpath differentiation
addpath integration
addpath interpolation
addpath linear_systems
addpath linear_systems_iterative
addpath ode
addpath polynomials
addpath solutions

% Bisection method (find roots of an equation)
%   Pros:
%       It is a reliable method with guaranteed convergence;
%       It is a simple method that searches for the root by employing a
%           binary search;
%       There is no need to calculate the derivative of the function.
%   Cons:
%       Slow convergence;
%       It is necessary to enter a search interval [a, b];
%       The interval reported must have a signal exchange, f (a) * f (b)<0.
disp('> Run an example "Solutions: Bisection method".')
f = @(x) (4 * x^3 + x + cos(x) - 10);
tol = 10^ - 5;
iter_max = 100;
a = 1.0;
b = 2.0;
[root, iter, converged] = bisection(f, a, b, tol, iter_max)

% Newton method (find roots of an equation)
%   Pros:
%       It is a fast method.
%    Cons:
%       It may diverge;
%       It is necessary to calculate the derivative of the function;
%       It is necessary to give an initial x0 value where
%           f'(x0) must be nonzero.
disp('> Run an example "Solutions: Newton method".')
f = @(x) (4 * x^3 + x + cos(x) - 10);
df = @(x) (12 * x^2 + 1 - sin(x));
tol = 10^ - 5;
iter_max = 100;
x0 = 2.0;
[root, iter, converged] = newton(f, df, x0, tol, iter_max)

% Secant method (find roots of an equation)
%   Pros:
%       It is a fast method (slower than Newton's method);
%       It is based on the Newton method but does not need the derivative
%           of the function.
%   Cons:
%       It may diverge if the function is not approximately linear in the
%           range containing the root;
%       It is necessary to give two points, 'a' and 'b' where
%           f(a)-f(b) must be nonzero.
disp('> Run an example "Solutions: Secant method".')
f = @(x) (4 * x^3 + x + cos(x) - 10);
tol = 10^ - 5;
iter_max = 100;
a = 1.0;
b = 2.0;
[root, iter, converged] = secant(f, a, b, tol, iter_max)

disp('> Run an example "Interpolation: Lagrange method".')
x = [2 11/4 4];
y = [1/2 4/11 1/4];
x_int = 3;
[y_int] = lagrange(x, y, x_int)

disp('> Run an example "Interpolation: Neville method".')
x = [1.0 1.3 1.6 1.9 2.2];
y = [0.7651977 0.6200860 0.4554022 0.2818186 0.1103623];
x_int = 1.5;
[y_int, q] = neville(x, y, x_int)

disp('> Run an example "Polynomials: Briot-Ruffini method".')
root = -2;
a = [2 0 -3 3 -4];
[b, rest] = briot_ruffini(root, a)

disp('> Run an example "Polynomials: Newtons Divided-Difference method".')
x = [1.0 1.3 1.6 1.9 2.2];
y = [0.7651977 0.6200860 0.4554022 0.2818186 0.1103623];
[f] = newton_divided_difference(x, y)

disp('> Run an example "Differentiation: Backward-difference method".')
x = [0.0 0.2 0.4];
y = [0.00000 0.74140 1.3718];
[dy] = derivative_backward_difference(x, y)

disp('> Run an example "Differentiation: Three-Point method".')
x = [1.1 1.2 1.3 1.4];
y = [9.025013 11.02318 13.46374 16.44465];
[dy] = derivative_three_point(x, y)

disp('> Run an example "Differentiation: Five-Point method".')
x = [2.1 2.2 2.3 2.4 2.5 2.6];
y = [-1.709847 -1.373823 -1.119214 -0.9160143 -0.7470223 -0.6015966];
[dy] = derivative_five_point(x, y)

disp('> Run an example "Integration: Trapezoidal Rule".')
x = [0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84];
y = [124, 134, 148, 156, 147, 133, 121, 109, 99, 85, 78, 89, 104, 116, 123];
[xi] = composite2_trapezoidal(x, y)

disp('> Run an example "Integration: Trapezoidal Rule".')
f = @(x) (x^2 * log(x^2 + 1));
a = 0.0;
b = 2.0;
h = 0.25;
n = (b - a) / h;
[xi] = composite_trapezoidal(f, b, a, n)

disp('> Run an example "Integration: Composite 1/3 Simpsons Rule".')
x = [0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84];
y = [124, 134, 148, 156, 147, 133, 121, 109, 99, 85, 78, 89, 104, 116, 123];
[xi] = composite2_simpson(x, y)

disp('> Run an example "Integration: Composite 1/3 Simpsons Rule".')
f = @(x) (x^2 * log(x^2 + 1));
a = 0.0;
b = 2.0;
h = 0.25;
n = (b - a) / h;
[xi] = composite_simpson(f, b, a, n)

disp('> Run an example "ODE: Euler method".')
f = @(x, y) (y - x^2 + 1);
a = 0.0;
b = 2.0;
n = 10;
ya = 0.5;
[vx, vy] = euler(f, a, b, n, ya);

disp('> Run an example "ODE: Taylor (Order Two) method".')
f = @(x, y) (y - x^2 + 1);
df1 = @(x, y) (y - x^2 + 1 - 2 * x);
a = 0.0;
b = 2.0;
n = 10;
ya = 0.5;
[vx, vy] = taylor2(f, df1, a, b, n, ya);

disp('> Run an example "ODE: Taylor (Order Four) method".')
f = @(x, y) (y - x^2 + 1);
df1 = @(x, y) (y - x^2 + 1 - 2 * x);
df2 = @(x, y) (y - x^2 + 1 - 2 * x - 2);
df3 = @(x, y) (y - x^2 + 1 - 2 * x - 2);
a = 0.0;
b = 2.0;
n = 10;
ya = 0.5;
[vx, vy] = taylor4(f, df1, df2, df3, a, b, n, ya);

disp('> Run an example "ODE: Runge-Kutta (Order Four) method".')
f = @(x, y) (y - x^2 + 1);
a = 0.0;
b = 2.0;
n = 10;
ya = 0.5;
[vx, vy] = rk4(f, a, b, n, ya);

disp('> Run an example "ODE: Runge-Kutta (Order Four) method for systems of differential equations".')
m = 2;
f = cell(m, 1);
f{1} = @(x, y) (- 4 * y(1) + 3 * y(2) + 6);
f{2} = @(x, y) (- 2.4 * y(1) + 1.6 * y(2) + 3.6);
a = 0.0;
b = 0.5;
h = 0.1;
n = (b - a) / h;
ya = zeros(m, 1);
ya(1) = 0.0;
ya(2) = 0.0;
[vx, vy] = rk4_system(f, a, b, n, ya)

disp('> Run an example "Linear Systems: Gaussian Elimination".')
a = [1 -1 2 -1; 2 -2 3 -3; 1 1 1 0; 1 -1 4 3];
b = [-8 -20 -2 4];
[a] = gauss_elimination_pp(a, b')

disp('> Run an example "Linear Systems: Backward Substitution".')
u = a(:, 1:end - 1);
d = a(:, end);
[x] = backward_substitution(u, d)

disp('> Run an example "Linear Systems: Forward Substitution".')
l = [3 0 0 0; -1 1 0 0; 3 -2 -1 0; 1 -2 6 2];
c = [5 6 4 2];
[a] = forward_substitution(l, c')

disp('> Run an example "Iteractive Linear Systems: Jacobi".')
a = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6 25 -11 15];
x0 = [0 0 0 0];
tol = 10^ - 3;
iter_max = 10;
[x, iter] = jacobi(a, b', x0', tol, iter_max)

disp('> Run an example "Iteractive Linear Systems: Gauss-Seidel".')
a = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6 25 -11 15];
x0 = [0 0 0 0];
tol = 10^ - 3;
iter_max = 10;
[x, iter] = gauss_seidel(a, b', x0', tol, iter_max)
