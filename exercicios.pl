%Exercicio%
%seção 1.4
%database 1.1

homem(ivo).
homem(raí).
homem(noé).
homem(gil).
homem(ary).
mulher(ana).
mulher(eva).
mulher(bia).
mulher(clô).
mulher(lia).
mulher(gal).
pai(adão,cain).
pai(adão,abel).
pai(adão,seth).
pai(seth,enos).
pai(ary,gal).
pai(ivo,eva).
pai(raí,noé).
pai(gil,raí).
pai(gil,clô).
pai(gil,ary).
mãe(eva,noé).
mãe(ana,eva).
mãe(bia,raí).
mãe(bia,clô).
mãe(bia,ary).
mãe(lia,gal).
gerou(X,Y) :- pai(X,Y).
gerou(X,Y) :- mãe(X,Y).
irmãos(X,Y) :- pai(Z,X), pai(Z,Y), X\=Y.
irmãos(X,Y) :- mãe(Z,X), mãe(Z,Y), X\=Y.
avô(X,Y) :- pai(X,Z), (pai(Z,Y);mãe(Z,Y)).
avó(X,Y) :- mãe(X,Z), (pai(Z,Y);mãe(Z,Y)).
filho(X,Y) :- homem(X),gerou(Y,X).
filha(X,Y) :- mulher(X),gerou(Y,X).
tio(X,Y) :- homem(X),irmãos(X,Z),(mãe(Z,Y);pai(Z,Y)).
tia(X,Y) :- mulher(X),irmãos(X,Z),(mãe(Z,Y);pai(Z,Y)).
primo(X,Y) :- homem(X),(pai(Z,Y);mãe(Z,Y)),(tio(Z,X);tia(Z,X)). 
prima(X,Y) :- mulher(X),(pai(Z,Y);mãe(Z,Y)),(tio(Z,X);tia(Z,X)).
feliz(X) :- pai(X,_);mãe(X,_).   
casal(X,Y):- pai(X,Z),mãe(Y,Z).

%seção 2.4

%país(Nome, Área, População)
país(brasil,9,130).
país(china,12,1800).
país(eua,9,230).
país(índia,3,450).
dens(N,D):- país(N,A,P),D is P/A.

% func(Código, Nome, Salário)
func(1,ana,1000.90).
func(2,bia,1200.00).
func(3,ivo,903.50).
func(4,leo,2500.50).
func(5,clô,1800.00).
func(6,gil,1100.50).
% dep(Código, Nome)
dep(1,ary).
dep(3,raí).
dep(3,eva).
dep(4,lia).
dep(4,noé).
dep(5,eli).

% filme(Título, Gênero, Ano, Duração)
filme('Uma linda mulher', romance,1990,119).
filme('Sexto sentido',suspense,2001,108).
filme('A cor púrpura',drama,1985,152).
filme('Copacabana',comédia,2001,92).
filme('E o vento levou', drama,1939,233).

clássico(T,G,A,D) :- filme(T,G,A,D), A =< 1985.
clássico(T,G) :- filme(T,G,A,_), A =< 1985.
longo(T,G):- filme(T,G,_,D), D >150.
lançamento(T):- filme(T,_,A,_), Z is (2002 - A), Z =< 1.

%pessoa(Nome,Sexo,Idade,Altura,Peso).
pessoa('ana','fem',23,1.55,56.0).
pessoa('bia','fem',19,1.71,61.0).
pessoa('ivo','masc',22,1.80,70.0).
pessoa('lia','fem',17,1.85,57.3).
pessoa('eva','fem',28,1.75,68.7).
pessoa('ary','masc',25,1.72,68.9).

mais_alto(X,Y):-homem(Y),mulher(X),casal(Y,X),pessoa(X,_,_,Ax,_),pessoa(Y,_,_,Ay,_), Ay>Ax.


pode_ser_modelo(X):- mulher(X),pessoa(X,_,I,A,P), A > 1.70, I < 25,P < 62.1 * P - 44.7.

%seção 3.4

joga(ana,volei).
joga(bia,tenis).
joga(ivo,basquete).
joga(eva,volei).
joga(leo,tenis).

num(N,positivo) :- N>0,!.
num(N,negativo) :- N<0,!.
num(0,nulo).

animal(cão).
animal(canário).
animal(cobra).
animal(morcego).
animal(gaivota).
voa(canário).
voa(morcego).
voa(gaivota).
dif(X,X) :- !, fail.
dif(_,_).
pássaro(X) :- animal(X), voa(X), dif(X,morcego).


%seção 4.4

