function [x] = backward_substitution(upper, d)
    % Solve the upper linear system ux=d.
    %
    % Args:
    %     upper: upper triangular matrix.
    %     d: d values.
    %
    % Returns:
    %     x: solution of the linear system.

    [n, m] = size(upper);
    b = double(d);

    if n ~= m
        error("Error: 'upper' must be a square matrix.")
    end

    x = zeros(1, n);

    for i = n:-1:1

        if upper(i, i) == 0
            error("Error: 'upper' is a singular matrix.")
        end

        x(i) = b(i) / upper(i, i);
        b(1:i - 1) = b(1:i - 1) - upper(1:i - 1, i) * x(i);
    end

end
