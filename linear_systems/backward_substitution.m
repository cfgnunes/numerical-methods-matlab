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

    for i = n:-1:1
        if (u(i, i) == 0)
            error('Error: Matrix "u" is singular.')
        end

        x(i) = d(i) / u(i, i);
        d(1:i - 1) = d(1:i - 1) - u(1:i - 1, i) * x(i);
    end
end
