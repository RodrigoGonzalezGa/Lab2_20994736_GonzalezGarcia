%en teoria el option no debe ser modificado asi que a crearlo nomas
option(Code,Message,Chtlink,FlowLink,List,[Code,Message,Chtlink,FlowLink,List]).
optiongetcode([Code,_,_,_,_],Code).
optiongetmsg([_,Msg,_,_,_],Msg).
optiongetcht([_,_,Cht,_,_],Cht).
optiongetflw([_,_,_,Flw,_],Flw).
optiongetkey([_,_,_,_,Keys],Keys).
