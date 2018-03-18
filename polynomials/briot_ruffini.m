function [b, rest] = briot_ruffini(root, a)
% Divides a polynomial by another polynomial in the format (x-root)
% P(x) = Q(x) * (x-root) + rest
% Inputs:
%         a: Array containing the coefficients of the input polynomial
%      root: One of the polynomial roots
% Outpus:
%         b: Array containing the coefficients of the output polynomial
%      rest: Polynomial division Rest

    n = size(a, 2) - 1;
    b = zeros(1, n);

    b(1) = a(1);

    for i = 2:n
        b(i) = b(i - 1) * root + a(i);
    end

    rest = b(n) * root + a(n + 1);
end
