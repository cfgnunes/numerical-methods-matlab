function [dy] = derivative_backward_difference(x, y)
    % Calculate the first derivative.
    %
    % Uses a forward difference at the first point and backward differences
    % at the remaining points. Spacing in 'x' need not be uniform.
    %
    % Args:
    %     x: x values.
    %     y: y values.
    %
    % Returns:
    %     dy: the first derivative values.

    x_size = size(x, 2);
    y_size = size(y, 2);

    if x_size < 2 || y_size < 2
        error('Error: "x" and "y" arrays must have 2 values or more.')
    end

    if x_size ~= y_size
        error('Error: "x" and "y" must have same size.')
    end

    dy_difference = @(h, y0, y1) ((y1 - y0) / h);

    n = x_size;
    dy = zeros(1, n);

    for i = 1:n

        if i == 1
            hx = x(i + 1) - x(i);
            dy(i) = dy_difference(hx, y(i), y(i + 1));
        else
            hx = x(i) - x(i - 1);
            dy(i) = dy_difference(hx, y(i - 1), y(i));
        end

    end

end
