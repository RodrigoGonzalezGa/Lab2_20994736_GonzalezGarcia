:- module('TDA_Option_20994736_GonzalezGarcia',
          [option/6,optiongetcode/2,optiongetmsg/2,optiongetcht/2,optiongetflw/2,optiongetkey/2]).
:-use_module("TDA_Utilidades_20994736_GonzalezGarcia").
%Dominios:Code (Integer)
%Message (String)
%Chtlink (Integer)
%Flowlink (Integer)
%List (String List)

%Predicados:
%option(Code,Message,Chtlink,Flowlink,List,Option)
%Meta principal: option
%Meta secundaria: checkrepeat
%optiongetcode(Option,Code)
%optiongetmsg(Option,Msg)
%optiongetcht(Option,Chtlink)
%optiongetflw(Option,Flw)
%optiongetkey(Option,List)
option(Code,Message,Chtlink,FlowLink,List,[Code,Message,Chtlink,FlowLink,List]):-checkrepeat(List).
optiongetcode([Code,_,_,_,_],Code).
optiongetmsg([_,Msg,_,_,_],Msg).
optiongetcht([_,_,Cht,_,_],Cht).
optiongetflw([_,_,_,Flw,_],Flw).
optiongetkey([_,_,_,_,Keys],Keys).
