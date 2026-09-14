function [x, iter] = gauss_seidel(a, b, x0, toler, iter_max)
    % Gauss-Seidel method: solve Ax = b given an initial approximation x0.
    %
    % Args:
    %     a: matrix A from system Ax=b.
    %     b: b values.
    %     x0: initial approximation of the solution.
    %     toler: tolerance (stopping criterion).
    %     iter_max: maximum number of iterations (stopping criterion).
    %
    % Returns:
    %     x: solution of the linear system.
    %     iter: number of iterations used by the method.

    % L and U matrices
    l = tril(a);
    u = a - l;

    % Iterative process
    x = [];

    for iter = 1:iter_max
        x = l \ (b - u * x0);

        if norm(x - x0, inf) / norm(x, inf) <= toler
            break;
        end

        x0 = x;
    end

end
