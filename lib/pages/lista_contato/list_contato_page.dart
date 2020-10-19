import 'package:contato_form/model/contato_type.dart';
import 'package:contato_form/pages/novo_contato/new_contato_page.dart';
import 'package:contato_form/repository/contato_repository.dart';
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
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = ContatoRepository().findAllContatos()[index];
              return ListTile(
                leading: CircleAvatar(
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                  backgroundColor: Colors.blue[200],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () => {},
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: ContatoRepository().findAllContatos().length));
  }

  sendNewContato(BuildContext context) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) => NewContatoPage()));
  }
}
