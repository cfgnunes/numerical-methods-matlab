function [vx, vy] = taylor4(f, df1, df2, df3, a, b, n, ya)
% Calculate the solution of the initial-value problem from Taylor (Order Four) method
% Inputs:
%         f: Function f(x)
%       df1: 1's derivate of function f(x)
%       df2: 2's derivate of function f(x)
%       df3: 3's derivate of function f(x)
%         a: Initial point
%         b: End point
%         n: Number of intervals
%        ya: Initial value
% Outputs:
%       vx: Array containing x values
%       vy: Array containing y values (solution of IVP)

    vx = zeros(1, n+1);
    vy = zeros(1, n+1);

    h=(b-a)/n;
    x=a;
    y=ya;

    vx(1)=x;
    vy(1)=y;

    fprintf('i: %.3d\t x:%.4f\t y:%.4f\t\n', 0, x, y);

    for i=1:n
        y=y + h*(f(x,y) + 0.5*h*df1(x,y) + (h^2/6)*df2(x,y) + (h^3/24)*df3(x,y));
        x=a+i*h;

        fprintf('i: %.3d\t x:%.4f\t y:%.4f\t\n', i, x, y);
        vx(i+1)=x;
        vy(i+1)=y;
    end
end