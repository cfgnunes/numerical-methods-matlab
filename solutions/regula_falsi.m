function [root, iter, converged] = regula_falsi(f, a, b, toler, iter_max)
    % Calculate the root of an equation by the Regula Falsi method.
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

    if fa > 0
        t = a;
        a = b;
        b = t;
        t = fa;
        fa = fb;
        fb = t;
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

        if fx < 0
            a = x;
            fa = fx;
        else
            b = x;
            fb = fx;
        end

    end

    root = x;

    if converged == 0
        warning('Warning: The method did not converge.');
    end

end
