function [vs,Expvs,PWRvs,LS,Exp,PWR,P,Poly] = Cfit(x,y,n)
%CFIT Summary of this function goes here
%   Detailed explanation goes here
    
    [L,Total,Mean,med,Mode,Range,SD,St,Variance,cv] = vstats(x,y);
    vs=["vector" "Length" "Sum" "Average" "Median" "Mode" "Range" "SD" "St" "Variance" "cv";"X" L(1) Total(1) Mean(1) med(1) Mode(1) Range(1) SD(1) St(1) Variance(1) cv(1);"Y" L(2) Total(2) Mean(2) med(2) Mode(2) Range(2) SD(2) St(2) Variance(2) cv(2)];
    % All of the outputs of vstats are vectors 1st element is for x 2nd is
    % for y and 3rd wont be used for this function but is meant for the z
    % vector
    
    % least squares linear regression
    G=0;
    K=0;
    M=0;
    Z=0;
    Sr=0;
    J=0;
    for i=1:L(1)
        G=G+x(i)*y(i);
        K=K+x(i);
        M=M+y(i);
        Z=Z+x(i)^2;
        J=J+y(i)^2;
        
    end
    causewhynot=["G" "K" "M" "Z" "J";G K M Z J]
    a1=(L(1)*G-K*M)/(L(1)*Z-K^2);
    a0=Mean(2)-a1*Mean(1);
    for i=1:L(1)
        Sr=Sr+(y(i)-a0-a1*x(i))^2;
    end
    r2=(St(2)-Sr)/St(2);
    r=(L(1)*G-K*M)/(sqrt(L(1)*Z-K^2)*sqrt(L(1)*J-M^2));
    Syx=sqrt(Sr/(L(1)-2));
    LS=['a0',"a1","Sr","r2","r","Syx";a0,a1,Sr,r2,r,Syx];
    %syms x
%     F=a1*x+a0;
%     fl=matlabFunction(F);
    
    % Linear to nonlinear
    % Exponential
    lny= log(y);
    [L,Total,Mean,med,Mode,Range,SD,St,Variance,cv] = vstats(x,lny);
    Expvs=["vector" "Length" "Sum" "Average" "Median" "Mode" "Range" "SD" "St" "Variance" "cv";"X" L(1) Total(1) Mean(1) med(1) Mode(1) Range(1) SD(1) St(1) Variance(1) cv(1);"Y" L(2) Total(2) Mean(2) med(2) Mode(2) Range(2) SD(2) St(2) Variance(2) cv(2)];
    G=0;
    K=0;
    M=0;
    Z=0;
    SrExp=0;
    J=0;
    for i=1:L(1)
        G=G+x(i)*lny(i);
        K=K+x(i);
        M=M+lny(i);
        Z=Z+x(i)^2;
        J=J+lny(i)^2;
        
    end
    a1=(L(1)*G-K*M)/(L(1)*Z-K^2);
    a0=Mean(2)-a1*Mean(1);
    for i=1:L(1)
        SrExp=SrExp+(lny(i)-a0-a1*x(i))^2;
    end
    r2=(St(2)-SrExp)/St(2);
    r=(L(1)*G-K*M)/(sqrt(L(1)*Z-K^2)*sqrt(L(1)*J-M^2));
    Syxe=sqrt(SrExp/(L(1)-2));
    Exp=['a',"b","SrExp","r2","r","Syx";exp(a0),a1,SrExp,r2,r,Syxe];
    
    % Power
    LOGx=log10(x);
    LOGy=log10(y);
    [L,Total,Mean,med,Mode,Range,SD,St,Variance,cv] = vstats(LOGx,LOGy);
    PWRvs=["vector" "Length" "Sum" "Average" "Median" "Mode" "Range" "SD" "St" "Variance" "cv";"X" L(1) Total(1) Mean(1) med(1) Mode(1) Range(1) SD(1) St(1) Variance(1) cv(1);"Y" L(2) Total(2) Mean(2) med(2) Mode(2) Range(2) SD(2) St(2) Variance(2) cv(2)];
    G=0;
    K=0;
    M=0;
    Z=0;
    SrPWR=0;
    J=0;
    for i=1:L(1)
        G=G+LOGx(i)*LOGy(i);
        K=K+LOGx(i);
        M=M+LOGy(i);
        Z=Z+LOGx(i)^2;
        J=J+LOGy(i)^2;
        
    end
    a1=(L(1)*G-K*M)/(L(1)*Z-K^2);
    a0=Mean(2)-a1*Mean(1);
    for i=1:L(1)
        SrPWR=SrPWR+(LOGy(i)-a0-a1*LOGx(i))^2;
    end
    r2=(St(2)-SrPWR)/St(2);
    r=(L(1)*G-K*M)/(sqrt(L(1)*Z-K^2)*sqrt(L(1)*J-M^2));
    Syxpw=sqrt(SrPWR/(L(1)-2));
    PWR=['LOGa',"a","b","SrPWR","r2","r","Syx";a0,10^a0,a1,SrPWR,r2,r,Syxpw];
    
    % Polynomial regression
    if nargin == 3
        [P,S]=polyfit(x,y,n);
        SrPoly=0;
        
        for i=1:L(1)
            why=polyval(P,x(i));
            SrPoly=SrPoly+(y(i)-why)^2;
        end
        Syxpol=sqrt(SrPoly/(L(1)-(n+1)));
        r2=(St(2)-SrPoly)/St(2);
        r=sqrt(r2);
        Poly=["SrPoly","r2","r","Syx";SrPoly,r2,r,Syxpol];
%         syms x Xs F ;
%         for i=1:n+1
%             Xs=ones(1,n+1);
%             Xs(1,i)= x^i;
%         end
%         F=P'*Xs;
%         func=matlabFunction(F);
    end
    

end

