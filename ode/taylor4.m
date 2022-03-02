function [vx, vy] = taylor4(f, df1, df2, df3, a, b, n, ya)
    % Calculate the solution of the initial-value problem (IVP).
    %
    % Solve the IVP from the Taylor (Order Four) method.
    %
    % Args:
    %     f: function f(x).
    %     df1: 1's derivative of function f(x).
    %     df2: 2's derivative of function f(x).
    %     df3: 3's derivative of function f(x).
    %     a: the initial point.
    %     b: the final point.
    %     n: number of intervals.
    %     ya: initial value.
    %
    % Returns:
    %     vx: an array containing x values.
    %     vy: an array containing y values (solution of IVP).

    vx = zeros(1, n + 1);
    vy = zeros(1, n + 1);

    h = (b - a) / n;
    x = a;
    y = ya;

    vx(1) = x;
    vy(1) = y;

    fprintf('i: %.3d\t x:%.4f\t y:%.4f\t\n', 0, x, y);

    for i = 1:n
        y = y + h * (f(x, y) + 0.5 * h * df1(x, y) + (h^2/6) * df2(x, y) + (h^3/24) * df3(x, y));
        x = a + i * h;

        fprintf('i: %.3d\t x:%.4f\t y:%.4f\t\n', i, x, y);
        vx(i + 1) = x;
        vy(i + 1) = y;
    end

end
