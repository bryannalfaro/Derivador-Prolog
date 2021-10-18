%Derivador
%Proyecto 4 logica matematica
%Integrantes:
%Bryann Alfaro
%Raul Jimenez
%Diego Arredondo
%Oscar Saravia
%Donaldo Garcia


%derivada de sumar
%casos 4x+3 , 4x+3x, 3+4x, 3(x+1)+2(x+3)
derivada(U+V,X,X1+Y1):-derivada(U,X,X1),derivada(V,X,Y1).

%derivada de resta
derivada(U-V,X,X1-Y1):-derivada(U,X,X1),derivada(V,X,Y1).


%basic cases
derivada(C,X,0):- number(C), atom(X). %4
derivada(X,X,1):- atom(X). %x
derivada(C*X,X,C):- number(C),atom(X). %4x
%Si es necesario hacer cada caso manual?
derivada(C*U,X,C*X1):- number(C),derivada(U,X,X1). %cadena 4(x+1)


%potencia
derivada(X^C,X,C*X^T):-C>1,number(C), atom(X),T is C-1. %caso base x^2 falta casos x^(x+2)
derivada(U^C,X,C*U^T*U1):-C>1,number(C), derivada(U,X,U1),T is C-1. %caso base x^2 falta casos x^(x+2)



%derivada de un producto
derivada(U * V, X, U * DV + V * DU) :- derivada(U, X, DU), derivada(V, X, DV).

%derivada de una division
derivada(U / V, X, (DU*V - U*DV)/V^2) :- derivada(U, X, DU), derivada(V, X, DV). %3x-5/6x-7