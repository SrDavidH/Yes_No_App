import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class MyMessageBubble extends StatelessWidget {

  final Message message;
  const MyMessageBubble({
    super.key, required this.message});
  


  @override
  Widget build(BuildContext context) {

    final colors =Theme.of(context).colorScheme;
    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,//tira las columnas hasta la izquierda
      children: [
        Container(
          decoration:  BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
               style: const TextStyle(color: Colors.white)
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}