%mul(NUMERO,MULTIPLICADOR,RESULTADO)
%4.1.
mul(N,M,R) :- 
	M>0, 
	AUX is M-1, 
	mul(N,AUX,A),
	 R is (N+A).

mul(N,1,R) :- R is N.
mul(_,0,0).

%4.2.
to_bin(0,'0').
to_bin(1,'1').
to_bin(N,B):- 
	N>1, 
	X is N mod 2, 
	Y is N//2, 
	to_bin(Y,B1), 
	atom_concat(B1, X, B).

mapa(a,b,25).
mapa(a,d,23).
mapa(b,c,19).
mapa(b,e,25).
mapa(c,d,14).
mapa(c,f,28).
mapa(d,f,30).
mapa(e,f,26).

%estrada(ORIGEM,DESTINO,KM)

strada(X,Y,D):- mapa(X,Y,D).
strada(X,Y,D):- 
	mapa(X,Z,D1), 
	strada(Z,Y,DN),
	D is (D1+DN).

%seção 5.3

ultimo(X,[X]).
ultimo(X,[_|T]) :- ultimo(X,T).


tam([],0).
tam([_|T],N) :-	 
	tam(T,R),
	N is (1+R).  

%5.3.
soma([],0).
soma([H|T],S) :-	 
	soma(T,R),
	S is (H+R).  

%5.4.
max([H],H).

max([X,Y|T],M):-
	X>Y,
	max([X|T],M).

max([X,Y|T],M):-
      X=<Y,
      max([Y|T],M).

%5.5.
inv([],[]).
inv([H|T],I):- 
	inv(T,L),
	append(L,[H],I).
	
%5.6.
is_symmetric([H|T]):- inv([H|T],I), sim([H|T],I).
sim([],[]).
sim([X|Tx],[X|Ty]):- sim(Tx,Ty). 

%5.7.

d(0,zero).
d(1,um).
d(2,dois).
d(3,tres).
d(4,quatro).
d(5,cinco).
d(6,seis).
d(7,sete).
d(8,oito).
d(9,nove).

txt([],[]).
txt([H|T],L):- txt(T,R),d(H,P),append(R,[P],L).


%5.8.
estrada(1,a,b).
estrada(2,a,d).
estrada(3,b,c).
estrada(4,c,d).
estrada(5,b,e).
estrada(6,c,f).
estrada(7,d,f).
estrada(8,e,f).

rota(X,Y,D):- estrada(D,X,Y).
rota(X,Y,L):- 
	estrada(D,X,Z), 
	rota(Z,Y,DN),
	append([D],[DN],L).

%5.9.
retangulo(ponto(1,2),ponto(1,5),ponto(7,2),ponto(7,5)).

%seção 6.5

%6.2.

:- dynamic(lampada/1).

lampada(acesa).

desligar:-
	retract(lampada(acesa)),
	asserta(lampada(apagada)).
ligar:-
	retract(lampada(apagada)),
	asserta(lampada(acesa)).
	

%6.3.
:- dynamic(dig/2).

dig(zero).
dig(um).
dig(dois).
dig(tres).
dig(quatro).

memorize(Digito):-
	dig(Digito),true,!,fail.

memorize(Digito):-
	asserta(dig(Digito)).

%6.4.
:- dynamic(pos/2).
%pos(robô,garagem).
pos(robô,cozinha).
%pos(tv,sala).
pos(tv,quarto).

leve(Obj,Local):-
	pegue(Obj),
	ande(Local),
	solte(Obj).

pegue(Obj):-
	format(' [🤖]@Onde está ~w? ',[Obj]),
	read(Local),	
	assertz( pos(Obj,Local)),
	ande(Local),
	put(10),	
	format(' [🤖]@Pega a ~w.',[Obj]),
	retract( pos(robô,_) ),
	assertz( pos(robô,Local)).

pegue(Obj):-	
	pos(Obj,Local),
	ande(Local),
	put(10),	
	format(' [🤖]@Pega a ~w.',[Obj]),
	retract( pos(robô,_) ),
	assertz( pos(robô,Local)).

ande(Dest):- 
	pos(robô,Local),
	put(10),	
	format(' [🤖]@Anda da ~w até a ~w.',[Local,Dest]),
	retract( pos(robô,_) ),
	assertz( pos(robô,Dest)).

solte(Obj):-
	pos(robô,Local),
	put(10),
	format(' [🤖]@Solta a ~w.',[Obj]),
	retract( pos(Obj,_) ),
	assertz( pos(Obj,Local)).
 	
 
