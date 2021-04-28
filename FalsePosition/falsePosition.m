function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%inputs : func, xl, xu, es, maxit, varargin;
%func = given function, xl = lower bound, xu = upper bound, es = stopping criterium, maxit = largest it can possibly be, varargin = iterations

%check errors
if nargin < 3
    error('Not enough arguments')
end
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test > 0
    error('No sign change')
end

%set defaul for es and maxit
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 200;
end
%introduce start values
iter = 0;
xr = xl;
ea = 100;

while (1)
%takes func and plugs in xl, xu, and xr
iter = iter + 1;
fxl = func(xl, varargin{:});
fxu = func(xu, varargin{:});
fxr = func(xr, varargin{:});
checkxr = fxl * fxr;
    
%new xr
oldxr = xr;
xr = xu - ((fxu * (xl - xu)) / (fxl - fxu));
fxr = func(xr, varargin{:});
if fxr==0
    ea=0
    break
end
%error
if xr ~= 0
    ea = abs((xr - oldxr)/xr) * 100;
end
    
%replace xu or xl
if checkxr > 0
    xl = xr;
elseif checkxr < 0
    xu = xr;
else 
    ea = 0;
end
if ea <= es || iter >= maxit
    break
end
end

root = xr;
fx = func(xr, varargin{:});

end

