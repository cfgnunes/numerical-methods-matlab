function [vx, vy] = euler(f, a, b, n, ya)
    % Calculate the solution of the initial-value problem (IVP).
    %
    % Solve the IVP from the Euler method.
    %
    % Args:
    %     f: function f(x).
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
