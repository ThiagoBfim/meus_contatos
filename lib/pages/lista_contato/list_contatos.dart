import 'package:contato_form/model/contato_type.dart';
import 'package:contato_form/pages/novo_contato/contato_model.dart';
import 'package:contato_form/pages/novo_contato/new_contato_page.dart';
import 'package:contato_form/repository/contato_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';

class ListContatos extends StatefulWidget {
  @override
  _ListContatosState createState() => _ListContatosState();
}

class _ListContatosState extends State<ListContatos> {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          var contato = ContatoRepository().findAllContatos()[index];
          return ListTile(
            onTap: () => sendEditContato(context, contato),
            leading: CircleAvatar(
              child: ContatoHelper.getIconByContatoType(contato.tipo),
              backgroundColor: Colors.blue[200],
            ),
            title: Text(contato.nome),
            subtitle: Text(contato.telefone),
            trailing: IconButton(
              icon: Icon(Icons.call),
              onPressed: () => FlutterPhoneState.startPhoneCall(contato.telefone),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: ContatoRepository().findAllContatos().length);
  }

  sendEditContato(BuildContext context, contato) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) => NewContatoPage.edit(contato: BaseContatoModel.fromContato(contato))));
  }
}
