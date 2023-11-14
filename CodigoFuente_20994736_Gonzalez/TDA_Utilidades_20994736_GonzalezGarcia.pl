:- module('TDA_Utilidades_20994736_GonzalezGarcia',
          [memberp/2,memberid/2,appendfin/3,checkrepeat/1,checkrepeatid/1]).
%Dominio: V (Integer/String)
%H (Integer/String)
%L (List)
%V,V2 (Integer/String)
%R,Res (List)

%Predicados:memberp(V,List)
%memberid(H,List)
%memberidret(V,List)
%appendfin(V,List,ListResultado)
%checkrepeat(List)
%checkrepeatid(List)

memberp(V,[V|_]):-!.
memberp(H,[_|L]):-memberp(H,L).
memberid(H,[[H|_]|_]):-!.
memberid(H,[_|L]):-memberid(H,L).
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
