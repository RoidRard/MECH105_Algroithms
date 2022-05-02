function [L,Total,Mean,med,Mode,Range,SD,St,Variance,cv] = vstats(X,Y,Z)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    Lx=length(X);
    Totalx=sum(X);
    Meanx= Totalx/Lx;
    medx=median(X);
    Modex=mode(X);
    Rangex=max(X)-min(X);
    Stx=0;
    for i=1:Lx
        Stx= Stx+(X(i)-Meanx)^2;
    end
    SDx=sqrt(Stx/(Lx-1));
    Variancex=Stx/(Lx-1);
    cvx=(SDx/Meanx)*100;

    if nargin == 2
        Ly=length(Y);
        Totaly=sum(Y);
        Meany= Totaly/Ly;
        medy=median(Y);
        Modey=mode(Y);
        Rangey=max(Y)-min(Y);
        Sty=0;
        for i=1:Ly
            Sty= Sty+(Y(i)-Meany)^2;
        end
        SDy=sqrt(Sty/(Ly-1));
        Variancey=Sty/(Ly-1);
        cvy=(SDy/Meany)*100;
    end
        if nargin == 3
            Lz=length(Z);
            Totalz=sum(Z);
            Meanz= Totalz/Lz;
            medz=median(Z);
            Modez=mode(Z);
            Rangez=max(Z)-min(Z);
            Stz=0;
            for i=1:Lz
                Stz= Stz+(Z(i)-Meanz)^2;
            end
            SDz=sqrt(Stz/(Lz-1));
            Variancez=Stz/(Lz-1);
            cvz=(SDz/Meanz)*100;
        end
    if nargin == 3
        L=[Lx,Ly,Lz];
        Total=[Totalx Totaly Totalz];
        Mean=[Meanx Meany Meanz];
        med=[medx medy medz];
        Mode=[Modex Modey Modez];
        Range=[Rangex Rangey Rangez];
        SD=[SDx SDy SDz];
        St=[Stx Sty Stz];
        Variance=[Variancex Variancey Variancez];
        cv=[cvx cvy cvz];
    elseif nargin == 2
        L=[Lx,Ly];
        Total=[Totalx Totaly];
        Mean=[Meanx Meany];
        med=[medx medy];
        Mode=[Modex Modey];
        Range=[Rangex Rangey];
        SD=[SDx SDy];
        St=[Stx Sty];
        Variance=[Variancex Variancey];
        cv=[cvx cvy];
    elseif nargin == 1
        L=[Lx];
        Total=[Totalx];
        Mean=[Meanx];
        med=[medx];
        Mode=[Modex];
        Range=[Rangex];
        SD=[SDx];
        St=[Stx];
        Variance=[Variancex];
        cv=[cvx];
    end

end

