function [x] = forward_substitution(l, c)
    % Solve the lower linear system lx=c.
    %
    % Args:
    %     lower: lower triangular matrix.
    %     c: an array containing c values.
    %
    % Returns:
    %     x: solution of linear the system.

    [n, m] = size(l);

    if n ~= m
        error('Error: "l" must be a square matrix.')
    end

    x = zeros(1, n);

    for i = 1:n

        if (l(i, i) == 0)
            error('Error: Matrix "l" is singular.')
        end

        x(i) = c(i) / l(i, i);
        c(i + 1:n) = c(i + 1:n) - l(i + 1:n, i) * x(i);
    end

end
