function [root, iter, converged] = secant(f, a, b, toler, iter_max)
    % Calculate the root of an equation by the Secant method.
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

    if fb - fa == 0
        error('Error: f(b)-f(a) must be nonzero.')
    end

    if b - a == 0
        error('Error: b-a must be nonzero.')
    end

    if abs(fa) < abs(fb)
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

        a = b;
        fa = fb;
        b = x;
        fb = fx;
    end

    root = x;

    if converged == 0
        warning('Warning: The method did not converge.');
    end

end
