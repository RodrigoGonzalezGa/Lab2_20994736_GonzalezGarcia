:- module('TDA_User_20994736_GonzalezGarcia',
          [createuser/3,useraddhistory/3]).
%Dominio: Username (string)
%History (string)
%User (string)
%Newhistory (string)

%Predicados:
%createuser(Username,History,[Username,History])

%useraddhistory([User,History],Text,[User,Newhistory])
%Meta primaria: useraddhistory
%Meta Secundaria:  string_concat
createuser(Username,History,[Username,History]).
useraddhistory([User,History],Text,[User,Newhistory]):-string_concat(History,Text,Newhistory).
