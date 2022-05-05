function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% Gerard Ketelaar
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
    n=length(x);
    m=length(y);
    if n~=m
        error('This function requires the x and y vectors to be of equal length')
    end
    [Ysort,sortOrder]=sort(y);
    Xsort=x(sortOrder);
    
        Q1=Ysort(floor((n+1)/4));
        Q3=Ysort(floor(3*(n+1)/4));
        IQR=Q3-Q1;
    arrayx=zeros(1,n);  
    arrayy=zeros(1,n);
    not=0
    for i = 1:n
        if Ysort(i)>= Q1-1.5*IQR && Ysort(i)<= Q3+1.5*IQR
            arrayy(i)=Ysort(i);
            arrayx(i)=Xsort(i);
        else
            not=not+1;
        end
    end
    fX=arrayx(1:n-not)
    fY=arrayy(1:n-not);
    
    Lx=length(fX);
    Meanx= sum(fX)/Lx;
    Meany= sum(fY)/Lx;
    G=0;
    K=0;
    M=0;
    Z=0;
    Sr=0;
    J=0;
    Sty=0;
    for i=1:Lx
        G=G+fX(i)*fY(i);
        K=K+fX(i);
        M=M+fY(i);
        Z=Z+fX(i)^2;
        J=J+fY(i)^2;
        Sty= Sty+(fY(i)-Meany)^2;
    end
%    causewhynot=["G" "K" "M" "Z" "J";G K M Z J]
    slope=(Lx*G-K*M)/(Lx*Z-K^2);
    intercept=Meany-slope*Meanx;
    for i=1:Lx
        Sr=Sr+(fY(i)-intercept-slope*fX(i))^2;
    end
    Rsquared=(Sty-Sr)/Sty;
    r=(Lx*G-K*M)/(sqrt(Lx*Z-K^2)*sqrt(Lx*J-M^2));
    Syx=sqrt(Sr/(Lx-2));
