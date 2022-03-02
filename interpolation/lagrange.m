function [y_int] = lagrange(x, y, x_int)
    % Interpolates a value using Lagrange polynomial.
    %
    % Args:
    %     x: array containing x values.
    %     y: array containing y values.
    %     x_int: value to interpolate.
    %
    % Returns:
    %     y_int: interpolated value.

    n = size(x, 2);

    y_int = 0;

    for i = 1:n
        p = y(i);

        for j = 1:n

            if i ~= j
                p = p * ((x_int - x(j)) / (x(i) - x(j)));
            end

        end

        y_int = y_int + p;
    end

end
