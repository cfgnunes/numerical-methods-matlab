function [root, iter, converged] = newton(f, df, x0, tol, iter_max)
    % Calculate the root of an equation by the Newton method.
    %
    % Args:
    %     f: function f(x).
    %     df: derivative of function f(x).
    %     x0: initial guess.
    %     tol: tolerance.
    %     iter_max: maximum number of iterations.
    %
    % Returns:
    %     root: root value.
    %     iter: used iterations.
    %     converged: found the root.

    x = x0;
    fx = f(x);
    dfx = df(x);

    iter = 0;
    fprintf('iter: %.3d\t x: %.4f\t dfx: %.4f\t fx: %.4f\n', iter, x, dfx, fx);

    for iter = 1:iter_max
        deltaX = -fx / dfx;
        x = x + deltaX;
        fx = f(x);
        dfx = df(x);

        fprintf('iter: %.3d\t x: %.4f\t dfx: %.4f\t fx: %.4f\t deltaX: %.4f\n', iter, x, dfx, fx, deltaX);

        if (abs(deltaX) <= tol && abs(fx) <= tol) || dfx == 0
            break;
        end

    end

    root = x;

    if abs(deltaX) <= tol && abs(fx) <= tol
        converged = 1;
    else
        warning('Warning: The method did not converge.');
        converged = 0;
    end

end
