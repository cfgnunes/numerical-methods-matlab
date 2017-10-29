function [x] = forward_substitution(l, c)
% Solve the lower linear system lx=c
% Inputs:
%         l: Lower triangular matrix
%         c: Array containing c values
% Outputs:
%         x: Solution of linear system

    [n, m] = size(u);

    if n ~= m
        error('Error: "l" must be a square matrix.')
    end

    x = zeros(1, n);

    x(1) = c(1) / l(1, 1);
    for i = 2:n
        sum_x = 0;
        for j = 1:(i-1)
            sum_x = sum_x + l(i, j) * x(j);
        end
        x(i) = (c(i) - sum_x) / l(i, i);
    end
end
