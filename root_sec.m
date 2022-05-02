function [xr,ea,iter,f] = root_sec(func,xi,x1,maxit,h)
% This sexxy bit of code is the upgrade of the root_fp. Just like its 
% predacessor it only requires one guess, where as the
% root_ator, the root_ator_rdstr, and the root_inator require 2. This code
% also runs a lot faster, and uses a lot less iterations. However the
% drawback is that it does have performance issues, in the sense that it
% sometimes the function combined with the initial guess can cause the code
% to diverge, however this code comes with a built in divergent scaner and
% will notify you immediatly. But what makes this function so much better
% is that you can feed it raw functions, no processing required.
    es=0.0001;
    if nargin<5
            
        
            if nargin<4
                maxit=100000;
            end
                
                
        
        if maxit < 2
            error("This function requires at least two iterations")
        end
        xi_og=xi;
        xr=x1-func(x1)*(xi-x1)/(func(xi)-func(x1));
        i=1;
        f=func(xr)
        if nargin==7
            Et=(rxr-xr)/rxr
        else
            Et="phone home because there is no Et"
        end
        ea=abs((xr-xi)/xr)
        
        while es<ea && maxit>i
            i=1+i;
            xi=x1;
            x1=xr;
            xr=x1-func(x1)*(xi-x1)/(func(xi)-func(x1));
            f=func(xr);
            ea=abs((xr-xi)/xr);
            if nargin==7
                Et=(rxr-xr)/rxr
            end
        end
        
    elseif nargin == 5
        if maxit < 2
            error("This function requires at least two iterations")
        end
        xi_og=xi;
        xr=xi-h*xi*func(xi)/(func(xi+h*xi)-func(xi))
        i=1;
        f=func(xr)
        
        ea=abs((xr-xi)/xr)
        
        while es<ea && maxit>i
            i=1+i;
            xi=xr;
            xr=xi-h*xi*func(xi)/(func(xi+h*xi)-func(xi));
            f=func(xr);
            ea=abs((xr-xi)/xr);
            
        end
    end
    iter=i;
end

