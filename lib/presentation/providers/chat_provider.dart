import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{// puede notificar cuando hay cambios

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

List<Message> messageList = [
  Message(text: 'Hola amor!', fromWho: FromWho.me),
  Message(text: 'Ya regresaste del trabajo!', fromWho: FromWho.me),

];

Future<void> sendMessage(String text) async {// cuando escribo el mensaje y lo envio, deberia recibirlo
if(text.isEmpty) return;//Nos permite negar enviar mensajes vacios

  final newMessage = Message(text: text, fromWho: FromWho.me);//
  messageList.add(newMessage);

if (text.endsWith('?')){//Cuando el texto termina en ?, hara que responda el controlador
 herReply();
}

  notifyListeners();//es lo mismo al setState, el cual le indica a flutter que se hizo un cambio
  moveScrollToBottom();

}

Future<void> herReply() async{
  final herMessage = await getYesNoAnswer.getAnswer();//obtiene la respuesta del chat 
  messageList.add(herMessage);
  notifyListeners();
  moveScrollToBottom();
}

Future<void> moveScrollToBottom() async{ //metodo que nos permite desplazarnos al copiar un mensaje

await Future.delayed(const Duration(milliseconds: 100));
  chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent, //maxima velocidad para desplazarse hacia abajo
    duration: const Duration(milliseconds: 300),// duration en actuar la animacion
    curve: Curves.easeOut); //Nos permite encontrar el estilo del Scroll
}

}