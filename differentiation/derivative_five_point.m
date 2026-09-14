function [dy] = derivative_five_point(x, y)
    % Calculate the first derivative.
    %
    % All values in 'x' must be equally spaced.
    %
    % Args:
    %     x: x values.
    %     y: y values.
    %
    % Returns:
    %     dy: the first derivative values.

    x_size = size(x, 2);
    y_size = size(y, 2);

    if x_size < 5 || y_size < 5
        error('Error: "x" and "y" arrays must have 5 values or more.')
    end

    if x_size ~= y_size
        error('Error: "x" and "y" must have same size.')
    end

    dy_mid = @(h, y0, y1, y3, y4) ((1 / (12 * h)) * (y0 - 8 * y1 + 8 * y3 - y4));
    dy_end = @(h, y0, y1, y2, y3, y4) ((1 / (12 * h)) * ...
        (-25 * y0 + 48 * y1 - 36 * y2 + 16 * y3 - 3 * y4));
    dy_near = @(h, y0, y1, y2, y3, y4) ((1 / (12 * h)) * ...
        (-3 * y0 - 10 * y1 + 18 * y2 - 6 * y3 + y4));

    hx = x(2) - x(1);
    n = x_size;
    dy = zeros(1, n);

    for i = 1:n

        if i == 1
            dy(i) = dy_end(hx, y(i), y(i + 1), y(i + 2), y(i + 3), y(i + 4));
        elseif i == 2
            dy(i) = dy_near(hx, y(i - 1), y(i), y(i + 1), y(i + 2), y(i + 3));
        elseif i == n
            dy(i) = dy_end(-hx, y(i), y(i - 1), y(i - 2), y(i - 3), y(i - 4));
        elseif i == n - 1
            dy(i) = dy_near(-hx, y(i + 1), y(i), y(i - 1), y(i - 2), y(i - 3));
        else
            dy(i) = dy_mid(hx, y(i - 2), y(i - 1), y(i + 1), y(i + 2));
        end

    end

end
