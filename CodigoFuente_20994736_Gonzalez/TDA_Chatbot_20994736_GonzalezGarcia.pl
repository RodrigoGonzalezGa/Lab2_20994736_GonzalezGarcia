:- module(tda_chatbot_20994736_gonzalezgarcia,
          [chatbot/6,rechatbot/7,chatbotgetid/2,chatbotgetname/2,chatbotgetmsg/2,chatbotgetflowact/2,chatbotgetflows/2,chatbotgetiniflow/2,chatbotresetid/2,chatbotAddFlow/3]).
:-use_module("TDA_Utilidades_20994736_GonzalezGarcia").

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
chatbotresetid(Cht,Chtr):-chatbotgetid(Cht,Id),
    chatbotgetname(Cht,Name),
    chatbotgetmsg(Cht,Msg),
    chatbotgetflows(Cht,Flowlist),
    chatbotgetiniflow(Cht,Iniflow),
    rechatbot(Id,Name,Msg,Iniflow,Flowlist,Iniflow,Chtr).
chatbotAddFlow(Chatbot,Flow,Chtr):-chatbotgetflows(Chatbot,Flist),
    appendfin(Flow,Flist,Flistr),
    checkrepeatid(Flistr),
    chatbotgetid(Chatbot,Id),
    chatbotgetname(Chatbot,Name),
    chatbotgetmsg(Chatbot,Msg),
    chatbotgetflowact(Chatbot,Flowact),
    chatbotgetiniflow(Chatbot,Iniflow),
    rechatbot(Id,Name,Msg,Flowact,Flistr,Iniflow,Chtr).
