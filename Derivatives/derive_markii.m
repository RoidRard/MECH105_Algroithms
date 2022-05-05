function [df,dy,n] = derive_markii(f,n,x)
%DERIVE_MARKII finds any order derivative of a function
%   Detailed explanation goes here
    xog=x;
    for i=1:n
        x=sym('x');
        h=sym('h');
        df=limit((f(x+h)-f(x))/h,h,0,'right');
        f=matlabFunction(df);
    
    end
    x=xog;
    dy=subs(f,x);
    disp(df)
end

