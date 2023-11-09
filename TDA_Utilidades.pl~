:- module(tda_Utilidades,
          [memberp/2,memberid/2,memberid2/3]).

memberp(V,[V|_]).
memberp(H,[_|L]):-memberp(H,L).
memberid(H,[[H|_]|_]).
memberid(H,[_|L]):-memberid(H,L).
%devuelve el valor el valor que tenga la id correcta
memberid2(V,[[V,V2]|_],R):-R = [V,V2],!.
memberid2(V,[_|L],R):-memberid(V,L,R).
appendfin(V,[],[V]):-!.
appendfin(V,[H|L],[H|Res]):-appendfin(V,L,Res).
rebuild([],[_]).
rebuild([H|L],Res):-memberp(H,Res),rebuild(L,Res).
rebuild([H|L],Res):-not(memberp(H,Res)),appendfin(H,Res,R),rebuild(L,R).