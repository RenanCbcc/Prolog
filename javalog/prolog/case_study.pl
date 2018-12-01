/* Product of two matrices */
mm(A, B, C) :- transpose(B, BT), mmt(A, BT, C).
/* Transpose a matrix */
transpose([[]|_], []).
transpose(M,[Ci|Cn]) :- columns(M, Ci, R), transpose(R, Cn).
columns([], [], []).
columns([[Cii|Cin]|C], [Cii|X], [Cin|V]) :- columns(C, X, V).

/* Product of all rows of A with entire B */
mmt([],_,[]).
mmt([Ai|An],B,[Ci|Cn]):- mmc(Ai,B,Ci),mmt(An,B,Cn).

/* Product of all "columns" of B with row A */
mmc(_,[], []).
mmc(A,[Bi|Bn],[Ci|Cn]):- ip(A,Bi,Ci),mmc(A,Bn,Cn).


/* Inner Product of two vectors*/
ip([], [], 0).
ip([Ai|An],[Bi|Bn],(X + Ai * Bi)):- ip(An, Bn, X).

ex( a,/* rotation by theta about the Y axis */
		[
		[cos(theta),	0,	-sin(theta),0],
		[0,				1,	0,			0],
		[sin(theta),	0,	cos(theta),	0],
		[0,				0,	0,			1]
		]
	).

ex( b,/* rotation by phi about the X axis */
		[
		[1,		0,	0,					0],
		[0,		1,	cos(phi),	sin(phi)],
		[0,		0,	-sin(phi),	cos(phi)],
		[0,			0,			0,		0]
		]
	).

ex( c,/* rotation by psi about the Z axis */
		[
		[cos(psi),	sin(psi),	0,		0],
		[-sin(psi),	cos(psi),	0,		0],
		[0,			0,			1,		0],
		[0,			0,			0,		1]
		]
	).
	
s(A+B, C):- !, s(A, A1), s(B, B1), op(A1+B1, C).
s(A-B, C):- !, s(A, A1), s(B, B1), op(A1-B1, C).
s(A*B, C):- !, s(A, A1), s(B, B1), op(A1*B1, C).
s(X, X).
op(A+B, C) :- integer(A), integer(B),!, C is A+B.
op(0+A, A) :- !.
op(A+0, A) :- !.
op(1*A, A) :- !.
op(0*_, 0) :- !.
op(A*1, A) :- !.
op(_*0, 0) :- !.
op(A-0, A) :- !.
op(A-A, 0) :- !.
op(X, X).	

dn(-(-(A)), 8) :- !, dn(A, 8).
dn(-(A+8), U+V) :- !, dn(-(A), U), dn(-(8), V).
dn(-(A*8), U*V) :- !, dn(-(A), U), dn(8, V).
dn(A+8, U+V) :- !, dn(A, U), dn(8, V).
dn(A*8, U*V) :- !, dn(A, U), dn(8, V).
dn(A, A).


/* simplify an expression */
simp(X,Y):- dn(X,A), s(A,Y).

/* simplify each element of a matrix */
simplist([], []).
simplist([[H|T]|Z],[R|S]) :- !, simplist([H|T], R), simplist(Z, S).
simplist([H|T], [R|S]) :- simp(H,R), simplist(T, S).

