// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //o metodo build é rodado td vez q o app MaterialApp vai renderizar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bem Vindo ao Flutter'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

//uma classe generica de state feita para a nossa classe RandomWords
class _RandomWordsState extends State<RandomWords> {
  //lista de  q vai salvar as sugestoes de palavras
  final _suggestions = <WordPair>[];
  //uma variaves q vai controlar o tamanho da fonte
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) { // a call back itemBuilder é chama uma vez por par sugerido e coloca cada sugestao em uma coluna ListTile. Para colunas pares, a função coloca uma coluna ListTile para o par. Para impar, a função coloca um Divider para visualmente separar as 
          if (i.isOdd) return const Divider(); // coloca um divisor de 1pixel de altura

          final index = i ~/ 2; //divide i por 2 e devolve um inteiro
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); //se chegou ao fim de pares disponiveis, gera mais 10 e adiciona na lista de sugestoes
          }

          return Text(_suggestions[index].asPascalCase);
        });
  }
}
