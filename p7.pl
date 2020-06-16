q(d,a). q(a,b). q(c,a). 
r(c,d).

r(X,Z) :- q(Z,X).
r(X,Z) :- r(X,Y), r(Y,Z).

t(X,Y) :- q(X,Z), r(Z,Y).