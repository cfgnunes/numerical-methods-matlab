function [limit, iter, converged] = limit_epsilon_delta(f, x, toler, iter_max)
    % Calculate a limit using the epsilon-delta definition.
    %
    % Args:
    %     f: equation f(x).
    %     x: the value the independent variable is approaching.
    %     toler: tolerance (stopping criterion).
    %     iter_max: maximum number of iterations (stopping criterion).
    %
    % Returns:
    %     limit: the limit value.
    %     iter: number of iterations used by the method.
    %     converged: flag to indicate if the limit was found.

    delta = 0.1;
    limit_low_prev = -Inf;
    limit_up_prev = Inf;

    converged = 0;

    for iter = 0:iter_max
        delta = delta / (iter + 1);
        limit_low = f(x - delta);
        limit_up = f(x + delta);

        if abs(limit_low - limit_low_prev) <= toler && ...
                abs(limit_up - limit_up_prev) <= toler && ...
                abs(limit_up - limit_low) <= toler
            converged = 1;
            break;
        end

        limit_up_prev = limit_up;
        limit_low_prev = limit_low;
    end

    if abs(limit_up - limit_low) > 10 * toler
        error('Error: Two sided limit does not exist.')
    end

    limit = limit_low;
end
