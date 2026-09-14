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
addpath limits
addpath linear_systems
addpath linear_systems_iterative
addpath ode
addpath polynomials
addpath solutions

disp('> Run an example "Limits: epsilon-delta definition".')
f = @(x) (sin(x) / x);
x = 0;
toler = 10^ - 5;
iter_max = 100;
[limit, iter, converged] = limit_epsilon_delta(f, x, toler, iter_max)

% Bisection method (find roots of an equation)
%   Pros:
%       It is a reliable method with guaranteed convergence;
%       It is a simple method that searches for the root by employing a
%           binary search;
%       There is no need to calculate the derivative of the function.
%   Cons:
%       Slow convergence;
%       It is necessary to enter a search interval [a, b];
%       The interval reported must have a sign change, f(a) * f(b)<0.
disp('> Run an example "Solutions: Bisection method".')
f = @(x) (2 * x^3 - cos(x + 1) - 3);
a = -1.0;
b = 2.0;
toler = 0.01;
iter_max = 100;
[root, iter, converged] = bisection(f, a, b, toler, iter_max)

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
f = @(x) (2 * x^3 - cos(x + 1) - 3);
a = -1.0;
b = 2.0;
toler = 0.01;
iter_max = 100;
[root, iter, converged] = secant(f, a, b, toler, iter_max)

disp('> Run an example "Solutions: Regula Falsi method".')
f = @(x) (2 * x^3 - cos(x + 1) - 3);
a = -1.0;
b = 2.0;
toler = 0.01;
iter_max = 100;
[root, iter, converged] = regula_falsi(f, a, b, toler, iter_max)

disp('> Run an example "Solutions: Pegasus method".')
f = @(x) (2 * x^3 - cos(x + 1) - 3);
a = -1.0;
b = 2.0;
toler = 0.01;
iter_max = 100;
[root, iter, converged] = pegasus(f, a, b, toler, iter_max)

disp('> Run an example "Solutions: Muller method".')
f = @(x) (2 * x^3 - cos(x + 1) - 3);
a = -1.0;
b = 2.0;
toler = 0.01;
iter_max = 100;
[root, iter, converged] = muller(f, a, b, toler, iter_max)

% Newton method (find roots of an equation)
%   Pros:
%       It is a fast method.
%    Cons:
%       It may diverge;
%       It is necessary to calculate the derivative of the function;
%       It is necessary to give an initial x0 value where
%           f'(x0) must be nonzero.
disp('> Run an example "Solutions: Newton method".')
f = @(x) (2 * x^3 - cos(x + 1) - 3);
df = @(x) (6 * x^2 + sin(x + 1));
x0 = 1.0;
toler = 0.01;
iter_max = 100;
[root, iter, converged] = newton(f, df, x0, toler, iter_max)

disp('> Run an example "Interpolation: Lagrange method".')
x = [2 11/4 4];
y = [1/2 4/11 1/4];
x_int = 3;
[y_int] = lagrange(x, y, x_int)

disp('> Run an example "Interpolation: Newton method".')
x = [0.1 0.3 0.4 0.6 0.7];
y = [0.3162 0.5477 0.6325 0.7746 0.8367];
x_int = 0.2;
[y_int] = newton_interpolation(x, y, x_int)

disp('> Run an example "Interpolation: Gregory-Newton method".')
x = [110 120 130];
y = [2.0410 2.0790 2.1140];
x_int = 115;
[y_int] = gregory_newton(x, y, x_int)

disp('> Run an example "Interpolation: Neville method".')
x = [1.0 1.3 1.6 1.9 2.2];
y = [0.7651977 0.6200860 0.4554022 0.2818186 0.1103623];
x_int = 1.5;
[y_int, q] = neville(x, y, x_int)

disp('> Run an example "Polynomials: Root limits".')
c = [1 2 -13 -14 24];
[lim] = root_limits(c)

disp('> Run an example "Polynomials: Briot-Ruffini method".')
a = [2 0 -3 3 -4];
root = -2;
[b, rest] = briot_ruffini(a, root)

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
[xi] = composite_trapezoidal(f, a, b, n)

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
[xi] = composite_simpson(f, a, b, n)

disp('> Run an example "Integration: Romberg method".')
f = @(x) (x^2 * log(x^2 + 1));
a = 0.0;
b = 2.0;
h = 0.25;
n = (b - a) / h;
[xi] = romberg(f, a, b, n)

disp('> Run an example "ODE: Euler method".')
f = @(x, y) (y - x^2 + 1);
a = 0.0;
b = 2.0;
n = 10;
ya = 0.5;
[vx, vy] = euler(f, a, b, n, ya)

disp('> Run an example "ODE: Taylor (Order Two) method".')
f = @(x, y) (y - x^2 + 1);
df1 = @(x, y) (y - x^2 + 1 - 2 * x);
a = 0.0;
b = 2.0;
n = 10;
ya = 0.5;
[vx, vy] = taylor2(f, df1, a, b, n, ya)

disp('> Run an example "ODE: Taylor (Order Four) method".')
f = @(x, y) (y - x^2 + 1);
df1 = @(x, y) (y - x^2 + 1 - 2 * x);
df2 = @(x, y) (y - x^2 + 1 - 2 * x - 2);
df3 = @(x, y) (y - x^2 + 1 - 2 * x - 2);
a = 0.0;
b = 2.0;
n = 10;
ya = 0.5;
[vx, vy] = taylor4(f, df1, df2, df3, a, b, n, ya)

disp('> Run an example "ODE: Runge-Kutta (Order Four) method".')
f = @(x, y) (y - x^2 + 1);
a = 0.0;
b = 2.0;
n = 10;
ya = 0.5;
[vx, vy] = rk4(f, a, b, n, ya)

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
upper = a(:, 1:end - 1);
d = a(:, end);
[x] = backward_substitution(upper, d)

disp('> Run an example "Linear Systems: Forward Substitution".')
lower = [3 0 0 0; -1 1 0 0; 3 -2 -1 0; 1 -2 6 2];
c = [5 6 4 2];
[x] = forward_substitution(lower, c')

disp('> Run an example "Iterative Linear Systems: Jacobi".')
a = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6 25 -11 15];
x0 = [0 0 0 0];
toler = 10^ - 3;
iter_max = 10;
[x, iter] = jacobi(a, b', x0', toler, iter_max)

disp('> Run an example "Iterative Linear Systems: Gauss-Seidel".')
a = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6 25 -11 15];
x0 = [0 0 0 0];
toler = 10^ - 3;
iter_max = 10;
[x, iter] = gauss_seidel(a, b', x0', toler, iter_max)
