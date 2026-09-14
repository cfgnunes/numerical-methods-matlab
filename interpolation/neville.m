function [y_int, q] = neville(x, y, x_int)
    % Interpolates a value using the 'Neville polynomial'.
    %
    % Args:
    %     x: x values.
    %     y: y values.
    %     x_int: value to interpolate.
    %
    % Returns:
    %     y_int: interpolated value.
    %     q: coefficients matrix.

    n = size(x, 2);
    q = zeros(n, n - 1);

    % Insert 'y' in the first column of the matrix 'q'
    q = [y' q];

    for i = 2:n

        for j = 2:i
            q(i, j) = ((x_int - x(i - j + 1)) * q(i, j - 1) - ...
                (x_int - x(i)) * q(i - 1, j - 1)) / (x(i) - x(i - j + 1));
        end

    end

    y_int = q(n, n);
end
