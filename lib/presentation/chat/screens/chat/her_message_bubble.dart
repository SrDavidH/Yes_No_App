import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({super.key, required this.message});


  @override
  Widget build(BuildContext context) {

    final colors =Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,//tira las columnas hasta la izquierda
      children: [
        Container(
          decoration:  BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(message.imageUrl!),

        const SizedBox(height: 5),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble(
   this.imageUrl);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // se crea un borde del gif
      child: Image.network(
        imageUrl,// Se implementa un gif
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover, // redondea las puntas
        loadingBuilder: (context, child, loadingProgress) {// el loading es para poder mostrar un mensaje mientras carga el gif
          if (loadingProgress ==null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
            child: const Text('Mi amor esta enviando una imagen')
          );
        },
       )
    );
  }
}

