function [xi] = composite2_trapezoidal(x, y)
    % Calculate the integral using the Trapezoidal Rule.
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

    sum_x = 0;

    for i = 2:(n - 1)
        sum_x = sum_x + y(i);
    end

    xi = h / 2 * (y(1) + 2 * sum_x + y(n));
end
