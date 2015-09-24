%   Solve equation set
A = [6 -3 5;
    10 4 -8;
    -6 2 3];

B = [12;-20;15];

C = A; D=A; E=A;
C(:,1)=B; D(:,2)=B; E(:,3)=B;
det(A)

x=det(C)/det(A);
y=det(D)/det(A);
z=det(E)/det(A);

X = A\B;