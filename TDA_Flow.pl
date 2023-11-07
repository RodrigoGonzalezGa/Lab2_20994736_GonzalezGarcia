:- module(tda_flow,
          [flow/4,flowgetid/2,flowgetmsg/2,flowgetop/2,flowAddOption/3]).

:-use_module(tda_Option).
:-use_module(tda_Utilidades).

flow(Id,Msg,Oplist,[Id,Msg,Oplist]).
flowgetid([Id,_,_],Id).
flowgetmsg([_,Msg,_],Msg).
flowgetop([_,_,Op],Op).
flowAddOption(Flow,Option,Flow):-optiongetcode(Option,Code),flowgetop(Flow,Oplist),
    memberid(Code,Oplist),!.
flowAddOption(Flow,Option,Flowres):-optiongetcode(Option,Code),flowgetid(Flow,Id),
    flowgetmsg(Flow,Msg),
    flowgetop(Flow,Oplist),
    not(memberid(Code,Oplist)),
    flow(Id,Msg,[Option|Oplist],Flowres).

