function [xr] = root_markVIII(x1,x2,x3,y1,y2,y3)
%ROOT_MARKVIII Summary of this function goes here
%   Detailed explanation goes here
    xr= (y2*y3/((y1-y2)*(y1-y3))*x1)+(y1*y3/((y2-y1)*(y2-y3))*x2)+(y1*y2/((y3-y1)*(y3-y2))*x3)
end

