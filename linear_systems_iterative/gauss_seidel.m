function [x, iter] = gauss_seidel(a, b, x0, tol, iter_max)
    % Gauss-Seidel method: solve Ax = b given an initial approximation x0.
    %
    % Args:
    %     a: matrix A from system Ax=b.
    %     b: an array containing b values.
    %     x0: initial approximation of the solution.
    %     tol: tolerance.
    %     iter_max: maximum number of iterations.
    %
    % Returns:
    %     x: solution of linear the system.
    %     iter: used iterations.

    % L and U matrices
    l = tril(a);
    u = a - l;

    % Iterative process
    for iter = 1:iter_max
        x = l \ (b - u * x0); % "A\B" is the same as "INV(A)*B"

        if norm(x - x0, inf) / norm(x, inf) <= tol
            break;
        end

        x0 = x;
    end

end
