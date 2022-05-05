function [df,n] = derive(f,x,n,h)
    % used to find the derivative of a function
    %n Determines to which derivative; can only be whole numbers
    %f= function
    %h= step size. The smaller the number, the more accurate the derivative
    if nargin<4
        h=0.00001;
    end
        new=f;
    
    if n==1
       
       df=(new(x+h)-new(x))/h;

    
    elseif n==2
        df=(new(x+h)-2*new(x)+new(x-h))/(h^2);

    elseif n==-1
        df=(new(x-h)-new(x))/-h;

    end
end