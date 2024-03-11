import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/chat/screens/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/chat/screens/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/chat/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';// impm

class ChatScreen extends StatelessWidget { //stlesw
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: const Padding( 
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKynccaew-HVQBLBQ7WJV15ec6gpumCd-w9Q&usqp=CAU'),
          ),
        ),
      title: const Text('Mi Amor'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>(); 

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),//Me permite manejar el tamanho del recuadro, esto se consiguien envolviendo el column en un pading
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];

              return (message.fromWho == FromWho.hers)
              ?  HerMessageBubble( message:message)
              :  MyMessageBubble( message:message);
              
            },
            ) 
            ),
          // Caja de texto de mensajes
         MessageFieldBox(
          onValue: (value) => chatProvider.sendMessage(value),
         ),
          ],
        ),
      ),
    );
  }
}
