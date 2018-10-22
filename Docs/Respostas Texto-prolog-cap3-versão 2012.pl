% base predicates
myappend([],L,L).
myappend([H|T],L,[H|R]):- myappend(T,L,R).
% 8 % Exercício: faça uma versão do predicado ultimo/2, usando append.
getLast(L,U):- myappend(_,[U],L).

% 9 %  Exercício: defina o predicado remU/2 que devolve uma lista sem 
% o último elemento, fazendo duas regras uma recursiva.
remU(L,Lu):-L=[_|Xs],Xs=[],Lu=[].
remU(L,Lu):-L=[X|Xs],Xs\=[],Lu=[X|Xu],remU(Xs,Xu).

% 10. Exerc: Escreva em linguagem natural as regras que definem o 
% predicado remove último remU/2 com recursividade.
% Primeiro, a lista L é dividida em Head e Tail. Bem como a váriável que conterá a
% nova lista. Logo em seguida, verifica-se se a calda não é vazia. Caso positivo,
% uma chamada recursiva é invcada tomando como argumentos a variável T e a variável Xu.  
% Quando a calda está vazia (Xs\=[]), o segundo predicado é invocado. Neste
% predicado, é testado mais uma vez se a primeira váriável é uma lista e se a
% a calda está vazia. Se esta  úlima condição for verdadeira, a calda da variável
% respostas é unificada  com uma  lista vazia.        

% 11 % Exercício: simplifique esta versão do predicado remU/2, 
% para que não retorne (; false), sem usar cort.
removeLast([_|[]],[]).
removeLast([H|T],[H|Tu]):- T\=[],removeLast(T,Tu).

% 12 % Exercício: simplifique esta versão do predicado remU/2, para não retornar
%  (; false) tirando os testes e usando corte.
simpleRemoveLast([_|[]],[]):- !.
simpleRemoveLast([H|T],[H|Tu]):- T\=[],simpleRemoveLast(T,Tu).

% 13 % Exercício: defina o predicado remU/2 usando append sem recursividade.
remUa(L,Lu):-myappend(Lu,[_],L).

% 14 % Exercício: Defina um predicado contiguos/1 que testa se uma lista tem dois 
% lementos contíguos iguais, faça uma versão recursiva. Por exemplo ?-contiguos ([a,b,c,c,e]). Yes
contiguos1([H,H|_]):- !.
contiguos1([_,N|T]):- contiguos1([N|T]).   

% % 15 % Exercício: defina um predicado contiguos/1, que testa se uma lista 
% tem dois elementos contíguos iguais, usando append.
contiguos2(L):- myappend(_,[X,X|_],L).

% 16 % Exercício: Defina um predicado dupl/1, que é verdadeiro, se a lista tem elementos duplicados.
% Use o member e recursividade.

mymember1(X,L):- myappend(_,[X|_],L),!. 
mymember2(X,[X|_]).
mymember2(X,[_|T]):- mymember2(X,T).

duplicated([H|T]):- mymember1(H,T),!.
duplicated([_|T]):- duplicated(T). 
duplicated([_|[]]):-false.

% 17 % Exercício: Defina um predicado trocaPU/2 que devolve uma lista 
% em que o primeiro e último elementos são trocados de posição. Use append.
trocaPU().

% 18 % Exercício: Defina um predicado remDupl/2 que remove os elementos
% duplicados de uma lista, use apenas o member e recursividade. 
% Remova as cópias iniciais dos elementos da lista. 
% Assim, ?-remDupl([a,b,a],X). X=[b,a]. Yes
remDupl([Hi|Ti],Tj):- member(Hi,Ti),remDupl(Ti,Tj).
remDupl([Hi|Ti],[Hi|Tj]) :- not(member(Hi,Ti)) ,remDupl(Ti, Tj).
remDupl([],[]). 

% 19 % Exercício: defina um predicado remDupl1/2 que remove os elementos 
% duplicados de uma lista, use apenas o member e o select/3. 
% Remova as cópias finais dos elementos da lista.Assim, 
% ?-remDupl1([a,b,a],X). X=[a,b]. Yes

remDupl1([H|T],Lo) :- member(H,T),select(H,T,Li),remDupl1([H|Li],Lo).
remDupl1([H|T],[H|Lo]):- not(member(H,T)),remDupl1(T, Lo).
remDupl1([],[]).

% 20 % Exercício: faça um predicado remove/3 tal que: ?- 
% remove(a,[a,b,a,d,x,a], X). X=[b,d,x] Yes

remove(_,[],[]).
remove(X,[H|T],[H|R]):- X\=H,remove(X,T,R).
remove(X,[H|T],R):- X==H,remove(X,T,R).



