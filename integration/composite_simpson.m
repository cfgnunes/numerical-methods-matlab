function [xi] = composite_simpson(f, b, a, n)
% Calculate the integral from 1/3 Simpson's Rule
% Inputs:
%         f: Function f(x)
%         a: Initial point
%         b: End point
%         n: Number of intervals
% Outputs:
%        xi: Integral value

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
