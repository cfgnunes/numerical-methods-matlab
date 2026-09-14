function [xi] = composite_trapezoidal(f, a, b, n)
    % Calculate the integral using the Trapezoidal Rule.
    %
    % Args:
    %     f: the equation f(x).
    %     a: the initial point.
    %     b: the final point.
    %     n: number of intervals.
    %
    % Returns:
    %     xi: numerical approximation of the definite integral.

    h = (b - a) / n;

    sum_x = 0;

    for i = 1:(n - 1)
        x = a + i * h;
        sum_x = sum_x + f(x);
    end

    xi = h / 2 * (f(a) + 2 * sum_x + f(b));
end
