flow(Id,Msg,Oplist,[Id,Msg,Oplist]).
flowgetid([Id,_,_],Id).
flowgetmsg([_,Msg,_],Msg).
flowgetop([_,_,Op],Op).

