%Derivador
%Proyecto 4 logica matematica
%Integrantes:
%Bryann Alfaro
%Raul Jimenez
%Diego Arredondo
%Oscar Saravia
%Donaldo Garcia

%basic cases
derivada(C,X,0):- number(C), atom(X).
derivada(X,X,1):- atom(X).
derivada(C*X,X,X):- number(C),atom(X).