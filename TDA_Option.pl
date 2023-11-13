%en teoria el option no debe ser modificado asi que a crearlo nomas
:-module(tda_Option,[option/6,optiongetcode/2,optiongetmsg/2,optiongetcht/2,optiongetflw/2,optiongetkey/2]).
option(Code,Message,Chtlink,FlowLink,List,[Code,Message,Chtlink,FlowLink,List]):-checkrepeat(List).
optiongetcode([Code,_,_,_,_],Code).
optiongetmsg([_,Msg,_,_,_],Msg).
optiongetcht([_,_,Cht,_,_],Cht).
optiongetflw([_,_,_,Flw,_],Flw).
optiongetkey([_,_,_,_,Keys],Keys).
