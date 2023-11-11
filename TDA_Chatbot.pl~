:-use_module(tda_Option).
:-use_module(tda_Utilidades).
:-use_module(tda_Flow).
% correccion total de selectores de chatbot, predicado rechatbot que
% permite recrear un chatbot incluyendo el flow inicial, añadido
% predicado chatbotAddFlow que permite añadir un Flow a un Chatbot,
% asegurando que estos no se repitan
chatbot(Id,Name,Msg,Idflow,Flows,[Id,Name,Msg,Idflow,Flows,Idflow]).
rechatbot(Id,Name,Msg,Idflow,Flows,Flowini,[Id,Name,Msg,Idflow,Flows,Flowini]).
chatbotgetid([Id,_,_,_,_,_],Id).
chatbotgetname([_,Name,_,_,_,_],Name).
chatbotgetmsg([_,_,Msg,_,_,_],Msg).
chatbotgetflowact([_,_,_,Flow,_,_],Flow).
chatbotgetflows([_,_,_,_,Flows,_],Flows).
chatbotgetiniflow([_,_,_,_,_,Ini],Ini).
chatbotAddFlow(Chatbot,Flow,Chatbot):-chatbotgetflows(Chatbot,FList),flowgetid(Flow,Fid),
    memberid(Fid,FList).
chatbotAddFlow(Chatbot,Flow,Ch2):-chatbotgetflows(Chatbot,FList),flowgetid(Flow,Fid),
    not(memberid(Fid,FList)),
    appendfin(Flow,FList,R),
    chatbotgetid(Chatbot,Id),
    chatbotgetname(Chatbot,Name),
    chatbotgetmsg(Chatbot,Msg),
    chatbotgetflowact(Chatbot,Flowact),
    chatbotgetiniflow(Chatbot,Iniflow),
    rechatbot(Id,Name,Msg,Flowact,R,Iniflow,Ch2).
