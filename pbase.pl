% Exercı́cio 3.3

compr([_|Xs],1+T):-compr(Xs,T).
compr([],0).

compr1([],0).
compr1([_|Xs],1+T) :- compr1(Xs,T).

% Exercı́cio 3.4

sum([],0).
sum([X|Xs],X+S) :- sum(Xs,S).

% Exercı́cio 3.5
membro(X,[X|_]).
membro(X,[_|Xs]):-membro(X,Xs).

% Exercı́cio 3.6 

ultimo([U],U).
ultimo([_|Xs],U):-ultimo(Xs,U).

% Exercı́cio 3.9 
remUa(L,Lu):-append(Lu,[_],L).
remU([_],[]).
remU([X|Xs],[X|Xu]):-remU(Xs,Xu).

% Exercício 3.11

contiguous([H,N|T]):- H\==N,contiguous([N|T]).
contiguous([H,H|_]).
contiguous([]):- false.

% Exercício 3.13

dupl([H|T]):- member(H,T).
dupl([_|T]):- dupl(T). 
dupl([]):- false.

% Exercício 3.15
removehead([_|Tail], Tail).
trocaPU([H|T],U):- ultimo([H|T],A),		% Salva o último.
				   append(L1,[_],[H|T]),% Remove o último.
				   append(L1,[H],L2),   % Adiciona o último.
				   removehead(L2,L3),   % Remove o primeiro.
				   append([A],L3,U).    % Adiciona o primeiro.
				  
% Exercı́cio 3.16

remDupl([H|T],L):- member(H,T),remDupl(T,L).
remDupl([H|T],[H|L]) :- not(member(H,T)) ,remDupl(T, L).
remDupl([],[]).

% Exercı́cio 3.18
remDupl2([H|T],Lo) :- member(H,T),select(H,T,Li),remDupl2(Li,Lo).
remDupl2([H|T],[H|Lo]):- not(member(H,T)),remDupl2(T, Lo).
remDupl2([],[]).

% Exercı́cio 3.21

reverse([H|T],R):- append(RT,[H],R),reverse(T,RT).
reverse([],[]).

% Exercı́cio 3.22

palindromeR([]).
palindromeR(L):- reverse(L,L).
 
