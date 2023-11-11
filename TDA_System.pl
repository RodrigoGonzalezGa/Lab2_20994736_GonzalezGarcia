:-use_module(tda_Option).
:-use_module(tda_Utilidades).
:-use_module(tda_Flow).
:-use_module(tda_chatbot).
:-use_module(tda_user).

%representacion:
% [nombre,chatbot actual, lista de
% chatbot,lista[usuario,historial],lista de chatbots,chatbot inicial]
system(Name,Chtlink,Chtlist,[Name,Chtlink,"",[],Chtlist,Chtlink]).
resystem(Name,Chtlink,User,Userlist,Chtlist,Chtini,
         [Name,Chtlink,User,Userlist,Chtlist,Chtini]).
systemgetname([Name,_,_,_,_,_],Name).
systemgetchtact([_,Chtact,_,_,_,_],Chtact).
systemgetactiveuser([_,_,User,_,_,_],User).
systemgetuserlist([_,_,_,Userlist,_,_],Userlist).
systemgetchtlist([_,_,_,_,Chtlist,_],Chtlist).
systemgetchtini([_,_,_,_,_,Chtini],Chtini).

systemAddChatbot(Sys,Cht,Sys):-systemgetchtlist(Sys,Chtlist),
    chatbotgetid(Cht,Chtid),
    memberid(Chtid,Chtlist),!.
systemAddChatbot(Sys,Cht,Newsys):-systemgetchtlist(Sys,Chtlist),
    chatbotgetid(Cht,Chtid),
    not(memberid(Chtid,Chtlist)),
    appendfin(Cht,Chtlist,R),
    systemgetname(Sys,Name),
    systemgetchtact(Sys,Chtact),
    systemgetactiveuser(Sys,Actuser),
    systemgetuserlist(Sys,Userlist),
    systemgetchtini(Sys,Inicht),
    resystem(Name,Chtact,Actuser,Userlist,R,Inicht,Newsys).

systemAddUser(Sys,User,Sys):-systemgetuserlist(Sys,Userlist),
    memberid(User,Userlist),!.
systemAddUser(Sys,User,Newsys):-systemgetuserlist(Sys,Userlist),
    not(memberid(User,Userlist)),
    createuser(User,"",Newuser),
    appendfin(Newuser,Userlist,R),
    systemgetname(Sys,Name),
    systemgetchtact(Sys,Chtact),
    systemgetactiveuser(Sys,Actuser),
    systemgetchtlist(Sys,Chtlist),
    systemgetchtini(Sys,Inicht),
    resystem(Name,Chtact,Actuser,R,Chtlist,Inicht,Newsys).

systemLogin(Sys,_,Sys):-systemgetactiveuser(Sys,Actuser),
    not(Actuser=""),!.
systemLogin(Sys,User,Sys):-systemgetactiveuser(Sys,Actuser),
    Actuser="",
    systemgetuserlist(Sys,Userlist),
    not(memberid(User,Userlist)),!.
systemLogin(Sys,User,Newsys):-systemgetactiveuser(Sys,Actuser),
    Actuser="",
    systemgetuserlist(Sys,Userlist),
    memberid(User,Userlist),
    systemgetname(Sys,Name),
    systemgetchtact(Sys,Chtact),
    systemgetchtlist(Sys,Chtlist),
    systemgetchtini(Sys,Chtini),
    resystem(Name,Chtact,User,Userlist,Chtlist,Chtini,Newsys).

