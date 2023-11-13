:- module(tda_flow_20994736_gonzalezgarcia,
          [flow/4,flowgetid/2,flowgetmsg/2,flowgetop/2,flowAddOption/3]).
:-use_module("TDA_Utilidades_20994736_GonzalezGarcia").


flow(Id,Msg,Oplist,[Id,Msg,Oplist]):-checkrepeatid(Oplist).
flowgetid([Id,_,_],Id).
flowgetmsg([_,Msg,_],Msg).
flowgetop([_,_,Op],Op).
flowAddOption(Flow,Option,Flowres):-flowgetid(Flow,Id),
    flowgetmsg(Flow,Msg),
    flowgetop(Flow,Oplist),
    appendfin(Option,Oplist,Listfin),
    checkrepeatid(Listfin),
    flow(Id,Msg,Listfin,Flowres).
