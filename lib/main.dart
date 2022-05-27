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
    return const MaterialApp(
      title: 'Gerador de nome para Startup',
      home: RandomWords(),
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
  //salva os pares q o usuario favoritou. Set é preferivel doq List porque não permite entradas duplicadas
  final _saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //app bar é tipo um navbar
        title: const Text('Gerador de nome para Startup'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list), //adiciona um icone de lista
            onPressed: _pushSaved,  //executa essa função ao apertar
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
    body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // a call back itemBuilder é chama uma vez por par sugerido e coloca cada sugestao em uma coluna ListTile. Para colunas pares, a função coloca uma coluna ListTile para o par. Para impar, a função coloca um Divider para visualmente separar as
          if (i.isOdd)
            return const Divider(); // coloca um divisor de 1pixel de altura

          final index = i ~/ 2; //divide i por 2 e devolve um inteiro
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(
                10)); //se chegou ao fim de pares disponiveis, gera mais 10 e adiciona na lista de sugestoes
          }

          //check para garantir que um par ja n foi adicionado aos favoritos
          final alreadySaved = _saved.contains(_suggestions[index]);

          return ListTile(
            //Uma ListTile é uma coluna com altura fixa q contem texte junto com icones ou outros widgets
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
                //trailing é algo q vai ser mostrado dps do titulo
                alreadySaved
                    ? Icons.favorite
                    : Icons
                        .favorite_border, //se ta no alreadySaved, o icone vai ser um coração cheio vermelho
                color: alreadySaved ? Colors.red : null,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save'),
            onTap: () {
              //executa quando o icone (o list tile) é apertado
              setState(() {
                //notifica o frame work q o state mudou
                if (alreadySaved) {
                  //se ja estiver no favorito, remove do favorito
                  _saved.remove(_suggestions[index]);
                } else {
                  // se n, adiciona
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        })
    );
  }

  void _pushSaved(){

  }
}
