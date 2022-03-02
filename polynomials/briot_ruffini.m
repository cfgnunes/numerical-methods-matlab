function [b, rest] = briot_ruffini(root, a)
    % Divide a polynomial by another polynomial.
    %
    % The format is: P(x) = Q(x) * (x-root) + rest.
    %
    % Args:
    %     a: an array containing the coefficients of the input polynomial.
    %     root: one of the polynomial roots.
    %
    % Returns:
    %     b: an array containing the coefficients of the output polynomial.
    %     rest: polynomial division Rest.

    n = size(a, 2) - 1;
    b = zeros(1, n);

    b(1) = a(1);

    for i = 2:n
        b(i) = b(i - 1) * root + a(i);
    end

    rest = b(n) * root + a(n + 1);
end
