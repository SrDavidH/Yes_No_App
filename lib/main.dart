import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/chat/chat_screen.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart'; //mateapp es una palabra que nos auda a crear un proyecto base

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()) //chat provider a nivel global de la aplicacion, los widgets hijos,tienen acceso a la info
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 2).theme(),
        home: const ChatScreen()
      ),
    );
  }
}