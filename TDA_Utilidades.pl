memberp(V,[V|_]).
memberp(H,[_|L]):-memberp(H,L).
memberid(H,[[H|_]|_]).
memberid(H,[_|L]):-memberid(H,L).