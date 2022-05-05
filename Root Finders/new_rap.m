function [xr,ea,iter,et] = new_rap(func,xi,es,maxit)
% This sexxy bit of code is the upgrade of the root_fp. Just like its 
% predacessor it only requires one guess, where as the
% root_ator, the root_ator_rdstr, and the root_inator require 2. This code
% also runs a lot faster, and uses a lot less iterations. However the
% drawback is that it does have performance issues, in the sense that it
% sometimes the function combined with the initial guess can cause the code
% to diverge, however this code comes with a built in divergent scaner and
% will notify you immediatly. But what makes this function so much better
% is that you can feed it raw functions, no processing required.
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
    xr=xi-func(xi)/derive(func,xi,1)
    i=1;
    xi=xr;
    xr=xi-func(xi)/derive(func,xi,1)
    et= -derive(func,xr,2)*(xr-xi)^2/(2*derive(func,xr,1));
    if et>=1
        error("The function you plugged in diverges")
    end
    ea=abs((xr-xi)/xr);
    i=2;
    while es<ea && maxit>i
        i=1+i;
        xi=xr;
        xr=xi-func(xi)/derive(func,xi,1);
        ea=abs((xr-xi)/xr);
        et= -derive(func,xr,2)*(xr-xi)^2/(2*derive(func,xr,1));
    end
    iter=i;
end

