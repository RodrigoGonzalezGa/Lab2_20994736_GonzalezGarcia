:- module(tda_flow_20994736_gonzalezgarcia,
          [flow/4,flowgetid/2,flowgetmsg/2,flowgetop/2,flowAddOption/3]).
:-use_module("TDA_Utilidades_20994736_GonzalezGarcia").
%dominios:Id(Integer)
%Msg (String)
%Oplist(Option List)
%Option (Option)
%Flow/Flowres (Flow)

%Predicados:
%flow(Id,Msg,Oplist,Flow)
%Meta principal: flow
%Meta secundaria checkrepeatid
%flowgetid(Flow,Id)
%flowgetop(Flow,Optionlist)
%flowAddOption(Flow,Option,Flowres)
%Meta principal: flowAddOption
%Metas secundarias:flowgetid
%flowgetmsg
%flowgetop
%appendfin
%checkrepeatid
%flow
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

