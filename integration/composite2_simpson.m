function [xi] = composite2_simpson(x, y)
    % Calculate the integral using 1/3 Simpson's Rule.
    %
    % Args:
    %     x: x values.
    %     y: y values.
    %
    % Returns:
    %     xi: numerical approximation of the definite integral.

    x_size = size(x, 2);
    y_size = size(y, 2);

    if x_size ~= y_size
        error('Error: "x" and "y" must have same size.')
    end

    h = x(2) - x(1);
    n = x_size;

    sum_odd = 0;
    sum_even = 0;

    for i = 2:(n - 1)

        if mod(i - 1, 2) == 0
            sum_even = sum_even + y(i);
        else
            sum_odd = sum_odd + y(i);
        end

    end

    xi = h / 3 * (y(1) + 2 * sum_even + 4 * sum_odd + y(n));
end
