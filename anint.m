function [Int,Intg] = anint(f,xi,xf)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
      syms x;
      
        
        Int=int(f,x);
        I=matlabFunction(Int);
        Intg=I(xf)-I(xi);
      
        
end

