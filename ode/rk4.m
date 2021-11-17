function [vx, vy] = rk4(f, a, b, n, ya)
% Calculate the solution of the initial-value problem from Runge-Kutta (Order Four) method
% Inputs:
%         f: Function f(x)
%         a: Initial point
%         b: End point
%         n: Number of intervals
%        ya: Initial value
% Outputs:
%       vx: Array containing x values
%       vy: Array containing y values (solution of IVP)

    vx = zeros(1, n + 1);
    vy = zeros(1, n + 1);

    h = (b - a) / n;
    x = a;
    y = ya;

    vx(1) = x;
    vy(1) = y;

    fprintf('i: %.3d\t x:%.4f\t y:%.4f\t\n', 0, x, y);

    for i = 1:n
        k1 = h * f(x, y);
        k2 = h * f(x + h / 2, y + k1 * h/ 2);
        k3 = h * f(x + h / 2, y + k2 * h/ 2);
        k4 = h * f(x + h, y + k3 * h);

        x = a + i * h;
        y = y + (k1 + 2 * k2 + 2 * k3 + k4) / 6;

        fprintf('i: %.3d\t x:%.4f\t y:%.4f\t\n', i, x, y);
        vx(i + 1) = x;
        vy(i + 1) = y;
    end
end
