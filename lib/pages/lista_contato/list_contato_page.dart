import 'package:contato_form/pages/lista_contato/list_contatos.dart';
import 'package:contato_form/pages/novo_contato/new_contato_page.dart';
import 'package:flutter/material.dart';

import 'contato_drawer.dart';

class ListContatoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ContatoDrawer(),
        appBar: AppBar(
          title: Text('Meus Contatos'),
          actions: [
            IconButton(
                icon: Icon(Icons.add), onPressed: () => sendNewContato(context))
          ],
        ),
        body: ListContatos());
  }

  sendNewContato(BuildContext context) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) => NewContatoPage()));
  }

}
