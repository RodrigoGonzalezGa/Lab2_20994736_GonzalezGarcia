memberp(V,[V|_]).
memberp(H,[_|L]):-memberp(H,L).
memberid(H,[[H|_]|_]).
memberid(H,[_|L]):-memberid(H,L).
%devuelve el valor el valor que tenga la id correcta
memberid2(V,[[V,V2]|_],R):-R = [V,V2].
memberid2(V,[_|L],R):-memberid(V,L,R).