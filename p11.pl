:- ensure_loaded(library(pairs)).
books([], []).
books(Xs, Ys):-
    pairs_keys(Xs, Ks),
    sort(Ks, Uks),
    helper(Uks, Ks, Ys).

helper([], _, []).
helper([U|Us], Ks, Rs):-
    getN(U, Ks, N),
    append([U-N], R1, Rs),
    helper(Us, Ks, R1).


getN(W, [W|Ks], N):- getN(W, Ks, N1), N is N1 + 1.
getN(W, [K|Ks], N):- W\=K, getN(W, Ks, N).
getN(_, [], 0).