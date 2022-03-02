function [dy] = derivative_backward_difference(x, y)
    % Calculate the first derivative.
    %
    % All values in 'x' must be equally spaced.
    %
    % Args:
    %     x: an array containing x values.
    %     y: an array containing y values.
    %
    % Returns:
    %     dy: an array containing the first derivative values.

    x_size = size(x, 2);
    y_size = size(y, 2);

    if x_size < 2 || y_size < 2
        error('Error: "x" and "y" arrays must have 2 values or more.')
    end

    if y_size ~= y_size
        error('Error: "x" and "y" must have same size.')
    end

    dy_difference = @(h, y0, y1) ((y1 - y0) / h);

    n = x_size;
    dy = zeros(1, n);

    for i = 1:n

        if i == n
            h = x(i) - x(i - 1);
            dy(i) = dy_difference(- h, y(i), y(i - 1));
        else
            h = x(i + 1) - x(i);
            dy(i) = dy_difference(h, y(i), y(i + 1));
        end

    end

end
