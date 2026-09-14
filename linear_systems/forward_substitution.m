function [x] = forward_substitution(l, c)
    % Solve the lower linear system lx=c.
    %
    % Args:
    %     l: lower triangular matrix.
    %     c: c values.
    %
    % Returns:
    %     x: solution of the linear system.

    [n, m] = size(l);
    b = double(c);

    if n ~= m
        error('Error: "l" must be a square matrix.')
    end

    x = zeros(1, n);

    for i = 1:n

        if l(i, i) == 0
            error('Error: "l" is a singular matrix.')
        end

        x(i) = b(i) / l(i, i);
        b(i + 1:n) = b(i + 1:n) - l(i + 1:n, i) * x(i);
    end

end
