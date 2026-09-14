function [x] = backward_substitution(u, d)
    % Solve the upper linear system ux=d.
    %
    % Args:
    %     u: upper triangular matrix.
    %     d: d values.
    %
    % Returns:
    %     x: solution of the linear system.

    [n, m] = size(u);
    b = double(d);

    if n ~= m
        error('Error: "u" must be a square matrix.')
    end

    x = zeros(1, n);

    for i = n:-1:1

        if u(i, i) == 0
            error('Error: "u" is a singular matrix.')
        end

        x(i) = b(i) / u(i, i);
        b(1:i - 1) = b(1:i - 1) - u(1:i - 1, i) * x(i);
    end

end
