function [root, iter, converged] = pegasus(f, a, b, toler, iter_max)
    % Calculate the root of an equation by the Pegasus method.
    %
    % Args:
    %     f: equation f(x).
    %     a: lower limit.
    %     b: upper limit.
    %     toler: tolerance (stopping criterion).
    %     iter_max: maximum number of iterations (stopping criterion).
    %
    % Returns:
    %     root: root value.
    %     iter: number of iterations used by the method.
    %     converged: flag to indicate if the root was found.

    fa = f(a);
    fb = f(b);

    if fa * fb > 0
        error('Error: The function does not change sign at the ends of the given interval.');
    end

    x = b;
    fx = fb;

    converged = 0;

    for iter = 0:iter_max
        delta_x = -fx / (fb - fa) * (b - a);
        x = x + delta_x;
        fx = f(x);

        fprintf('i = %03d,\tx = %+.4f,\tfx = %+.4f,\tdx = %+.4f\n', iter, x, fx, delta_x);

        if abs(delta_x) <= toler && abs(fx) <= toler
            converged = 1;
            break;
        end

        if fx * fb < 0
            a = b;
            fa = fb;
        else
            fa = fa * fb / (fb + fx);
        end

        b = x;
        fb = fx;
    end

    root = x;

    if converged == 0
        warning('Warning: The method did not converge.');
    end

end
