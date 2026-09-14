function [y_int] = gregory_newton(x, y, x_int)
    % Interpolates a value using the 'Gregory-Newton polynomial'.
    %
    % Args:
    %     x: an array containing x values.
    %     y: an array containing y values.
    %     x_int: value to interpolate.
    %
    % Returns:
    %     y_int: interpolated value.

    m = size(x, 2);
    del_y = y;

    % Calculate the finite differences
    for k = 1:(m - 1)

        for i = m:-1:(k + 1)
            del_y(i) = del_y(i) - del_y(i - 1);
        end

    end

    % Evaluate the polynomial by Horner's method
    u = (x_int - x(1)) / (x(2) - x(1));
    y_int = del_y(m);

    for i = (m - 1):-1:1
        y_int = y_int * (u - i + 1) / i + del_y(i);
    end

end
