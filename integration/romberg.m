function [xi] = romberg(f, a, b, n)
    % Calculate the integral using the Romberg method.
    %
    % Args:
    %     f: the equation f(x).
    %     a: the initial point.
    %     b: the final point.
    %     n: number of intervals.
    %
    % Returns:
    %     xi: numerical approximation of the definite integral.

    % Initialize the Romberg integration table
    r = zeros(n, n);

    % Compute the trapezoid rule for the first column (h = b - a)
    h = b - a;
    r(1, 1) = 0.5 * h * (f(a) + f(b));

    % Iterate for each level of refinement
    for i = 2:n
        h = 0.5 * h; % Halve the step size
        % Compute the composite trapezoid rule
        sum_f = 0;

        for j = 1:2:(2^(i - 1) - 1)
            x = a + j * h;
            sum_f = sum_f + f(x);
        end

        r(i, 1) = 0.5 * r(i - 1, 1) + h * sum_f;

        % Richardson extrapolation for higher order approximations
        for k = 2:i
            r(i, k) = r(i, k - 1) + ...
                (r(i, k - 1) - r(i - 1, k - 1)) / (4^(k - 1) - 1);
        end

    end

    xi = r(n, n);
end
