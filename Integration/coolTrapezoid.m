function [result] = coolTrapezoid(func, valueA, valueB, n)
% Write a documentation string!
%result = inputFunction(valueA, valueB)
%result = sum((valueA-valueB)*(inputFunction(valueA)+inputFunction(valueB))/2)
%    x determines the accuracy of the integral
%    a and b are place holders so that the values of valueA and valueB are evenly spaced
%    l represents the spacing of values valueA and valueB
    
    if nargin == 3
        result=(valueB-valueA)*(func(valueA)+func(valueB))/2
    elseif nargin>3
    a=valueA;
    b=valueB;
    l=linspace(a,b-(b-a)/n,n);
    valueA = l;
    valueB = l+(b-a)/n;
    result = sum((valueA-valueB).*(func(valueA)+func(valueB))./2)
    end
    
end
