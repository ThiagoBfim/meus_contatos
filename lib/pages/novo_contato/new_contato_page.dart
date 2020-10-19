
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'contato_form.dart';
import 'contato_model.dart';

class NewContatoPage extends StatefulWidget {
  @override
  _NewContatoPageState createState() => _NewContatoPageState();
}

class _NewContatoPageState extends State<NewContatoPage> {
  ContatoModel contato = new ContatoModel();

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
