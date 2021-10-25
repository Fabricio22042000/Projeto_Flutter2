import 'package:fabricio2/model/filme.dart';
import 'package:flutter/material.dart';

import 'input_filmes.dart';

class ListaFilmes extends StatefulWidget {
  const ListaFilmes({Key? key}) : super(key: key);

  @override
  _ListaFilmesState createState() => _ListaFilmesState();
}

class _ListaFilmesState extends State<ListaFilmes> {
  List<Filme> filmes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatActionButton(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text("Lista Filmes"),
    );
  }

  buildBody() {
    return ListView.builder(
        itemCount: filmes.length,
        itemBuilder: (context, index) {
          return itemBuilder(index);
        });
  }

  buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: () {
        ActionNavigationInputFilme();
      },
      child: Icon(Icons.add),
    );
  }

  itemBuilder(int index) {
    return Container(
      height: 100,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Titulo: ${filmes[index].titulo}"),
          ],
        ),
      ),
    );
  }

  ActionNavigationInputFilme() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InputFilme();
    })).then((filme) {
      setState(() {
        filmes.add(filme);
      });
    });
  }
}
