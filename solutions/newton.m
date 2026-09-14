function [root, iter, converged] = newton(f, df, x0, toler, iter_max)
    % Calculate the root of an equation by the Newton method.
    %
    % Args:
    %     f: equation f(x).
    %     df: derivative of equation f(x).
    %     x0: initial guess.
    %     toler: tolerance (stopping criterion).
    %     iter_max: maximum number of iterations (stopping criterion).
    %
    % Returns:
    %     root: root value.
    %     iter: number of iterations used by the method.
    %     converged: flag to indicate if the root was found.

    fx = f(x0);
    dfx = df(x0);
    x = x0;

    fprintf('i = 000,\tx = %+.4f,\tfx = %+.4f\n', x, fx);

    converged = 0;

    for iter = 1:iter_max

        if dfx == 0
            break;
        end

        delta_x = -fx / dfx;
        x = x + delta_x;
        fx = f(x);
        dfx = df(x);

        fprintf('i = %03d,\tx = %+.4f,\tfx = %+.4f,\tdx = %+.4f\n', iter, x, fx, delta_x);

        if abs(delta_x) <= toler && abs(fx) <= toler
            converged = 1;
            break;
        end

    end

    root = x;

    if converged == 0
        warning('Warning: The method did not converge.');
    end

end
