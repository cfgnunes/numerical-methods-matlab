function [root, iter, converged] = secant(f, a, b, tol, iter_max)
    % Calculate the root of an equation by the Secant method.
    %
    % Args:
    %     f: function f(x).
    %     a: lower limit.
    %     b: upper limit.
    %     tol: tolerance.
    %     iter_max: maximum number of iterations.
    %
    % Returns:
    %     root: root value.
    %     iter: used iterations.
    %     converged: found the root.

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

    for iter = 0:iter_max
        deltaX = -fx / (fb - fa) * (b - a);
        x = x + deltaX;
        fx = f(x);
        fprintf('iter: %.3d\t a: %.4f\t fa: %.4f\t b: %.4f\t fb: %.4f\t x: %.4f\t fx: %.4f\t deltaX: %.4f\n', iter, a, fa, b, fb, x, fx, deltaX);

        if abs(deltaX) <= tol && abs(fx) <= tol
            break;
        end

        a = b;
        fa = fb;
        b = x;
        fb = fx;
    end

    root = x;

    if abs(deltaX) <= tol && abs(fx) <= tol
        converged = 1;
    else
        warning('Warning: The method did not converge.');
        converged = 0;
    end

end
