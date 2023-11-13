:- module('TDA_User_20994736_GonzalezGarcia',
          [createuser/3,useraddhistory/3]).

createuser(Username,History,[Username,History]).
useraddhistory([User,History],Text,[User,Newhistory]):-string_concat(History,Text,Newhistory).
