camino(X,Y):- arista(X,Y).


camino(X,Y):-
    arista(X,Z),
    camino(Z,Y).

arista(a,b).
arista(a,c).
arista(a,d).
arista(c,d).