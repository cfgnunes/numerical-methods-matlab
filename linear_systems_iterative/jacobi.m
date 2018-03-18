function [x] = jacobi(a, b, x0, tol, iter_max)
% Jacobi method: solve Ax = b given an initial approximation x0
% Inputs:
%         a: Matrix A from system Ax=b
%         b: Array containing b values
%        x0: Initial approximation of solution
%       tol: Tolerance
%  iter_max: Maximum number of iterations
% Outpus:
%         x: Solution of linear system

    % D and M matrices
    d = diag(diag(a));
    m = a - d;

    k = 1;
    dr(k) = tol + 1;

    % Iterative process
    while (k <= iter_max) && (dr(k) > tol)
        k = k + 1;
        x = d \ (b - m * x0);  % "A\B" is the same as "INV(A)*B"
        dr(k) = norm(x - x0, inf) / norm(x, inf);
        x0 = x;
    end
end