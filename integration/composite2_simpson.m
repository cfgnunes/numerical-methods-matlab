function [xi] = composite2_simpson(x, y)
    % Calculate the integral from 1/3 Simpson's Rule.
    %
    % Args:
    %     x: an array containing x values.
    %     y: an array containing y values.
    %
    % Returns:
    %     xi: integral value.

    x_size = size(x, 2);
    y_size = size(y, 2);

    if y_size ~= y_size
        error('Error: "x" and "y" must have same size.')
    end

    h = x(2) - x(1);
    n = x_size;

    sum_odd = 0;
    sum_even = 0;

    for i = 2:(n - 1)

        if mod(i, 2) == 0
            sum_even = sum_even + y(i);
        else
            sum_odd = sum_odd + y(i);
        end

    end

    xi = h / 3 * (y(1) + 2 * sum_even + 4 * sum_odd + y(n));
end
