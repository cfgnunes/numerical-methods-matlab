function [dy] = derivative_five_point(x, y)
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

    if x_size < 6 || y_size < 6
        error('Error: "x" and "y" arrays must have 6 values or more.')
    end

    if y_size ~= y_size
        error('Error: "x" and "y" must have same size.')
    end

    dy_mid = @(h, y0, y1, y3, y4) ((1 / (12 * h)) * (y0 - 8 * y1 + 8 * y3 - y4));
    dy_end = @(h, y0, y1, y2, y3, y4) ((1 / (12 * h)) * (- 25 * y0 + 48 * y1 - 36 * y2 + 16 * y3 - 3 * y4));

    h = x(2) - x(1);
    n = x_size;
    dy = zeros(1, n);

    for i = 1:n

        if i == 1 || i == 2
            dy(i) = dy_end(h, y(i), y(i + 1), y(i + 2), y(i + 3), y(i + 4));
        elseif i == n || i == n - 1
            dy(i) = dy_end(- h, y(i), y(i - 1), y(i - 2), y(i - 3), y(i - 4));
        else
            dy(i) = dy_mid(h, y(i - 2), y(i - 1), y(i + 1), y(i + 2));
        end

    end

end