palindromeA([]).
% não seifazer essa ;( -?palindromeA(L):- append(),

% Exercicio 3.23
metIguais([],[]).

% Exercicio 3.25

maxL(M,A,[H|T]):- H > A,maxL(M,A,T).
maxL(M,A,[H|T]):- H =< A,maxL(M,A,T).
maxL(A,A,[]). 

% Exercicio 3.26
permutation(X,[H|T]):-select(H,X,Ys),permutation(Ys,T).
permutation([],[]).

isOrdered([]).
isOrdered([_]).
isOrdered([H,N|T]):- H=<N,isOrdered([N|T]).

sortx(Li,Lo) :- permutation(Li,Lo), isOrdered(Lo).

% Exercicio 3.27
pertence(X,C):-member(X,C).
subConjunto([X|Xs],Y):- select(X,Y,Ys), subConjunto(Xs,Ys).
subConjunto([],Y).

intersecao([],X,[]).
intersecao([X|Xs],Y,[X|Is]):-member(X,Y), intersecao(Xs,Y,Is).
intersecao([X|Xs],Y,Is):- \+ member(X,Y), intersecao(Xs,Y,Is).

% Exercício 3.28
uniao([],Lj,Lj).
uniao(Li,[],Li).
uniao([],[],[]).
uniao(Li,Lj,L):- append(Li,Lj,X),remDupl(X,L).

uniao2(Li,[],Li).
uniao2([],[],[]).
uniao2([],X,X).
uniao2([H|Ti],Lj,Lo):- member(H,Lj),uniao2(Ti,Lj,Lo).
uniao2([H|Ti],Lj,[H|Tj]):- uniao2(Ti,Lj,Tj).

%uniao2([a,b,c,d,g],[h,a,b,c,d,e,f],L).

% Exercicio 3.29
pertence2(E,L,true):- member(E,L).
pertence2(_,_,false). 


% Exercicio 3.30
intersecao3([X|Xs],Y,[X|Is]):-member(X,Y), intersecao3(Xs,Y,Is).
intersecao3([X|Xs],Y,Is):- pertence(X,Y); intersecao3(Xs,Y,Is).


% Exercicio 3.31
%insOrd(N,L,OL):- append(L,[N],Li),sortx(Li,OL).
%insOrd(4,[2,3,5,7],L).

insOrd(N,[],[N]).
insOrd(N, [H|T],[H|L]):- N > H,insOrd(N,T,L). %vai pra direita.
insOrd(N, [H|T],[N,H|T]):- N < H,!. %vai pra esquesda.

% Exercicio 3.32
%???????????????
% Exercício 3.33
particiona([],[],[]).
particiona([H|T],[H|A],B):- particiona(T,B,A).

% Exercício 3.34
merge(Li,Lj,X):- append(Lj,Li,Lo),sort(Lo,X).

% Exercício 3.35
mergeSort().

% Exercício 3.36
zipper([],[],[]).
zipper([Hi|Ti],[Hj|Tj],[Hi-Hj|Lo]):- zipper(Ti,Tj,Lo).

% Exercício 3.37
enesimo(N,[_|T],X):- N > 1, M is N-1, enesimo(M,T,X).
enesimo(_,[H|_],H). 

% Exercı́cio 4.1
max(X,Y,M):- X>Y,!, M=X.
max(X,Y,M):- X =< Y,!, M=Y.

% Exercı́cio 4.2
a. b. p:-!,a. p:-b.

% Exercı́cio 4.3
fat(0,1):-!.
fat(X,1):-X<1,!.
fat(X,F):-fat(X-1,F1), F is F1*X.

% Exercı́cio 4.4
pessoa(jose).
pessoa(ana).
pessoa(joao).
pessoa(maria).
pessoa(pedro).
pessoa(antonia).
namora(jose,ana).
casal(joao,maria).
casal(pedro,antonia).
casado(X):-casal(X,_);casal(_,X).
solteiro(X):- pessoa(X),\+ casado(X).

% Exercı́cio 4.5
wN(0):-write(0),!.
wN(N):-write(N),N1 is N-1, wN(N1),write(N).

piramideI(0):- wN(0),nl.
piramide(N):- M is N-1,piramideI(M),wN(N),nl.

% Exercı́cio 4.6
piramideII(0):- wN(0).
piramideII(N):- M is N-1,wN(N),nl,piramideII(M).

% Exercı́cio 4.7
diamante(N):- M is N-1, piramideI(M),piramideII(N).

% Exercı́cio 5.1
fat(X,1):-X=<1,!.
fat(X,F):-!,X1 is X-1, fat(X1,F1), F is F1*X.

fati(X,F):-fatAcc(X,1,F).
fatAcc(X,ACC,ACC):-X=<1,!.
fatAcc(X,ACC,F):-!,ACC1 is X*ACC, X1 is X-1,fatAcc(X1,ACC1,F).


% Exercı́cio 5.2
power(_,0,1).
power(X,1,X).
power(X,Y,R):- Aux is X+X, N is Y-1,power(Aux,N,R).

%Exercício 5.3
lista_rand([],V,N):-N<1,!.
lista_rand([R|L],V,N):-N1 is N-1, R is random(V), lista_rand(L,V,N1).




%produto(NOME, FORNECEDOR, QTY, DATA).
produto(tomate, jose,20, 20/10).
produto(feijao, joao,10, 21/10).
produto(arroz, antonio, 40, 20/10).
produto(sal,maria,3, 21/10).
produto(acucar, ana,5, 20/10).
produto(copos, jose,1000, 20/10).
produto(pratos, maria,100, 21/10).

%fornecedor(NOME, FONE, END).
fornecedor(jose, 1503, rua5).
fornecedor(antonio, 1402, rua21).

% Exercício 6.1
viewProduto1(N,F,Q, D):- produto(N, F,Q,D), D=21/10.
diff(N,F,Q,D):-produto(N,F,Q,D),not(viewProduto(N,F,Q,D)),nl.

% Exercício 6.2
viewProduto2(N,F,Q,D):- produto(N, F,Q,D), Q<50.
consulta(N,F,Q, D):- viewProduto1(N,F,Q,D),viewProduto2(N,F,Q,D),nl.
% Exercício 6.3
cartesiano(N1,F1,Q1,D1,N2,F2,Q2):-produto(N1,F1,Q1,D1),fornecedor(N2,F2,Q2),nl.

% Exercício 6.4
no(a,no(b,no(c,[],[]),[]),[]).
t(a,t(b,t(c,[]))).

% Exercício 6.5

wArv(_,nil).
wArv(N,t(I,E,D)):-tab(N),write(I),nl,N1 is N+1, wArv(N1,E),wArv(N1,D).

tree(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).

preOrdem(nil).
preOrdem(t(I,E,D)):- write(I),preOrdem(E),preOrdem(D).

% Exercício 6.8
arvore(no(a,no(b,no(d,[],[]),[]),no(c,no(e,no(g,[],[]),[]),no(f,[],[])))).


inOrdem([],[]).
inOrdem(no(I,E,D),[I|EDs]):- inOrdem(E,Es),inOrdem(D,Ds),append(Es,Ds,EDs).
	

% Exercício 6.9
leaf([]).
leaf(no(I,[],[])):- write(I).
leaf(no(_,E,D)):- leaf(E),leaf(D).

%Exercı́cio 6.11

%Exercı́cio 6.12
arco_(s,u).
arco_(s,x).
arco_(u,v).
arco_(u,x).
arco_(x,u).
arco_(x,y).
arco_(v,y).
arco_(y,v).
arco_(y,s).
arco(X,Y):-arco_(X,Y).

cam1(X,Y,Lo):-cam1a(X,Y,[X]/Lo).
cam1a(X,Y,L/[Y|L]):-arco(X,Y).
cam1a(X,Z,L/Lo):-arco(X,Y), \+ member(Y,L), cam1a(Y,Z,[Y|L]/Lo).
%%

%Exercı́cio 6.13
arco1(d,c,1).
arco1(d,e,2).
arco1(c,b,1).
arco1(f,e,3).
arco1(e,b,1).
arco1(b,a,1).
%
cam2(X,Y,L,V):-cam2a(X,Y,[X]/L,[]/V).

cam2a(X,Y,C/[Y|C],V/[Va|V]):-arco1(X,Y,Va).
cam2a(X,Z,C/Co,V/Vo):-arco1(X,Y,Va), \+ member(Y,C),
cam2a(Y,Z,[Y|C]/Co, [Va|V]/Vo).

bag2(B):-bagof(par(L,V),cam2(d,a,L,V),B).

sum_list([], 0).
sum_list([H|T], Sum) :- sum_list(T, Rest), Sum is H + Rest. 

min_in_list([par(X,Min)],[par(X,Min)]).
min_in_list([par(A,H),par(_,K)|T],M) :-H =< K,min_in_list([par(A,H)|T],M).              
min_in_list([par(_,H),par(B,K)|T],M) :-H > K,min_in_list([par(B,K)|T],M).  

custo([],[]).
custo([par(A,V)|T] , [par(A,S)|L]):- sum_list(V,S),custo(T,L).

menor_custo(B,M):- custo(B,S),min_in_list(S,M).
	
%Exercı́cio 6.14

cam14(X,Y,L,V):-cam14a(X,Y,[X]/L,V).
cam14a(X,Y,C/[Y|C],V):-arco1(X,Y,V).
%cam3a(X,Z,C/Co,V):-arco1(X,Y,Va), \+ member(Y,C),cam3a(Y,Z,[Y|C]/Co,Vo),V+Va+Vo.
cam14a(X,Z,C/Co,V):-arco1(X,Y,Va), \+ member(Y,C),cam14a(Y,Z,[Y|C]/Co,Vo),V is Va+Vo.

%Exercı́cio 6.15

%Exercı́cio 6.16
bag3(B):-bagof(X-Y,arco(X,Y),B).
 
%Exercı́cio 6.17 

arcoXY(X-Y,L):-member(X-Y,L);member(Y-X,L).
cam4(X,Y,G,C):-cam4a(X,Y,G,[X]/C).
cam4a(X,Y,G,C/[Y|C]):-arcoXY(X-Y,G).
cam4a(X,Z,G,C/Co):-arcoXY(X-Y,G), \+ member(Y,C), cam4a(Y,Z,G,[Y|C]/Co).


%cam4(a,d,[a-c,a-v,c-b,c-x,b-v,v-d,d-w,d-e,x-e,x-w],N).
 
%Exercı́cio 6.18
nos(X,Y):-nosA(X,[]/Y).
nosA([],X/X).
nosA([X-Y|XYs],N/No):-
(( \+member(X,N), \+member(Y,N) -> nosA(XYs,[X,Y|N]/No);
\+member(Y,N) -> nosA(XYs,[ Y|N]/No);
\+member(X,N) -> nosA(XYs,[X |N]/No);
nosA(XYs,
N /No) )) .
arcoXY18(X-Y,L):-member(X-Y,L).
cam3(X,Y,G,C):-cam3a(X,Y,G,[X]/C).
cam3a(X,Y,G,C/[Y|C]):-arcoXY(X-Y,G).
cam3a(X,Z,G,C/Co):-arcoXY(X-Y,G), \+ member(Y,C), cam3a(Y,Z,G,[Y|C]/Co).

cobre(C,G):-nos(G,NG),\+ (( member(N,NG),\+member(N,C) )).
caminhos(X,Y,L,H):- bagof(N,cam3(X,Y,[a-b,b-c,c-e,e-d,d-b,c-d,b-d],N),B),hamiltonian(B,L,H).
hamiltonian([H|T],L,[H|R]):-cobre(H,L),hamiltonian(T,L,R).
hamiltonian([H|T],L,R):-not(cobre(H,L)),hamiltonian(T,L,R).
hamiltonian([],_,[]).

%Exercı́cio 6.20
camx(X,Y,G):-cam3(X,Y,G,_),!; cam3(Y,X,G,_),!.
ligados(X,Y,G):-camx(X,Y,G),!.
ligados(X,Y,G):-nos(G,NG),!,member(Z,NG),camx(Z,X,G),camx(Z,Y,G).

conexo([],_).
conexo([H,N|T],L):- write(H),write(N),nl,ligados(H,N,L),conexo([H|T],L). 
conexo(L):- nos(L,N),conexo(N,L).

%Exercı́cio 7.01
	
%Exercı́cio 7.02
printTree(N,t(I,E,D)):- tab(N),write(I),write(' raiz')
						,nl,N1 is N+1,
						prittyprint(N1,E),prittyprint(N1,D).
prittyprint(_,nil).
prittyprint(N,t(I,E,D)):-tab(N)
						,write(I),write(' folha')
						,nl,N1 is N+1,
						 prittyprint(N1,E),
						 prittyprint(N1,D).



%Exercı́cio 8.02
particiona2([],[],[]).
particiona2([X,Y|XYs], [X|Xs],[Y|Ys]):-particiona2(XYs,Xs,Ys).


%Exercı́cio 8.03
sortKey(0, L/L, []) :- !.
sortKey(1, [X|L]/L, [X]) :- !.

sortKey(List, Sorted) :-length(List, Length), 
						sortKey(Length, List/ _, Result),
						Sorted = Result.

sortKey(2, [X1, X2|L]/L, R) :- !,
							X1 = K1-_,
							X2 = K2-_,
							(( K1 @=< K2 -> R = [X1, X2]; R = [X2, X1])).		

sortKey(N, L1/L3, R) :- N1 is N // 2, 
						N2 is N - N1, 
						sortKey(N1, L1/L2, R1),
						sortKey(N2, L2/L3, R2),
						mergeKey(R1, R2, R).

mergeKey([], R, R) :- !.
mergeKey(R, [], R) :- !.
mergeKey(R1, R2, [X|R]) :-  R1 = [X1|R1a], X1 = K1-_,
							R2 = [X2|R2a], X2 = K2-_,
							(( K1 @> K2 -> X = X2, mergeKey(R1, R2a, R);
							X = X1, mergeKey(R1a, R2, R))).
							


r --> a(N), b(N).
a(N+1) --> [a],a(N).
a( 0 ) --> [].
b(N+1) --> [b],b(N).
b( 0 ) --> [].

% Exercício 11.4

move(D,F) --> passo(D,F).
move(D+D1,F+F1)--> passo(D,F), move(D1,F1).
 move(000,111) --> [p].
passo(001,110) --> [d],[p].
passo(010,101) --> [e],[p].
passo(100,000) --> [f],[p].
passo(101,001) --> [t],[p].


% Exercício 11.6
passo(110,010) --> [s],[p].
passo(111,100) --> [d],[p].



