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

