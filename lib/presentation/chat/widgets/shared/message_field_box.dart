import 'package:flutter/material.dart';
class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, 
  required this.onValue});

  @override
  Widget build(BuildContext context) {

final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',

        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled:true,//pinta la barra de chat en la parte inferior
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text;
            onValue(textValue);
          },
      )
    );

    return TextFormField(//escribir en el chat, se trae desde una variable
    onTapOutside: (event){// es para poder salir del chat dandole clic fuera del teclado.
      focusNode.unfocus();
    },
    focusNode: focusNode,
    controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {//se ejecuta el vio de chat y el reinicio al enviar
        onValue(value);
        textController.clear();// limpia el teclado cuando le envias done
        focusNode.requestFocus(); // es para poder salir del chat dandole clic fuera del teclado.
      },
    );
  }
}