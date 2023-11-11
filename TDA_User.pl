:- module(tda_user,
          [createuser/3,useraddhistory/3]).

createuser(Username,History,[Username,History]).
useraddhistory([User,History],Text,[User,Newhistory]):-string_concat(History,Text,Newhistory).
