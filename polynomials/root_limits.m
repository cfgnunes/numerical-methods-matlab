function [lim] = root_limits(c)
    % Find the limits of the real roots of a polynomial equation.
    %
    % Using Lagrange's Theorem, whose proof is given by Demidovich and Maron.
    %
    % Args:
    %     c: polynomial coefficients.
    %
    % Returns:
    %     lim: lower and upper limits of positive and
    %         negative roots, respectively.

    lim = zeros(1, 4);
    n = size(c, 2) - 1;
    c = [c, 0];

    if c(1) == 0
        error('Error: The first coefficient is null.')
    end

    t = n + 1;
    c(t + 1) = 0;

    % If c(t) is null, then the polynomial is deflated.
    while true

        if c(t) ~= 0
            break;
        end

        t = t - 1;
    end

    % Compute the four limits of real roots.
    for i = 1:4

        if i == 2 || i == 4
            % Inversion of the order of the coefficients.
            for j = 1:floor(t / 2)
                temp = c(j);
                c(j) = c(t - j + 1);
                c(t - j + 1) = temp;
            end

        else

            if i == 3
                % Reinversion of the order and exchange
                % of signs of the coefficients.
                for j = 1:floor(t / 2)
                    temp = c(j);
                    c(j) = c(t - j + 1);
                    c(t - j + 1) = temp;
                end

                for j = (t - 1):-2:1
                    c(j) = -c(j);
                end

            end

        end

        % If c(1) is negative, then all coefficients are negated.
        if c(1) < 0

            for j = 1:t
                c(j) = -c(j);
            end

        end

        % Calculation of 'k', the largest index of the negative coefficients.
        k = 2;

        while true

            if c(k) < 0 || k > t
                break;
            end

            k = k + 1;
        end

        % Calculation of 'b', the largest negative coefficient in modulus.
        if k <= t
            b = 0;

            for j = 2:t

                if c(j) < 0 && abs(c(j)) > b
                    b = abs(c(j));
                end

            end

            % Limit of positive roots of 'P(x) = 0' and auxiliary equations.
            lim(i) = 1 + (b / c(1))^(1 / (k - 1));
        else
            lim(i) = 10^100;
        end

    end

    % Limit of positive and negative roots of 'P(x) = 0'.
    lim = [1 / lim(2), lim(1), -lim(3), -1 / lim(4)];
end
