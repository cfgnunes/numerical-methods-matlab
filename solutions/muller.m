function [root, iter, converged] = muller(f, a, c, toler, iter_max)
    % Calculate the root of an equation by the Muller method.
    %
    % Args:
    %     f: equation f(x).
    %     a: lower limit.
    %     c: upper limit.
    %     toler: tolerance (stopping criterion).
    %     iter_max: maximum number of iterations (stopping criterion).
    %
    % Returns:
    %     root: root value.
    %     iter: number of iterations used by the method.
    %     converged: flag to indicate if the root was found.

    b = (a + c) / 2;
    fa = f(a);
    fb = f(b);
    fc = f(c);
    x = b;
    fx = fb;
    delta_x = c - a;

    converged = 0;

    for iter = 0:iter_max
        h1 = c - b;
        h2 = b - a;
        r = h1 / h2;
        t = x;

        aa = (fc - (r + 1) * fb + r * fa) / (h1 * (h1 + h2));
        bb = (fc - fb) / h1 - aa * h1;
        cc = fb;

        signal_bb = sign(bb);

        if signal_bb == 0
            signal_bb = 1;
        end

        z = (-bb + signal_bb * sqrt(bb^2 - 4 * aa * cc)) / (2 * aa);
        x = b + z;

        delta_x = x - t;
        fx = f(x);

        fprintf('i = %03d,\tx = %+.4f,\tfx = %+.4f,\tdx = %+.4f\n', iter, x, fx, delta_x);

        if abs(delta_x) <= toler && abs(fx) <= toler
            converged = 1;
            break;
        end

        if x > b
            a = b;
            fa = fb;
        else
            c = b;
            fc = fb;
        end

        b = x;
        fb = fx;
    end

    root = x;

    if converged == 0
        warning('Warning: The method did not converge.');
    end

end
