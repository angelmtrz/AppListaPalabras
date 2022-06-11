import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const AppListaPalabras());
}

class AppListaPalabras extends StatelessWidget {
  const AppListaPalabras({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    //necesario para mostrar la pantalla del app
    //final palabra = WordPair.random();
    return MaterialApp(
      title: 'Generador Lista de Palabras',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Generador Lista de Palabras'),
        ),
        body: const Center(
          //child: Text('Hola mundo!'),
          //child: Text(palabra.asSnakeCase),
          child: ParPalabras(),
        ),
      ),
    );
  }
}

//creamos un stateful widget
class ParPalabras extends StatefulWidget {
  const ParPalabras({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ParPalabrasState();
}

//manejo del estado del widgwt ParPalabras
class _ParPalabrasState extends State<ParPalabras> {
  final _filasPalabra = <WordPair>[];
  final _letraGrande = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    //final palabra = WordPair.random();
    //return Text(palabra.asPascalCase);
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        //si el item es impar, dibuja una linea de division
        if (i.isOdd) return const Divider();
        //verifica si estoy al final de la lista
        //genera 10 filas adicionales
        final index = i ~/ 2;
        //i ~/ 2 lo que hace es dividir i entre 2 y
        //retorna un int como resultado, omite totalmente la parte decimal
        if (index >= _filasPalabra.length) {
          _filasPalabra.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _filasPalabra[index].asPascalCase,
            style: _letraGrande,
          ),
        );
      },
    );
  }
}
