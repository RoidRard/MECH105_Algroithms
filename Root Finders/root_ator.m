function [xr,fx,ea,iter] = root_ator(func,xl,xu,es,maxit)
%locates the root of a function
%   This function locates the root of a function(func) to a certain percent
%   error(Ea) within the error limit(Es), within a set domain set by the xl
%   and xu. The number of itterations can also be set by maxit. 

%   This first part is set to make sure that the inputs are of sound logic.
    if func(xl)*func(xu)>= 0
        if func(xl)== 0
            xr=xl
        elseif func(xu)==0
            xr=xu
        end
        error("doesn't bracket")
    end
    if nargin<5
        maxit=200
        if nargin<4
            es=0.000001
        end
    end

    %this is where we start using false position to find the most accurate
    %xr
    xr_old=xl;
    xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    ea=abs((xr-xr_old)/xr);
    i=1;
    if func(xl)>0 && func(xu)<0
            if func(xr)>0
                xl=xr;
            elseif func(xr)<0
                xu=xr;
            end
    end
    if func(xl)<0 && func(xu)>0
            if func(xr)<0
                xl=xr;
            elseif func(xr)>0
                xu=xr;
            end
    end
    while es<=ea && maxit>=i
        i=i+1;
        xr_old=xr;
        xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
        if func(xl)>0 && func(xu)<0
            if func(xr)>0
                xl=xr;
            elseif func(xr)<0
                xu=xr;
            end
        end
        if func(xl)<0 && func(xu)>0
            if func(xr)<0
                xl=xr;
            elseif func(xr)>0
                xu=xr;
            end
        end
        
        fx=func(xr);
        ea=abs((xr-xr_old)/xr);
        iter=i-1;
    end

end

