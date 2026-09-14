function [root, iter, converged] = bisection(f, a, b, toler, iter_max)
    % Calculate the root of an equation by the Bisection method.
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

    delta_x = abs(b - a) / 2;

    x = 0;
    converged = 0;

    for iter = 0:iter_max
        x = (a + b) / 2;
        fx = f(x);

        fprintf('i = %03d,\tx = %+.4f,\tfx = %+.4f,\tdx = %+.4f\n', iter, x, fx, delta_x);

        if delta_x <= toler && abs(fx) <= toler
            converged = 1;
            break;
        end

        if fa * fx > 0
            a = x;
            fa = fx;
        else
            b = x;
        end

        delta_x = delta_x / 2;
    end

    root = x;

    if converged == 0
        warning('Warning: The method did not converge.');
    end

end
