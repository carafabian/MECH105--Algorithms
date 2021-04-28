function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

[m,n] = size(A);

if nargin > 1
    error('Too many inputs')
end
if nargin < 1
    error('Not enough inputs')
end
if m ~= n
    error('Not square matrix')
end
%U has to be equal to A since U is mostly A with a few 0s
U = A; 
L = eye(n); 
P = eye(n); 
%Both L and P start out as identity matrixes so they are equal as of right now!
P = L; 

for h=1:n 
    [pivot c] = max(abs(U(h:n,h))); %Deciding if pivoting needs to happen
    c = c + h - 1; 
    if c~=h
        %pivot
        fu1 = U(h,:);
        U(h,:) = U(c,:);
        U(c,:) = fu1;
        
        fp1 = P(h,:);
        P(h,:) = P(c,:);
        P(c,:) = fp1;
        
        if h >= 2
            fl1 = L(h,1:h-1);
            L(h,1:h-1) = L(c,1:h-1);
            L(c,1:h-1) = fl1;
        end
    end
    for r = h+1:n
        L(r,h) = U(r,h)/U(h,h);
        U(r,:) = U(r,:)-L(r,h)*U(h,:);
    end
end
% Test your function
end
