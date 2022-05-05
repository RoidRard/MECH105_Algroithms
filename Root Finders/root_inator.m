function [xr,Ea] = root_inator(func,xl,xu,Es,maxit)
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
            Es=0.000001
        end
    end
    xl_g=xl
    xu_g=xu
    %this is where we start using false position to find the most accurate
    %xr
    xr_old=xl;
    xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    Ea=abs((xr-xr_old)/xr)
    i=1
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
    xr_old=xr;
    Ea_old=Ea
    xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    Ea=abs((xr-xr_old)/xr)
    i=2
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
    dEa=abs(Ea-Ea_old)
    while Es<=Ea && maxit>=i && dEa> 0.01
        i=i+1
        xr_old=xr;
        xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)))
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
        Ea_old=Ea;
        Ea=abs((xr-xr_old)/xr)
        dEa=abs(Ea-Ea_old)
    end
    %this is when we use bisection to get a more accurate root
        if xl_g==xl
            xl= xl_g+(xu_g-xu)/3
        end
        if xu_g==xu
            xu= xu_g-(xl_g-xl)/3
        end
    while Es<=Ea && maxit>=i
        i=i+1
        xr_old=xr
        xr=(xl+xu)/2
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
        Ea=abs((xr-xr_old)/xr)
    end

end

