function [xi] = composite2_trapezoidal(x, y)
% Calculate the integral from Trapezoidal Rule
% Inputs:
%         x: Array containing x values
%         y: Array containing y values
% Outputs:
%        xi: Integral value

    x_size = size(x, 2);
    y_size = size(y, 2);

    if y_size ~= y_size
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
