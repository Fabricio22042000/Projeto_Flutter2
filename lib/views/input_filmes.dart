import 'package:fabricio2/model/filme.dart';
import 'package:flutter/material.dart';

class InputFilme extends StatefulWidget {
  const InputFilme({Key? key}) : super(key: key);

  @override
  _InputFilmeState createState() => _InputFilmeState();
}

class _InputFilmeState extends State<InputFilme> {
  TextEditingController edtTitulo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text("Cadastro De Titulos"),
    );
  }

  buildBody(){
    return Container(
      child: Column(
        children: [
          TextField(
            controller: edtTitulo,
            decoration: InputDecoration(labelText: "Titulo:"),
          )
        ],
      ),
    );
  }

  buildFloatingActionButton(){
    return FloatingActionButton(
      onPressed: () {
        actionBackListFilmes();
      },
      child: Icon(Icons.save),
    );
  }

  void actionBackListFilmes() {
    var snack;
    if (edtTitulo.text.isEmpty) {
      snack = SnackBar(
        content: Text("Informe algum titulo"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return;
    }

    Filme filme = Filme(edtTitulo.text);
    Navigator.pop(context, filme);
  }
}
