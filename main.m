%% Numerical methods implementation in MATLAB.
% Author: Cristiano Nunes
% E-mail: <cfgnunes@gmail.com>

clc;
clear all;
close all;
syms x;
format long;

% Imports
addpath differentiation
addpath interpolation
addpath polynomials
addpath solutions

% Bisection method (find roots of an equation)
%     Pros:
%         It is a reliable method with guaranteed convergence;
%         It is a simple method that does the search of the root by means of a binary search;
%         There is no need to calculate the derivative of the function.
%     Cons:
%         Slow convergence;
%         It is necessary to enter a search interval [a, b];
%         The interval reported must have a signal exchange, f (a) * f (b) <0.
disp('Solutions: Bisection method');
f = 4*x^3 + x + cos(x) - 10;
tol = 10^-5;
iter_max = 100;
a = 1.0;
b = 2.0;
[root, iter, converged] = bisection(f, a, b, tol, iter_max)

% Newton method (find roots of an equation)
%     Pros:
%         It is a fast method.
%     Cons:
%         It may diverge;
%         It is necessary to calculate the derivative of the function;
%         It is necessary to give an initial x0 value where f'(x0) must be nonzero.
disp('Solutions: Newton method');
f = 4*x^3 + x + cos(x) - 10;
tol = 10^-5;
iter_max = 100;
x0 = 2.0;
[root, iter, converged] = newton(f, x0, tol, iter_max)

% Secant method (find roots of an equation)
%     Pros:
%         It is a fast method (slower than Newton's method);
%         It is based on the Newton method, but does not need the derivative of the function.
%     Cons:
%         It may diverge if the function is not approximately linear in the range containing the root;
%         It is necessary to give two points 'a' and 'b' where f(a)-f(b) must be nonzero.
disp('Solutions: Secant method');
f = 4*x^3 + x + cos(x) - 10;
tol = 10^-5;
iter_max = 100;
a = 1.0;
b = 2.0;
[root, iter, converged] = secant(f, a, b, tol, iter_max)

disp('Interpolation: Lagrange method');
x=[2 11/4 4]
y=[1/2 4/11 1/4]
x_int=3
[y_int] = lagrange(x, y, x_int)

disp('Interpolation: Neville method');
x=[1.0 1.3 1.6 1.9 2.2]
y=[0.7651977 0.6200860 0.4554022 0.2818186 0.1103623]
x_int=1.5
[y_int, q] = neville(x, y, x_int)

disp('Polynomials: Briot-Ruffini method');
root=-2;
a=[2 0 -3 3 -4]
[b, rest] = briot_ruffini(root, a)

disp('Polynomials: Newtons Divided-Difference method');
x=[1.0 1.3 1.6 1.9 2.2];
y=[0.7651977 0.6200860 0.4554022 0.2818186 0.1103623];
[f] = newton_divided_difference(x, y)

disp('Differentiation: Backward-difference method')
x = [0.0 0.2 0.4]
y = [0.00000 0.74140 1.3718]
[dy] = derivative_backward_difference(x, y)

disp('Differentiation: Three-Point method')
x = [1.1 1.2 1.3 1.4]
y = [9.025013 11.02318 13.46374 16.44465]
[dy] = derivative_three_point(x, y)

disp('Differentiation: Five-Point method')
x = [2.1 2.2 2.3 2.4 2.5 2.6]
y = [-1.709847 -1.373823 -1.119214 -0.9160143 -0.7470223 -0.6015966]
[dy] = derivative_five_point(x, y)
