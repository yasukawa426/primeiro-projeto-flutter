import 'package:flutter/material.dart';

import 'random_words.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //o metodo build é rodado td vez q o app MaterialApp vai renderizar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerador de nome para Startup',
      theme: ThemeData(//configuração do tema
        listTileTheme: const ListTileThemeData( //tema do listTile
          tileColor: Colors.white10, //cor de cada tile
          textColor: Colors.black, //cor da fonte dentro de cada tile
        ),
        dividerColor: Colors.amber, //cor do divisor
        appBarTheme: const AppBarTheme( //configuração do tema da barra
          backgroundColor: Colors.black, //o fundo ta branco
          foregroundColor: Colors.white,
          shadowColor: Colors.purple, //a cor das sombras
          elevation: 3, //define o tamanho das sombras
        ),
      ),
      home: const RandomWords(),
    );
  }
}

