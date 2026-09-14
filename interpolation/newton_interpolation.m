function [y_int] = newton_interpolation(x, y, x_int)
    % Interpolates a value using the 'Newton polynomial'.
    %
    % Args:
    %     x: x values.
    %     y: y values.
    %     x_int: value to interpolate.
    %
    % Returns:
    %     y_int: interpolated value.

    m = size(x, 2);
    del_y = y;

    % Calculate the divided differences
    for k = 1:(m - 1)

        for i = m:-1:(k + 1)
            del_y(i) = (del_y(i) - del_y(i - 1)) / (x(i) - x(i - k));
        end

    end

    % Evaluate the polynomial by Horner's method
    y_int = del_y(m);

    for i = (m - 1):-1:1
        y_int = y_int * (x_int - x(i)) + del_y(i);
    end

end
