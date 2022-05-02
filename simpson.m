function [I] = simpson(x,y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
    n=length(x);
    m=length(y);
    h=(x(n)-x(1))/(n-1);
    if m ~= n
        error('the lenght of x should equal the length of y')
    end
    xc=linspace(x(1),x(n),n);
    for k=2:n
        delta=x(k)-x(k-1);
        if delta ~= h
            disp(delta)
            disp(h)
            error('x vector was not equally spaced')
            
        end
    end
    if xc ~= x
        error('x vector was not equally spaced')
    end
    if n > 2
%        warning('simpsons 1/3 rule is being employed')
   
        G=0;
        K=0;
        for i = 2:2:n-1
            G=G+y(i);
        end
        for j = 3:2:n-2
            K=K+y(j);
        end
        I=h*(y(1)+4*G+2*K+y(n))/(3);
    else
        warnMsgSent=warning('trapezoidal rule is being employed');
        I=trapz(x,y);
    end
end
