function [x] = forward_substitution(lower, c)
    % Solve the lower linear system lx=c.
    %
    % Args:
    %     lower: lower triangular matrix.
    %     c: c values.
    %
    % Returns:
    %     x: solution of the linear system.

    [n, m] = size(lower);
    b = double(c);

    if n ~= m
        error("'Error: 'lower' must be a square matrix.")
    end

    x = zeros(1, n);

    for i = 1:n

        if lower(i, i) == 0
            error("'Error: 'lower' is a singular matrix.")
        end

        x(i) = b(i) / lower(i, i);
        b(i + 1:n) = b(i + 1:n) - lower(i + 1:n, i) * x(i);
    end

end
