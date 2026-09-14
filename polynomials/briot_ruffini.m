function [b, rest] = briot_ruffini(a, root)
    % Divide a polynomial by the linear factor (x - root).
    %
    % The format is: P(x) = Q(x) * (x-root) + rest.
    %
    % Args:
    %     a: the coefficients of the input polynomial.
    %     root: root of the linear divisor (x - root).
    %
    % Returns:
    %     b: the coefficients of the output polynomial.
    %     rest: remainder of the polynomial division.

    n = size(a, 2) - 1;
    b = zeros(1, n);

    b(1) = a(1);

    for i = 2:n
        b(i) = b(i - 1) * root + a(i);
    end

    rest = b(n) * root + a(n + 1);
end
