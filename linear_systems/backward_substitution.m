function [x] = backward_substitution(u, d)
% Solve the upper linear system ux=d
% Inputs:
%         u: Upper triangular matrix
%         d: Array containing d values
% Outputs:
%         x: Solution of linear system

    [n, m] = size(u);

    if n ~= m
        error('Error: "u" must be a square matrix.')
    end

    x = zeros(1, n);

    x(n) = d(n) / u(n, n);
    for i = (n-1):-1:1
        sum_x = 0;
        for j = (i+1):n
            sum_x = sum_x + u(i, j) * x(j);
        end
        x(i) = (d(i) - sum_x) / u(i, i);
    end
end
