:- module(tda_system_20994736_gonzalezgarcia,
          [system/4,resystem/7,systemgetname/2,systemgetchtact/2,
          systemgetactiveuser/2,systemgetuserlist/2,
          systemgetchtlist/2,systemgetchtini/2,systemresetchatbots/2,
          systemAddChatbot/3,systemAddUser/3,systemLogin/3,
          systemLogout/2]).

:-use_module("TDA_Utilidades_20994736_GonzalezGarcia").
:-use_module("TDA_Option_20994736_GonzalezGarcia").
:-use_module(tda_flow_20994736_gonzalezgarcia).
:-use_module("tda_chatbot_20994736_gonzalezgarcia").
:-use_module("TDA_User_20994736_GonzalezGarcia").
% Dominios:Name(String),Chtlink(Integer),Chtlist(Chatbotlist),
%User([string,string]),Userlist(User List),Chtini(Integer),
%Sys/Newsys/Sysfin/Sysres(System),Chtact(Integer)

%Predicados
%system(Name,Chtlink,Chtlist,[Name,Chtlink,"",[],Chtlist,Chtlink]):-checkrepeat(Chtlist).
%resystem(Name,Chtlink,User,Userlist,Chtlist,Chtini,[Name,Chtlink,User,Userlist,Chtlist,Chtini]).
%systemgetname(System,Name).
%systemgetchtact(System,Chtact).
%systemgetactiveuser(System,User).
%systemgetuserlist(System,Userlist).
%systemgetchtlist(System,Chtlist).
%systemgetchtini(Syste,,Chtini).
%
%systemresetchatbots(ChatbotList,ChatbotList):-chatbotresetid(H,Res),!.
%Metas principales: systemresetchatbots
%Metas secundarias: chatbotresetid
%
%systemAddChatbot(Sys,Cht,Sys)
%Meta principal:systemAddChatbot
% Metas secundarias:
% systemgetchtlist, appendfin, checkrepeatid, systemgetname,
% systemgetchtact,
% systemgetactiveuser,systemgetuserlist,systemgetchtini,
% Resystem
%
% systemAddUser(Sys,Usr,Sys)
% Metas principales: systemAddUser
% Metas secundarias:systemgetuserlist, createuser,
% appendfin, checkrepeatid, systemgetname, systemgetchtact
% systemgetactiveuser, systemgetchtlist, systemgetchtini,
% resystem
%
% systemLogin(Sys,User,Sys)
% Meta principal: SystemLogin
% Metas secundarias: systemgetactiveuser, systemgetuserlist,
% memberid, systemgetname, systemgetchtact, systemgetchtlist,
% systemgetchtini, resystem
%
% SystemLogout(Sys,Sys)
% Meta principal: systemLogout
% Metas seundarias: systemgetactiveuser, systemgetchtlist
% systemresetchatbots, systemgetname, systemgetuserlist
% systemgetchtini, resystem
%
%
%[nombre,chatbotactual, lista de chatbot,lista[usuario,historial],lista de
% chatbots,chatbot inicial]
system(Name,Chtlink,Chtlist,[Name,Chtlink,"",[],Chtlist,Chtlink]):-checkrepeat(Chtlist).
resystem(Name,Chtlink,User,Userlist,Chtlist,Chtini,
         [Name,Chtlink,User,Userlist,Chtlist,Chtini]).
systemgetname([Name,_,_,_,_,_],Name).
systemgetchtact([_,Chtact,_,_,_,_],Chtact).
systemgetactiveuser([_,_,User,_,_,_],User).
systemgetuserlist([_,_,_,Userlist,_,_],Userlist).
systemgetchtlist([_,_,_,_,Chtlist,_],Chtlist).
systemgetchtini([_,_,_,_,_,Chtini],Chtini).
systemresetchatbots([H],[Res]):-chatbotresetid(H,Res),!.
systemresetchatbots([H|L],[Rechat|Res]):-chatbotresetid(H,Rechat),systemresetchatbots(L,Res).

systemAddChatbot(Sys,Cht,Newsys):-systemgetchtlist(Sys,Chtlist),
    appendfin(Cht,Chtlist,R),
    checkrepeatid(R),
    systemgetname(Sys,Name),
    systemgetchtact(Sys,Chtact),
    systemgetactiveuser(Sys,Actuser),
    systemgetuserlist(Sys,Userlist),
    systemgetchtini(Sys,Inicht),
    resystem(Name,Chtact,Actuser,Userlist,R,Inicht,Newsys).
systemAddUser(Sys,User,Newsys):-systemgetuserlist(Sys,Ulist),
    createuser(User,"",U1),
    appendfin(U1,Ulist,Ufin),
    checkrepeatid(Ufin),
    systemgetname(Sys,Name),
    systemgetchtact(Sys,Chtact),
    systemgetactiveuser(Sys,Actuser),
    systemgetchtlist(Sys,Chtlist),
    systemgetchtini(Sys,Inicht),
    resystem(Name,Chtact,Actuser,Ufin,Chtlist,Inicht,Newsys).

systemLogin(Sys,User,Sysfin):-systemgetactiveuser(Sys,U),
    systemgetuserlist(Sys,Ulist),
    U="",
    memberid(User,Ulist),
    systemgetname(Sys,Name),
    systemgetchtact(Sys,Chtact),
    systemgetchtlist(Sys,Chtlist),
    systemgetchtini(Sys,Inicht),
    resystem(Name,Chtact,User,Ulist,Chtlist,Inicht,Sysfin).

systemLogout(Sys,Sysres):-systemgetactiveuser(Sys,User),
    systemgetchtlist(Sys,Cht),
    not(User=""),
    systemresetchatbots(Cht,Chtres),
    systemgetname(Sys,Name),
    systemgetuserlist(Sys,Ulist),
    systemgetchtini(Sys,Iniid),
    resystem(Name,Iniid,"",Ulist,Chtres,Iniid,Sysres).

