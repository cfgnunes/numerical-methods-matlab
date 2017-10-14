function [xi] = composite_trapezoidal(f, b, a, n)
% Calculate the integral from Trapezoidal Rule
% Inputs:
%         f: Function f(x)
%         a: Initial point
%         b: End point
%         n: Number of intervals
% Outputs:
%        xi: Integral value

    h = (b-a)/n;

    sum_x = 0;

    for i=1:(n-1)
        x = a + i*h
        sum_x = sum_x + f(x);
    end

    xi = h/2 * (f(a) + 2*sum_x + f(b));
end
