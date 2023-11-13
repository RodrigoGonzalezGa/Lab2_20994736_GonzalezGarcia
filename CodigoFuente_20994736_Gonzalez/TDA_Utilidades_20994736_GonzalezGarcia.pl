:- module('TDA_Utilidades_20994736_GonzalezGarcia',
          [memberp/2,memberid/2,appendfin/3,checkrepeat/1,checkrepeatid/1]).


memberp(V,[V|_]):-!.
memberp(H,[_|L]):-memberp(H,L).
memberid(H,[[H|_]|_]):-!.
memberid(H,[_|L]):-memberid(H,L).
%devuelve el valor el valor que tenga la id correcta
memberidret(V,[[V,V2]|_],R):-R = [V,V2],!.
memberidret(V,[_|L],R):-memberidret(V,L,R).
appendfin(V,[],[V]):-!.
appendfin(V,[H|L],[H|Res]):-appendfin(V,L,Res).
checkrepeat([]).
checkrepeat([H|L]):-memberp(H,L),!,fail.
checkrepeat([_|L]):-checkrepeat(L).
checkrepeatid([]).
checkrepeatid([[H|_]|L]):-memberid(H,L),!,fail.
checkrepeatid([_|L]):-checkrepeat(L).
