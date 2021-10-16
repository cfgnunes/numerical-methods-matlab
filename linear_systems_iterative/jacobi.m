function [x, iter] = jacobi(a, b, x0, tol, iter_max)
% Jacobi method: solve Ax = b given an initial approximation x0
% Inputs:
%         a: Matrix A from system Ax=b
%         b: Array containing b values
%        x0: Initial approximation of solution
%       tol: Tolerance
%  iter_max: Maximum number of iterations
% Outpus:
%         x: Solution of linear system
%      iter: Used iterations

    % D and M matrices
    d = diag(diag(a));
    m = a - d;

    % Iterative process
    for iter = 1:iter_max
        x = d \ (b - m * x0);  % "A\B" is the same as "INV(A)*B"

        if norm(x - x0, inf) / norm(x, inf) <= tol
            break;
        end
        x0 = x;
    end
end
