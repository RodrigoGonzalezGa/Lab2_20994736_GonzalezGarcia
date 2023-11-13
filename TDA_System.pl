:-use_module(tda_Option).
:-use_module(tda_Utilidades).
:-use_module(tda_Flow).
:-use_module(tda_chatbot).
:-use_module(tda_user).

%representacion:
% [nombre,chatbot actual, lista de
% chatbot,lista[usuario,historial],lista de chatbots,chatbot inicial]
system(Name,Chtlink,Chtlist,[Name,Chtlink,"",[],Chtlist,Chtlink]):-checkrepeat(Chtlist).
resystem(Name,Chtlink,User,Userlist,Chtlist,Chtini,
         [Name,Chtlink,User,Userlist,Chtlist,Chtini]).
systemgetname([Name,_,_,_,_,_],Name).
systemgetchtact([_,Chtact,_,_,_,_],Chtact).
systemgetactiveuser([_,_,User,_,_,_],User).
systemgetuserlist([_,_,_,Userlist,_,_],Userlist).
systemgetchtlist([_,_,_,_,Chtlist,_],Chtlist).
systemgetchtini([_,_,_,_,_,Chtini],Chtini).
systemresetchatbots([H],Res):-chatbotresetid(H,Res),!.
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

