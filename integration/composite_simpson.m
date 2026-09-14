function [xi] = composite_simpson(f, a, b, n)
    % Calculate the integral using 1/3 Simpson's Rule.
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

    sum_odd = 0;
    sum_even = 0;

    for i = 1:(n - 1)
        x = a + i * h;

        if mod(i, 2) == 0
            sum_even = sum_even + f(x);
        else
            sum_odd = sum_odd + f(x);
        end

    end

    xi = h / 3 * (f(a) + 2 * sum_even + 4 * sum_odd + f(b));
end
