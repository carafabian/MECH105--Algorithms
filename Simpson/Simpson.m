function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
m = length(x);
n = length(y);
r = mod(m, 2); % r = 0 that means odd intervals, even points. r = 1 that means even intervals, odd points
a1 = x(1,m) - x(1,1);
a2 = x(1,m-1) - x(1,1);
u = linspace(x(1),x(m),m);
w = isequal(x,u);



if nargin > 2
    error('Too many inputs');
end
if nargin < 2
    error('Not enough inputs');
end
if m ~= n
    error('Vectors are not same length');
end
if r == 0
    warning('Trapezoidal rule will be used for last interval')
end
if w == 0
    error('X is not have uniform spacing');
end

if r ~= 0
    x4 = 0;
    x2 = 0;
    for t = 2:2:m-1 % make the points even again
        x4 = x4 + y(1,t);
    end
    for f = 3:2:m-2 % back to odd
        x2 = x2 + y(1,f);
    end
    simp = a1 * ((y(1,1) + 4*(x4) + 2*(x2) + y(1,m)) / (3 * (m-1)));
    I = simp;
    % the x(1,m) - x(1,1) are your a and b values sorta 
    % y(1,1) is your f(xi)
    % y(1,m) is your f(xm)
else % super duper similar to above but dont include last interval bc thats trap rule now
    x4 = 0;
    x2 = 0;
     warning('Trapezoidal rule will be used for last interval')
    for b = 2:2:m-2 % make the points even again
        x4 = x4 + y(1,b);
    end
    for o = 3:2:m-3 % back to odd
        x2 = x2 + y(1,o);
    end
    if m<=2
    simp = a2 * ((y(1,1) + 4*(x4) + 2*(x2) + y(1,m)) / (3 * (m-1)));
    trap = (x(m) - x(m-1)) * ((y(m) + y(m-1)) / 2);
    I = simp + trap;
    else
    simp = a2 * ((y(1,1) + 4*(x4) + 2*(x2) + y(1,m-1)) / (3 * (m-2)));
    trap = (x(m) - x(m-1)) * ((y(m) + y(m-1)) / 2);
    I = simp + trap;
    end
end

end