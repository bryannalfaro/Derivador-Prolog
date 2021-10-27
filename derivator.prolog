%Derivador
%Proyecto 4 logica matematica
%Integrantes:
%Bryann Alfaro
%Raul Jimenez
%Diego Arredondo
%Oscar Saravia
%Donaldo Garcia

%referencia
%https://github.com/wjur/sym-diff-prolog/blob/master/sym-diff.pl
%http://www.cs.us.es/~jalonso/publicaciones/2006-int_prolog.pdf
%http://www.nivaria.net/blog/index.php/prolog/383-derivada-de-una-funcion-entera
%https://gist.github.com/tokkenno/8038482


%derivada de sumar
%casos 4x+3 , 4x+3x, 3+4x, 3(x+1)+2(x+3)
derivada(U+V,X,X1+Y1):-derivada(U,X,X1),derivada(V,X,Y1).

%derivada de resta
derivada(U-V,X,X1-Y1):-derivada(U,X,X1),derivada(V,X,Y1).


%basic cases
derivada(C,X,0):- number(C), atom(X). %4
derivada(X,X,1):- atom(X). %x
derivada(C*X,X,C):- number(C),atom(X). %4x

derivada(C*U,X,C*X1):- number(C),derivada(U,X,X1). %cadena 4(x+1)
derivada(ln(C)*U,X,ln(C)*X1):- number(C),derivada(U,X,X1). %cadena ln(5)(x+5)


%potencia

%derivada exponencial
derivada(C^X,X,C^x*ln(C)):-atom(X),number(C).

%CASO DE EXPONENCIAL CON EXPONENTE COMPUESTO 5^3x
derivada(C^U,X,DU):- number(C),derivada(e^(ln(C)*U),X,DU).

derivada(e^X,X,e^X).
derivada(e^U,X,e^U*DU) :- derivada(U, X, DU).


derivada(X^U,X,DU):- not(number(U)),derivada(e^(ln(X)*U),X,DU). %x^(x+2)
derivada(X^C,X,C*X^T):-C>1,number(C), atom(X),T is C-1. %caso base x^2
derivada(U^C,X,C*U^T*U1):-C>1,number(C), derivada(U,X,U1),T is C-1.  %cadena


%logaritmo natural
derivada(ln(X),X,1/X):- atom(X).
derivada(ln(U),X,(1/U)*DU):- derivada(U,X,DU).


%derivada sin
derivada(sen(X),X,cos(X)):-atom(X).
derivada(sen(U),X,cos(U)*DU) :- derivada(U, X, DU).

%derivada cos
derivada(cos(X),X,-sen(X)):-atom(X).
derivada(cos(U),X,-sen(U)*DU) :- derivada(U, X, DU).

%derivada tan
derivada(tan(X),X,sec^2*(X)):-atom(X).
derivada(tan(U),X,sec^2*(U)*DU) :- derivada(U, X, DU).

%derivada arctan
derivada(arctan(X),X,1/1+X^2):-atom(X).
derivada(arctan(U),X,(1/1+U^2)*DU) :- derivada(U, X, DU).


%derivada de un producto
derivada(U * V, X, U * DV + V * DU) :- derivada(U, X, DU), derivada(V, X, DV).

%derivada de una division
derivada(U / V, X, (DU*V - U*DV)/V^2) :- derivada(U, X, DU), derivada(V, X, DV). %3x-5/6x-7

