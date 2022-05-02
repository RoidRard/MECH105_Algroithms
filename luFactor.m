function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
    [r,c]=size(A);
    if r~=c
            error('this algorithm only accepts symmetric matrices')
    end
        P=eye(r,c);
        U=A;
        v=ones(1,c);
        L=diag(v);
        %step 1
        for j=1:c
            jt=j;
            Cc=abs(U(:,j));
            
            [M,I]= max(Cc);
            if j>I
                if min(Cc)==0
                    [M,I]= maxk(Cc,j);
                    R=U(I(j),:);
                    R1=U(j,:);
                    U(j,:)=R;
                    U(I(j),:)=R1;
                    Pr= P(I(j),:);
                    Pr1= P(j,:);
                    P(j,:)=Pr;
                    P(I(j),:)=Pr1;
                end
            else
                if min(Cc)==0
                    [M,I]= max(Cc);
                    R=U(I,:);
                    R1=U(j,:);
                    U(j,:)=R;
                    U(I,:)=R1;
                    Pr= P(I,:);
                    Pr1= P(j,:);
                    P(j,:)=Pr;
                    P(I,:)=Pr1;
                end
            end
            
            for i=j+1:r
                it=i-1;
    %            for k=1+i:r
    %               kt=k
                    Ry=U(j,:);
                    Ri=U(i,:);
                    l= (U(i,j)/U(j,j));
                    L(i,j)=l;
                    Rr= -l*Ry+Ri;
                    U(i,:)= Rr;
    %               L(i,j)=l
                    
    %            end
    
            end
        end
        PA=P*A;
        LU=L*U;
        
        if PA==LU
            disp('Pivoting did good')
        else
            disp('some shit went wrong')
            disp(PA)
            disp(LU)
        end
end