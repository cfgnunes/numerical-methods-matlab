function [f] = newton_divided_difference(x, y)
    % Find the coefficients of Newton's divided difference.
    %
    % Also, find Newton's polynomial.
    %
    % Args:
    %     x: x values.
    %     y: y values.
    %
    % Returns:
    %     f: Newton's divided difference coefficients.

    n = size(x, 2);
    q = zeros(n, n - 1);

    % Insert 'y' in the first column of the matrix 'q'
    q = [y' q];

    for i = 2:n

        for j = 2:i
            q(i, j) = (q(i, j - 1) - q(i - 1, j - 1)) / (x(i) - x(i - j + 1));
        end

    end

    % Copy the diagonal values of the matrix q to the vector f
    f = zeros(1, n);

    for i = 1:n
        f(i) = q(i, i);
    end

    % Prints the polynomial
    disp('The polynomial is:')
    fprintf('p(x)=%+.3f', f(1));

    for i = 2:n
        fprintf('%+.3f', f(i));

        for j = 2:i
            fprintf('(x%+.3f)', x(j - 1) * -1);
        end

    end

    fprintf('\n');

end
