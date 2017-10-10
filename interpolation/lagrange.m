function [y_int] = lagrange(x, y, x_int)
% Interpolates a value using Lagrange polynomial
% Inputs:
%         x: X values
%         y: Y values
%     x_int: Value to interpolate
% Outputs:
%     y_int: Interpolated value

    n = size(x, 2);

    y_int=0;
    for i=1:n
        p=y(i);
        for j=1:n
            if i~=j
                p = p * ((x_int-x(j))/(x(i)-x(j)));
            end
        end
        y_int = y_int + p;
    end
end
