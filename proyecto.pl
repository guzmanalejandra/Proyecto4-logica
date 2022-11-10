/* Facts */
hombre(rafael).
hombre(jhon).
hombre(anibal).
hombre(peter).
hombre(gabriel).
hombre(zacka).
mujer(irma).
mujer(sophie).
mujer(andrea).
mujer(chulis).
 
padresP_de(rafael,andrea).
padresP_de(rafael,chulis).
padresP_de(irma, andrea).
padresP_de(irma, chulis).
padresP_de(jhon,peter).
padresP_de(sophie, peter).
padresP_de(andrea, gabriel).
padresP_de(anibal, gabriel).
padresP_de(chulis, zacka).
padresP_de(peter, zacka).
 
/* Rules */

padre_de(X,Y):- hombre(X),
    padresP_de(X,Y).
 
madre_de(X,Y):- mujer(X),
    padresP_de(X,Y).
 
abuelo_de(X,Y):- hombre(X),
    padresP_de(X,Z),
    padresP_de(Z,Y).

abuela_de(X,Y):- mujer(X),
    padresP_de(X,Z),
    padresP_de(Z,Y).
 
hermana_de(X,Y):- %(X,Y or Y,X)%
    mujer(X),
    padre_de(F, Y), padre_de(F,X),X \= Y.
 
hermana_de(X,Y):- mujer(X),
    madre_de(M, Y), madre_de(M,X),X \= Y.
	
tia_de(X,Y):- mujer(X),
    padresP_de(Z,Y), hermana_de(Z,X),!.
 
hermano_de(X,Y):- %(X,Y or Y,X)%
    hombre(X),
    padre_de(F, Y), padre_de(F,X),X \= Y.

hermano_de(X,Y):- hombre(X),
    madre_de(M, Y), madre_de(M,X),X \= Y.
 
tio_de(X,Y):-
    padresP_de(Z,Y), hermano_de(Z,X).

antecesor_de(X,Y):- padresP_de(X,Y).
antecesor_de(X,Y):- padresP_de(X,Z),
    antecesor_de(Z,Y).
esTio_de(X,Y):-
	tio_de(X,Y); tia_de(X,Y).

primo_de(X,Y):-
	hombre(X),
	padresP_de(Z,Y), esTio_de(Z,X). 
prima_de(X,Y):-
	mujer(X),
	padresP_de(Z,Y), esTio_de(Z,X).
