function [vx, vy] = euler(f, a, b, n, ya)
% Calculate the solution of the initial-value problem from Euler method
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

    fxy = f(x, y);
    fprintf('i: %.3d\t x: %.4f\t y: %.4f\n', 0, x, y);

    for i = 1:n
        x = a + i * h;
        y = y + h * fxy;

        fxy = f(x, y);
        fprintf('i: %.3d\t x: %.4f\t y: %.4f\n', i, x, y);
        vx(i + 1) = x;
        vy(i + 1) = y;
    end
end
