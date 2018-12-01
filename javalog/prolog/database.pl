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
removeLast([_],[]).
removeLast([X|Xs],[X|Xu]):-removeLast(Xs,Xu).

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

% 15 % Exercício: defina um predicado contiguos/1, que testa se uma lista 
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

dupl([_|T]):- dupl(T).
dupl([H|T]):- member(H,T),!.

% 17 % Exercício: Defina um predicado trocaPU/2 que devolve uma lista 
% em que o primeiro e último elementos são trocados de posição. Use append.
trocaPU(L,R):- append([First|Mid],[Last], L),append([Last|Mid],[First],R).

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

% 21. Exerc: Defina o predicado flatten/2 que devolve uma lista simples a partir de uma lista
% formada por listas aninhadas, mantendo a ordem de ocorrência dos elementos, como em
% ?- flatten([1,[2],[],[2,[3,4],5],6],X). X = [1,2,2,3,4,5,6] Yes
myflatten([],[]).
myflatten(X,[X]):-X\=[], X\=[_|_].
myflatten([H|T],R):- myflatten(H,Lp),myflatten(T,Ls),append(Lp,Ls,R). 

% Exc 22  zipper/3"  ?- zipper([a,b,c,d], [1,2,3,4], X). X=[a-1, b-2,c-3, d-4], 
zipper([X|Xs],[Y|Ys],[X-Y|XYs]):-zipper(Xs,Ys,XYs).
zipper([],[],[]).

% ?- zipper([a,b,c,d], [1,2,3,4], X).
% Exc 23
permutation(Xs,[Z|Zs]):-select(Z,Xs,Ys),permutation(Ys,Zs).
permutation([],[]).
% ?- permutation([1,2,3],P).

% Exc 24  reverse com acumulador. 
reverse(L,R):- reverse(L,[],R).
reverse([H|T],AUX,R):- reverse(T,[H|AUX],R).
reverse([],R,R).
%?- reverse([a,b,c],R). R=[c,b,a]

%25. Exerc: Defina o predicado reverse sem acumulador, usando append/3. Codifique as regras:
%(base) o reverso de uma lista vazia é a lista vazia;
%(recursiva) o reverso de uma lista é o reverso da cauda concatenado com a cabeça.
reverse1([],[]).
reverse1([H|T],R):- reverse1(T,L), append(L,[H],R).

%26. Exerc: Defina o predicado palindrome/1, que é verdadeiro se a lista é um palíndromo, por
%exemplo, [a,b,c,d,c,b,a]. Faça uma versão recursiva sem usar reverse.
palindrome([]).
palindrome([_]).
palimdrome([H|T]):- append(L,[U],T),palimdrome(L),H==U. 
%27. Exerc: Defina o predicado palindrome/1, sem recursividade usando o reverse.
palindrome1([]).
palindrome1(L):- reverse(L,L).

 

%32. Exerc: Defina o predicado isOrdered/1? Solução:
%?- isOrdered([1,5,5,11]). Yes
%?- isOrdered([2,1]). No
isOrdered([]).
isOrdered([_]).
isOrdered([H,N|T]):- H<N,isOrdered([N|T]).
%33. Exerc: Sem usar acumulador, defina um predicado maxL(M,L) que retorna o valor máximo
%de uma lista de valores numéricos? (seleção e ordem) Solução:
maxL([X],X):-!.
maxL([X|Xs],X):-maxL(Xs,M),X >M.
maxL([X|Xs],M):-maxL(Xs,M),X=<M. 
