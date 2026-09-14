function [vx, vy] = taylor2(f, df1, a, b, n, ya)
    % Calculate the solution of the initial-value problem (IVP).
    %
    % Solve the IVP from the Taylor (Order Two) method.
    %
    % Args:
    %     f: equation f(x, y).
    %     df1: first derivative of equation f(x, y).
    %     a: the initial point.
    %     b: the final point.
    %     n: number of intervals.
    %     ya: initial value.
    %
    % Returns:
    %     vx: x values.
    %     vy: y values (solution of IVP).

    vx = zeros(1, n + 1);
    vy = zeros(1, n + 1);

    h = (b - a) / n;
    x = a;
    y = ya;

    vx(1) = x;
    vy(1) = y;

    fprintf('i = 000,\tx = %+.4f,\ty = %+.4f\n', x, y);

    for i = 1:n
        y = y + h * (f(x, y) + 0.5 * h * df1(x, y));
        x = a + i * h;

        fprintf('i = %03d,\tx = %+.4f,\ty = %+.4f\n', i, x, y);
        vx(i + 1) = x;
        vy(i + 1) = y;
    end

end
