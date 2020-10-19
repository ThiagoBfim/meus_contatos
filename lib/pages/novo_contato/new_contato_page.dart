import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'contato_form.dart';
import 'contato_model.dart';

class NewContatoPage extends StatefulWidget {
  final ContatoModel contato;

  const NewContatoPage.edit({Key key, this.contato}) : super(key: key);

  NewContatoPage() : this.contato = new ContatoModel();

  @override
  _NewContatoPageState createState() => _NewContatoPageState(contato);
}

class _NewContatoPageState extends State<NewContatoPage> {
  final ContatoModel contato;

  _NewContatoPageState(this.contato);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) => Text(contato.nome ?? '')),
      ),
      body: ContatoForm(contato: contato),
    );
  }
}
