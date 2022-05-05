function [xr,ea,iter] = root_fp(func,xi,es,maxit)
% This sexxy bit of code, only requires one guess, where as the
% root_ator, the root_ator_rdstr, and the root_inator require 2. This code
% also runs a lot faster, and uses a lot less iterations. However the
% drawback is that it does have performance issues, in the sense that it
% sometimes the function combined with the initial guess can cause the code
% to diverge, however this code comes with a built in divergent scaner and
% will notify you immediatly. Also you have to process the function you
% input, with this I mean that you have to algebraically alter it from the
% original function.
    if nargin<4
        maxit=100000;
        if nargin<3
            es=0.000001;
        end
    end
    if maxit < 2
        error("This function requires at least two iterations")
    end
    xi_og=xi;
    xr=func(xi);
    i=1;
    xi=xr;
    xr=func(xi);
    gp=abs((xr-xi)/(xi-xi_og));
    if gp>=1
        error("The function you plugged in diverges")
    end
    ea=abs((xr-xi)/xr);
    i=2;
    while es<ea && maxit>i
        i=1+i;
        xi=xr;
        xr=func(xi);
        ea=abs((xr-xi)/xr);
    end
    iter=i;
end

