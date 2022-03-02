function [a] = gauss_elimination_pp(a, b)
    % Gaussian Elimination with Partial Pivoting.
    %
    % Calculate the upper triangular matrix from linear system Ax=b (make a row
    % reduction).
    %
    % Args:
    %     a: matrix A from system Ax=b.
    %     b: an array containing b values.
    %
    % Returns:
    %     a: augmented upper triangular matrix.

    [n, m] = size(a);

    if n ~= m
        error('Error: "a" must be a square matrix.')
    end

    a = [a, b]; % Produces the augmented matrix

    % Elimination process starts
    for i = 1:(n - 1)
        p = i;

        % Comparison to select the pivot
        for j = (i + 1):n

            if abs(a(j, i)) > abs(a(i, i))
                % Swap rows
                a([i j], :) = a([j i], :);
            end

        end

        % Checking for nullity of the pivots
        while p <= n && a(p, i) == 0
            p = p + 1;
        end

        if p == n + 1
            warning('Info: No unique solution.');
        else

            if p ~= i
                % Swap rows
                a([i p], :) = a([p i], :);
            end

        end

        for j = (i + 1):n
            a(j, :) = a(j, :) - a(i, :) * (a(j, i) / a(i, i));
        end

    end

    % Checking for nonzero of last entry
    if a(n, n) == 0
        warning('Info: No unique solution.');
    end

end
