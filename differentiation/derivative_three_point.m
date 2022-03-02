function [dy] = derivative_three_point(x, y)
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

    if x_size < 3 || y_size < 3
        error('Error: "x" and "y" arrays must have 3 values or more.')
    end

    if y_size ~= y_size
        error('Error: "x" and "y" must have same size.')
    end

    dy_mid = @(h, y0, y2) ((1 / (2 * h)) * (y2 - y0));
    dy_end = @(h, y0, y1, y2) ((1 / (2 * h)) * (- 3 * y0 + 4 * y1 - y2));

    h = x(2) - x(1);
    n = x_size;
    dy = zeros(1, n);

    for i = 1:n

        if i == 1
            dy(i) = dy_end(h, y(i), y(i + 1), y(i + 2));
        elseif i == n
            dy(i) = dy_end(- h, y(i), y(i - 1), y(i - 2));
        else
            dy(i) = dy_mid(h, y(i - 1), y(i + 1));
        end

    end

end
